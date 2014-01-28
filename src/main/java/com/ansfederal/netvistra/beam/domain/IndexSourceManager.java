package com.ansfederal.netvistra.beam.domain;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.FactoryUtils;
import org.apache.commons.collections.list.LazyList;

public class IndexSourceManager {

	public IndexSourceManager() {

	}

	@SuppressWarnings("unchecked")
	private List<IndexSourceEntity> indexSourceList = LazyList.decorate(new ArrayList<IndexSourceEntity>(),
			FactoryUtils.instantiateFactory(IndexSourceEntity.class));

	public List<IndexSourceEntity> getIndexSourceList() {
		return indexSourceList;
	}

	public void setIndexSourceList(List<IndexSourceEntity> indexSourceList) {
		this.indexSourceList = indexSourceList;
	}
}
