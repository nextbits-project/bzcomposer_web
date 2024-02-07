package com.avibha.common;

import java.io.Serializable;

public class City implements Serializable {

	private static final long serialVersionUID = 1L;

	private long cityId;
	private String cityName;

	@Override
	public String toString() {
		return "City [cityId=" + cityId + ", cityName=" + cityName + "]";
	}

	public City(long cityId, String cityName) {
		super();
		this.cityId = cityId;
		this.cityName = cityName;
	}

	public City() {

	}

	public long getCityId() {
		return cityId;
	}

	public void setCityId(long cityId) {
		this.cityId = cityId;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

}
