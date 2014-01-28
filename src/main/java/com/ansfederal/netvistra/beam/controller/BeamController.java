package com.ansfederal.netvistra.beam.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import com.ansfederal.netvistra.beam.domain.IndexSourceEntity;
import com.ansfederal.netvistra.beam.domain.IndexSourceManager;
import com.ansfederal.netvistra.beam.domain.TestEntity;
import com.ansfederal.netvistra.beam.service.SplunkService;
import com.ansfederal.netvistra.beam.service.TestService;
import com.ansfederal.netvistra.beam.validator.IndexSourceTypeValidator;

@Controller
public class BeamController {

	@Autowired
	private TestService testService;

	@Autowired
	private SplunkService splunkService;

	private IndexSourceTypeValidator indexSourceTypeValidator;

	@Value("${splunk.url}")
	private String splunkUrl;

	@Autowired
	public BeamController(IndexSourceTypeValidator indexSourceTypeValidator) {
		this.indexSourceTypeValidator = indexSourceTypeValidator;
	}

	private static final Logger logger = Logger.getLogger(BeamController.class);

	@RequestMapping(value = "/")
	public String test(ModelMap map) {
		logger.debug("Dashboard");
		return "dashboard";
	}

	@RequestMapping(value = "/config", method = RequestMethod.GET)
	public String splunkIndexSourceList(ModelMap map) throws IOException,
			InterruptedException {
		logger.debug("Index Source List");
		List<IndexSourceEntity> indexSourceList = splunkService
				.getSplunkIndexSourceType();
		IndexSourceManager indexSourceManager = new IndexSourceManager();
		indexSourceManager.setIndexSourceList(indexSourceList);

		map.addAttribute("indexSourceManager", indexSourceManager);
		return "indexsourceconfig";
	}

	@RequestMapping(value = "/storeUserConfig", method = RequestMethod.POST)
	public String selectedSplunkIndexSourceList(
			@ModelAttribute("indexSourceManager") IndexSourceManager indexSourceManager,
			BindingResult result, SessionStatus status, ModelMap map) {

		List<IndexSourceEntity> indexSourceList = indexSourceManager
				.getIndexSourceList();

		indexSourceTypeValidator.validate(indexSourceList, result);

		if (result.hasErrors()) {
			// if validator failed
			return "splunksettings";
		} else {
			status.setComplete();
			List<IndexSourceEntity> indexSourceListFinal = splunkService
					.createSelectedIndexSource(indexSourceList);

			// Delete all and insert new selection
			List<IndexSourceEntity> indexSourceListDelete = splunkService
					.getAll();
			for (int i = 0; i < indexSourceListDelete.size(); i++)
				splunkService.delete(indexSourceListDelete.get(i).getId());

			for (IndexSourceEntity indexSourceEntity : indexSourceListFinal)
				splunkService.create(indexSourceEntity);
			
			map.addAttribute("splunkUrl", splunkUrl);
			return "dashboard";
		}
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String goToLogin() {
		logger.debug("In login");
		return "login";
	}

	@RequestMapping(value = "/splunksettings", method = RequestMethod.GET)
	public String goToSplunkSettings(ModelMap map) throws IOException,
			InterruptedException {
		logger.debug("In splunk settings");

		// Check to see if there are selected
		List<IndexSourceEntity> indexSourceListDb = splunkService.getAll();
		List<IndexSourceEntity> indexSourceList = splunkService
				.getSplunkIndexSourceType();
		// If any selected update splunk list with selected to form backing
		// object
		if (indexSourceListDb.size() > 0) {
			logger.debug("Something in DB Doing Compare.");
			for (int i = 0; i < indexSourceListDb.size(); i++) {
				for (int j = 0; j < indexSourceList.size(); j++) {
					if (indexSourceListDb.get(i).getSplunkIndex()
							.equals(indexSourceList.get(j).getSplunkIndex())
							&& indexSourceListDb
									.get(i)
									.getSourceType()
									.equals(indexSourceList.get(j)
											.getSourceType())) {
						indexSourceListDb.get(i).setSelected(true);
						indexSourceList.set(j, indexSourceListDb.get(i));
						logger.debug("Item Found "
								+ indexSourceList.get(j).getSplunkIndex()
								+ " : "
								+ indexSourceList.get(j).getSourceType());
					}
				}
			}
		} else
			indexSourceList = splunkService.getSplunkIndexSourceType();

		IndexSourceManager indexSourceManager = new IndexSourceManager();
		indexSourceManager.setIndexSourceList(indexSourceList);

		map.addAttribute("indexSourceManager", indexSourceManager);
		map.addAttribute("splunkUrl", splunkUrl);
		return "splunksettings";
	}

	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public String goToDashboard(ModelMap map) {
		logger.debug("In dashboard");
		map.addAttribute("splunkUrl", splunkUrl);
		return "dashboard";
	}

	@RequestMapping(value = "/getUserConfig", method = RequestMethod.GET)
	public @ResponseBody
	List<IndexSourceEntity> getIndexSourceFromDB() {

		List<IndexSourceEntity> indexSourceListDb = splunkService.getAll();

		JSONArray jsonArray = new JSONArray(indexSourceListDb);
		logger.debug(jsonArray);

		return indexSourceListDb;
	}

	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String goToTest(ModelMap map) {
		logger.debug("In Test");
		map.addAttribute("splunkUrl", splunkUrl);
		return "test";
	}
	
	@RequestMapping(value = "/test", method = RequestMethod.POST)
	public String addTest(ModelMap map, @RequestParam String name) {
		// Handle a new Test (if any):
		logger.debug("Adding: " + name);

		if (name != null)
			testService.create(new TestEntity(name));

		ArrayList<TestEntity> testList = new ArrayList<TestEntity>();
		testList = (ArrayList<TestEntity>) testService.getAll();

		map.addAttribute("testList", testList);
		// Prepare the result view (Test):
		return "test";
	}
}