package com.adnan;

import java.util.Date;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;

// APT: immaterial for connexus, just for getting up to speed with appengin
@Entity
public class Greeting implements Comparable<Greeting> {

	@Id
	Long id;
	String user;
	String content;
	Date date;

	private Greeting() {
	}

	public Greeting(String user, String content) {
		this.user = user;
		this.content = content;
		id = 42L;
		date = new Date();
		System.out.println(this);
	}

	public String getUser() {
		return user;
	}

	public String getContent() {
		return content;
	}

	@Override
	public String toString() {
		return id + ":" + user + ":" + content + ":" + date;
	}

	@Override
	public int compareTo(Greeting other) {
		if (date.after(other.date)) {
			return 1;
		} else if (date.before(other.date)) {
			return -1;
		}
		return 0;
	}
}
