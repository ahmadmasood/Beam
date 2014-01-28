package com.ansfederal.netvistra.beam.validator;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.ansfederal.netvistra.beam.domain.IndexSourceEntity;

@Component
public class IndexSourceTypeValidator implements Validator {

	private static final Logger logger = Logger
			.getLogger(IndexSourceTypeValidator.class);

	@SuppressWarnings("rawtypes")
	@Override
	public boolean supports(Class clazz) {
		// just validate the Customer instances
		return IndexSourceEntity.class.isAssignableFrom(clazz);
	}

	@SuppressWarnings("unchecked")
	@Override
	public void validate(Object target, Errors errors) {

		List<IndexSourceEntity> indexSourceList = (List<IndexSourceEntity>) target;

		boolean flag = false;
		logger.debug("In Validator " + indexSourceList.size());
		for (int i = 0; i < indexSourceList.size(); i++) {
			if (indexSourceList.get(i).getSelected()) {
				flag = true;
				logger.debug("Checked "
						+ indexSourceList.get(i).getSplunkIndex() + " : "
						+ indexSourceList.get(i).getSourceType());
			}
		}

		if (!flag)
			errors.rejectValue("indexSourceList", "required.indexSourcetype");

	}

}