package net.chacarge.model1;

public class EstimateOkTO {
	private int car_seq;
	private String car_name;
	private String car_price;
	private String car_year;
	private String car_picture;
	
	private String car_ref_accident;
	private String car_ref_accident_rate;
	
	private String car_ref_distance;
	private String car_ref_distance_rate;
	
	
	public String getCar_ref_accident() {
		return car_ref_accident;
	}
	public void setCar_ref_accident(String car_ref_accident) {
		this.car_ref_accident = car_ref_accident;
	}
	public String getCar_ref_accident_rate() {
		return car_ref_accident_rate;
	}
	public void setCar_ref_accident_rate(String car_ref_accident_rate) {
		this.car_ref_accident_rate = car_ref_accident_rate;
	}
	public String getCar_ref_distance() {
		return car_ref_distance;
	}
	public void setCar_ref_distance(String car_ref_distance) {
		this.car_ref_distance = car_ref_distance;
	}
	public String getCar_ref_distance_rate() {
		return car_ref_distance_rate;
	}
	public void setCar_ref_distance_rate(String car_ref_distance_rate) {
		this.car_ref_distance_rate = car_ref_distance_rate;
	}
	public String getCar_picture() {
		return car_picture;
	}
	public void setCar_picture(String car_picture) {
		this.car_picture = car_picture;
	}
	public int getCar_seq() {
		return car_seq;
	}
	public void setCar_seq(int car_seq) {
		this.car_seq = car_seq;
	}
	public String getCar_name() {
		return car_name;
	}
	public void setCar_name(String car_name) {
		this.car_name = car_name;
	}
	public String getCar_price() {
		return car_price;
	}
	public void setCar_price(String car_price) {
		this.car_price = car_price;
	}
	public String getCar_year() {
		return car_year;
	}
	public void setCar_year(String car_year) {
		this.car_year = car_year;
	}

}
