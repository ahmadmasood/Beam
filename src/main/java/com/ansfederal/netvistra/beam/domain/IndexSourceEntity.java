package com.ansfederal.netvistra.beam.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

@Entity
public class IndexSourceEntity implements Serializable {

	private static final long serialVersionUID = 3503307017400700401L;

	// Persistent Fields:

	@Id
	@Column(name = "Id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	long id;
	private String splunkIndex;
	private String sourceType;
	@Transient
	private boolean selected = false; // checked it

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public boolean getSelected() {
		return selected;
	}

	public void setSelected(boolean selected) {
		this.selected = selected;
	}

	public IndexSourceEntity() {

	}

	public IndexSourceEntity(String splunkIndex) {
		this.splunkIndex = splunkIndex;
	}

	public IndexSourceEntity(String splunkIndex, String sourceType) {
		this.splunkIndex = splunkIndex;
		this.sourceType = sourceType;
		setSplunkIndex(splunkIndex);
		setSourceType(sourceType);
	}

	public IndexSourceEntity(String splunkIndex, String sourceType,
			Boolean selected) {
		this.splunkIndex = splunkIndex;
		this.sourceType = sourceType;
		setSplunkIndex(splunkIndex);
		setSourceType(sourceType);
		setSelected(selected);
	}

	public String getSplunkIndex() {
		return splunkIndex;
	}

	public void setSplunkIndex(String splunkIndex) {
		this.splunkIndex = splunkIndex;
	}

	public IndexSourceEntity(IndexSourceEntity indexSourceEntity) {
		setSplunkIndex(indexSourceEntity.getSplunkIndex());
		setSourceType(indexSourceEntity.getSourceType());
	}

	public String getSourceType() {
		return sourceType;
	}

	public void setSourceType(String sourceType) {
		this.sourceType = sourceType;
	}

	// String Representation:
	@Override
	public String toString() {
		return "( index = " + splunkIndex + " sourceType = " + sourceType
				+ " selected " + selected + ")";
	}

}
