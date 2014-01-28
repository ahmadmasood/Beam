package com.ansfederal.netvistra.beam.service;

import java.util.List;

import com.ansfederal.netvistra.beam.dao.TestDao;
import com.ansfederal.netvistra.beam.domain.TestEntity;

public interface TestService {
	public TestDao getTestDao();

	public TestEntity create(TestEntity TestEntity);

	public List<TestEntity> getAll();

	public void delete(Object id);

	public TestEntity update(TestEntity TestEntity);

	public TestEntity find(Object id);

	public long count();
}
