package com.ansfederal.netvistra.beam.dao;

import org.springframework.stereotype.Component;

import com.ansfederal.netvistra.beam.domain.TestEntity;

@Component("TestDao")
public class TestDaoImpl extends GenericDaoImpl<TestEntity> implements TestDao {
}