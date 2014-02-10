package com.adnan;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.logging.Logger;

/**
 * Copyright 2011 Google
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Collections;

import javax.servlet.http.*;

import static com.googlecode.objectify.ObjectifyService.ofy;


import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.adnan.SendMail;

import static com.googlecode.objectify.ObjectifyService.ofy;

/**
 * This servlet responds to the request corresponding to orders made from task queue and processes them.
 * It also sends a mail to the customer who placed the order.
 * 
 * @author
 */
@SuppressWarnings("serial")
public class EmailServlet extends HttpServlet {

	private static final Logger log = Logger.getLogger(EmailServlet.class.getName());
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    sendConfirmationMail();
  }

 

  
  private void sendConfirmationMail() throws IOException {
	  String emailId = "natviv@utexas.edu";
	  
	  List<Stream> th = OfyService.ofy().load().type(Stream.class).list();
		Collections.sort(th);
		int first = 0, second = 0, third=0;
		String firstname="",secondname="",thirdname="";
		
		
		for (Stream s : th ) {
		  // APT: calls to System.out.println go to the console, calls to out.println go to the html returned to browser
		  // the line below is useful when debugging (jsp or servlet)
		  log.info("s = " + s + " Viewcount =" +s.viewcount);
		  
		    if (s.viewcount >= first)
            {
            third=second;
            second = first;
            first = s.viewcount;
            }
            else if (s.viewcount >= second && s.viewcount < first)
            {
            second = s.viewcount;
            third=second;
            }
            else if (s.viewcount >= third && s.viewcount < second)
            {
            third = s.viewcount;
            }
            }
            
            System.out.println("First=" + first+" Second=" +second+" Third="+third);
            
            for (Stream s : th ) {
            	
            	if(s.viewcount==first)
            	{
            	    firstname=s.name;
            	}
            	
            	if(s.viewcount==second)
            	{
            	    secondname=s.name;
            	}
            	
            	if(s.viewcount==third)
            	{
            	    thirdname=s.name;
            	}
            	
            	
            	
            }
            log.info(emailId+ firstname+secondname+thirdname);
          
	  String subject = "Trending Streams in the last hour";
	  String msgBody = " Trending Streams \n First is  "+ firstname + first + "views \n Second is" 
	          + secondname + second + "views \n Third is " + thirdname + third + "views \n";
	    
	  
	  SendMail sendmail = new SendMail();
	  sendmail.send(emailId, subject, msgBody);
	  log.info(emailId+subject+msgBody);
	  
	  
	  
    
  }
}
