package com.multi.charger;

public class MapVO {
	private String c_locoation;
    private String c_address;
    private String c_name;
    private String c_facility_large;
    private String c_facility_small;
    private String c_device_large;
    private String c_device_small;
    private String c_operator_large;
    private String c_operator_small;
    private String c_charge_capacity;
    private String c_charge_type;
    private String c_access;
    private int c_charge_num;
    private String c_charge_id;
    private double c_lat;
    private double c_lon;
	public String getC_locoation() {
		return c_locoation;
	}
	public void setC_locoation(String c_locoation) {
		this.c_locoation = c_locoation;
	}
	public String getC_address() {
		return c_address;
	}
	public void setC_address(String c_address) {
		this.c_address = c_address;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_facility_large() {
		return c_facility_large;
	}
	public void setC_facility_large(String c_facility_large) {
		this.c_facility_large = c_facility_large;
	}
	public String getC_facility_small() {
		return c_facility_small;
	}
	public void setC_facility_small(String c_facility_small) {
		this.c_facility_small = c_facility_small;
	}
	public String getC_device_large() {
		return c_device_large;
	}
	public void setC_device_large(String c_device_large) {
		this.c_device_large = c_device_large;
	}
	public String getC_device_small() {
		return c_device_small;
	}
	public void setC_device_small(String c_device_small) {
		this.c_device_small = c_device_small;
	}
	public String getC_operator_large() {
		return c_operator_large;
	}
	public void setC_operator_large(String c_operator_large) {
		this.c_operator_large = c_operator_large;
	}
	public String getC_operator_small() {
		return c_operator_small;
	}
	public void setC_operator_small(String c_operator_small) {
		this.c_operator_small = c_operator_small;
	}
	public String getC_charge_capacity() {
		return c_charge_capacity;
	}
	public void setC_charge_capacity(String c_charge_capacity) {
		this.c_charge_capacity = c_charge_capacity;
	}
	public String getC_charge_type() {
		return c_charge_type;
	}
	public void setC_charge_type(String c_charge_type) {
		this.c_charge_type = c_charge_type;
	}
	public String getC_access() {
		return c_access;
	}
	public void setC_access(String c_access) {
		this.c_access = c_access;
	}
	public int getC_charge_num() {
		return c_charge_num;
	}
	public void setC_charge_num(int c_charge_num) {
		this.c_charge_num = c_charge_num;
	}
	public String getC_charge_id() {
		return c_charge_id;
	}
	public void setC_charge_id(String c_charge_id) {
		this.c_charge_id = c_charge_id;
	}
	public double getC_lat() {
		return c_lat;
	}
	public void setC_lat(double c_lat) {
		this.c_lat = c_lat;
	}
	public double getC_lon() {
		return c_lon;
	}
	public void setC_lon(double c_lon) {
		this.c_lon = c_lon;
	}
	
	@Override
	public String toString() {
		return "MapVO [c_locoation=" + c_locoation + ", c_address=" + c_address + ", c_name=" + c_name
				+ ", c_facility_large=" + c_facility_large + ", c_facility_small=" + c_facility_small
				+ ", c_device_large=" + c_device_large + ", c_device_small=" + c_device_small + ", c_operator_large="
				+ c_operator_large + ", c_operator_small=" + c_operator_small + ", c_charge_capacity="
				+ c_charge_capacity + ", c_charge_type=" + c_charge_type + ", c_access=" + c_access + ", c_charge_num="
				+ c_charge_num + ", c_charge_id=" + c_charge_id + ", c_lat=" + c_lat + ", c_lon=" + c_lon + "]";
	}
  
}
