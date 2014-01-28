package com.ansfederal.netvistra.beam.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import com.ansfederal.netvistra.beam.dao.IndexSourceDao;
import com.ansfederal.netvistra.beam.domain.IndexSourceEntity;

public interface SplunkService {
	public IndexSourceDao getIndexSourceDao();

	public List<IndexSourceEntity> getSplunkIndexSourceType()
			throws IOException, InterruptedException;

	String streamToString(InputStream in) throws IOException;

	public IndexSourceEntity create(IndexSourceEntity indexSourceEntity);

	public List<IndexSourceEntity> getAll();

	public void delete(Object id);

	public IndexSourceEntity update(IndexSourceEntity indexSourceEntity);

	public IndexSourceEntity find(Object id);

	public long count();

	public List<IndexSourceEntity> createSelectedIndexSource(
			List<IndexSourceEntity> indexSourceList);
}
