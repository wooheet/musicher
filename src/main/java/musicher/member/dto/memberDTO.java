package musicher.member.dto;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="member")
public class memberDTO {
	@Id
	
	String mem_id;
	String pass  ;
	String name  ;
	String gender ;
	int age ;
	String mem_group ;
	public memberDTO() {
		super();
	}
	
	
	
	public memberDTO(String mem_id, String pass) {
		super();
		this.mem_id = mem_id;
		this.pass = pass;
	}



	public memberDTO(String mem_id, String pass, String name, String gender,
			int age, String mem_group) {
		super();
		this.mem_id = mem_id;
		this.pass = pass;
		this.name = name;
		this.gender = gender;
		this.age = age;
		this.mem_group = mem_group;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getMem_group() {
		return mem_group;
	}
	public void setMem_group(String mem_group) {
		this.mem_group = mem_group;
	}



	@Override
	public String toString() {
		return "memberDTO [mem_id=" + mem_id + ", pass=" + pass + ", name="
				+ name + ", gender=" + gender + ", age=" + age + ", mem_group="
				+ mem_group + "]";
	}
	
	
	
	
}
