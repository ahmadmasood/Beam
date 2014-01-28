package com.ansfederal.netvistra.beam.domain;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class TestEntity implements Serializable {

	private static final long serialVersionUID = 3809144989522638981L;

	// Persistent Fields:

	@Id
	@Column(name = "Id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	long id;
	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	private Date signingDate;

	// Constructors:
	public TestEntity() {
	}

	public TestEntity(String name) {
		this.name = name;
		this.signingDate = new Date(System.currentTimeMillis());
	}

	// String Representation:
	@Override
	public String toString() {
		return name + " (signed on " + signingDate + ")";
	}
}