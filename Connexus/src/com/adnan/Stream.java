package com.adnan;

import java.util.ArrayList;
import java.util.Date;

import com.googlecode.objectify.ObjectifyService;
import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.google.common.base.Joiner;
import com.googlecode.objectify.ObjectifyFactory;

@Entity
public class Stream implements Comparable<Stream> {

	static {
		 ObjectifyService.register(Stream.class);
	}
	// id is set by the datastore for us
	@Id
	public Long id;
	public String name;
	public String tags;
	public Date createDate;
	public String coverImageUrl;
	public int viewcount;
	public String owner;
	public int pviewcount;
	public ArrayList <String> subscribers = new ArrayList<String>();
  
	// TODO: figure out why this is needed
	@SuppressWarnings("unused")
	private Stream() {
	}
	
	@Override
	public String toString() {
		Joiner joiner = Joiner.on(":");
		return joiner.join(id.toString(), name, tags, createDate.toString());
 	}

	public Stream(String name, String tags, String coverImageUrl, String owner) {
		this.name = name;
		this.tags = tags;
		this.coverImageUrl = coverImageUrl;
		this.createDate = new Date();
		this.viewcount=0;
		this.owner=owner;
		this.pviewcount=0;
	}
	
	public int updateviewcount(){
		viewcount+=1;
		return viewcount;
    }
	
	public int pupdateviewcount(){
		pviewcount+=1;
		return pviewcount;
    }
	
	
	public int resetviewcount(){
		viewcount=0;
		return viewcount;
		
		
	}
	
	
	public ArrayList<String> addtosubscribers(String sub){
		subscribers.add(sub);
		return subscribers;
    }
	
	public ArrayList<String> removesubscriber(String sub){
		subscribers.remove(sub);
		return subscribers;
    }
	
	
	
	
	
	public ArrayList<String> getsubscriber(){
				return subscribers;
    }
	
	
	public String updateowner(String own){
		owner=own;
		return owner;
}
	
	
	
	

	@Override
	public int compareTo(Stream other) {
		if (createDate.after(other.createDate)) {
			return 1;
		} else if (createDate.before(other.createDate)) {
			return -1;
		}
		return 0;
	}
}
