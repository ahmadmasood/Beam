package com.ansfederal.netvistra.beam.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ansfederal.netvistra.beam.dao.IndexSourceDao;
import com.ansfederal.netvistra.beam.domain.IndexSourceEntity;
import com.splunk.Job;
import com.splunk.JobArgs;
import com.splunk.ResultsReaderXml;
import com.splunk.ServiceArgs;

@Service("splunkService")
public class SplunkServiceImpl implements SplunkService {

	@Autowired
	private IndexSourceDao indexSourceDao;

	private static final Logger logger = Logger
			.getLogger(SplunkServiceImpl.class);

	@Override
	public String streamToString(InputStream in) throws IOException {
		StringBuilder out = new StringBuilder();
		BufferedReader br = new BufferedReader(new InputStreamReader(in));
		for (String line = br.readLine(); line != null; line = br.readLine())
			out.append(line);
		br.close();
		return out.toString();
	}

	@Value("${splunk.url}")
	private String splunkUrl;
	@Value("${splunk.username}")
	private String username;
	@Value("${splunk.password}")
	private String password;
	@Value("${splunk.host}")
	private String host;
	@Value("${splunk.port}")
	private Integer port;

	@Override
	public List<IndexSourceEntity> getSplunkIndexSourceType()
			throws IOException, InterruptedException {

		// Create a map of arguments and add login parameters
		ServiceArgs loginArgs = new ServiceArgs();
		loginArgs.setUsername(username);
		loginArgs.setPassword(password);
		loginArgs.setHost(host);
		loginArgs.setPort(port);

		// Create a Service instance and log in with the argument map
		com.splunk.Service service = com.splunk.Service.connect(loginArgs);
		//String splunkQuery = "|metasearch index=* sourcetype=* | stats count by index, sourcetype | fields - count";
		String splunkQuery2 = "|metasearch earliest=-1d index=* sourcetype=* | stats count by index, sourcetype | fields - count";
		JobArgs jobargs = new JobArgs();
		jobargs.setExecutionMode(JobArgs.ExecutionMode.NORMAL);
		Job job = service.getJobs().create(splunkQuery2, jobargs);

		// Wait for the search to finish
		while (!job.isDone()) {
			try {
				Thread.sleep(500);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		ArrayList<String> list1 = new ArrayList<String>();

		// Get the search results and use the built-in XML parser to display
		// them
		InputStream resultsNormalSearch = job.getResults();

		ResultsReaderXml resultsReaderNormalSearch;

		try {
			resultsReaderNormalSearch = new ResultsReaderXml(
					resultsNormalSearch);
			HashMap<String, String> event;

			while ((event = resultsReaderNormalSearch.getNextEvent()) != null) {
				// logger.debug("\n****************EVENT****************\n");
				for (String key : event.keySet()) {
					// logger.debug("   " + key + ":  " + event.get(key));
					// jsonObj.put(key,event.get(key));
					list1.add(key);
					list1.add(event.get(key));
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		// Get properties of the completed job
		logger.debug("\nSearch job properties\n---------------------");
		logger.debug("Search job ID:         " + job.getSid());
		logger.debug("The number of events:  " + job.getEventCount());
		logger.debug("The number of results: " + job.getResultCount());
		logger.debug("Search duration:       " + job.getRunDuration()
				+ " seconds");
		logger.debug("This job expires in:   " + job.getTtl() + " seconds");

		ArrayList<IndexSourceEntity> indexSourceTypeList = new ArrayList<IndexSourceEntity>();

		for (int i = 0; i < list1.size(); i += 4) {
			if ((i + 3) <= list1.size()) {
				// logger.debug("i is: " + i + " -- " + list1.get(i + 1) +
				// "*****"
				// + list1.get(i + 3));
				indexSourceTypeList.add(new IndexSourceEntity(list1.get(i + 1),
						list1.get(i + 3)));
			}
		}
		return indexSourceTypeList;
	}

	@Override
	public IndexSourceDao getIndexSourceDao() {
		return indexSourceDao;
	}

	@Override
	public List<IndexSourceEntity> createSelectedIndexSource(
			List<IndexSourceEntity> indexSourceList) {
		List<IndexSourceEntity> indexSourceListFinal = new ArrayList<IndexSourceEntity>();
		for (int i = 0; i < indexSourceList.size(); i++) {
			if (indexSourceList.get(i).getSelected()) {
				indexSourceListFinal.add(indexSourceList.get(i));
			}
		}
		return indexSourceListFinal;
	}

	@Override
	@Transactional(readOnly = false)
	public IndexSourceEntity create(IndexSourceEntity indexSourceEntity) {
		return indexSourceDao.create(indexSourceEntity);
	}

	@Override
	@Transactional(readOnly = true)
	public List<IndexSourceEntity> getAll() {
		return indexSourceDao.getAll();
	}

	@Override
	@Transactional(readOnly = false)
	public void delete(Object id) {
		indexSourceDao.delete(id);
	}

	@Override
	@Transactional(readOnly = false)
	public IndexSourceEntity update(IndexSourceEntity IndexSourceEntity) {
		return indexSourceDao.update(IndexSourceEntity);
	}

	@Override
	@Transactional(readOnly = false)
	public IndexSourceEntity find(Object id) {
		return indexSourceDao.find(id);
	}

	@Override
	@Transactional(readOnly = true)
	public long count() {
		return indexSourceDao.count();
	}
}
