package musicher.pay.dto;

import java.sql.Date;

public class payDTO2 {
	String pay_id;
	String mem_id;
	Date pay_date;
	int price ;
	
	public payDTO2() {
		super();
	}
	public payDTO2(String pay_id, String mem_id, Date pay_date, int price) {
		super();
		this.pay_id = pay_id;
		this.mem_id = mem_id;
		this.pay_date = pay_date;
		this.price = price;
	}
	public String getPay_id() {
		return pay_id;
	}
	public void setPay_id(String pay_id) {
		this.pay_id = pay_id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public Date getPay_date() {
		return pay_date;
	}
	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "payDTO [pay_id=" + pay_id + ", mem_id=" + mem_id
				+ ", pay_date=" + pay_date + ", price=" + price + "]";
	}
	
	
	
}
