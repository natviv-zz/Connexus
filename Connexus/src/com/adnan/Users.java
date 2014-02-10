package com.adnan;

import java.util.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Collections;


import com.googlecode.objectify.ObjectifyService;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.google.common.base.Joiner;
import com.googlecode.objectify.ObjectifyFactory;

@Entity
public class Users implements Comparable<Users> {

	static {
		 ObjectifyService.register(Users.class);
	}
	// id is set by the datastore for us
	@Id
	public Long id;
	public int cronfrequency;
	public int croncounter;
	public Date createDate;
	
  
	// TODO: figure out why this is needed
	@SuppressWarnings("unused")
	private Users() {
	}
	
	@Override
	public String toString() {
		Joiner joiner = Joiner.on(":");
		return joiner.join(id.toString(), createDate.toString());
 	}

	public Users(int frq, int counter) {
		this.cronfrequency = 0;
		this.croncounter=0;
		
		this.createDate = new Date();
		
	}
	
	
	public int updatecron(int cron){
		cronfrequency=cron;
		return cronfrequency;
    }
	
	public int updatecounter(){
		croncounter+=1;
		return cronfrequency;
    }
	
	public int resetcounter(){
		croncounter=0;
		return cronfrequency;
    }
	
	
	
	
	
	
	
	
	@Override
	public int compareTo(Users other) {
		if (createDate.after(other.createDate)) {
			return 1;
		} else if (createDate.before(other.createDate)) {
			return -1;
		}
		return 0;
	}
}

