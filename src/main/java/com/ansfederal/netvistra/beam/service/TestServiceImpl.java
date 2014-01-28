package com.ansfederal.netvistra.beam.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ansfederal.netvistra.beam.dao.TestDao;
import com.ansfederal.netvistra.beam.domain.TestEntity;

@Service("TestService")
public class TestServiceImpl implements TestService {

	private static final Logger logger = Logger
			.getLogger(TestServiceImpl.class);

	@Autowired
	private TestDao TestDao;

	public TestDao getTestDao() {
		return TestDao;
	}

	@Override
	@Transactional(readOnly = false)
	public TestEntity create(TestEntity TestEntity) {
		logger.debug("In Service Create");
		return TestDao.create(TestEntity);
	}

	@Override
	@Transactional(readOnly = true)
	public List<TestEntity> getAll() {
		return TestDao.getAll();
	}

	@Override
	@Transactional(readOnly = false)
	public void delete(Object id) {
		TestDao.delete(id);
	}

	@Override
	@Transactional(readOnly = false)
	public TestEntity update(TestEntity TestEntity) {
		return TestDao.update(TestEntity);
	}

	@Override
	@Transactional(readOnly = false)
	public TestEntity find(Object id) {
		return TestDao.find(id);
	}

	@Override
	@Transactional(readOnly = true)
	public long count() {
		return TestDao.count();
	}
}
