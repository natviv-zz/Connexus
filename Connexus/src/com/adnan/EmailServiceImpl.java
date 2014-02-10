package com.adnan;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Properties;
import java.util.logging.Logger;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.List;
import java.util.Collections;

import javax.servlet.http.*;

import static com.googlecode.objectify.ObjectifyService.ofy;






import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.gwt.user.server.rpc.RemoteServiceServlet;

@SuppressWarnings("serial")
public class EmailServiceImpl extends RemoteServiceServlet {

  String adminEmail = "natviv@gmail.com"; // insert your admin email address
                        // here
  Properties props = new Properties();
  Session session = Session.getDefaultInstance(props, null);
  
  private static Logger log = Logger.getLogger(EmailServiceImpl.class.getCanonicalName());

  @Override
  public void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
   
	    List<Users> uh = OfyService.ofy().load().type(Users.class).list();
		Collections.sort(uh);
		log.info(" Cron job sending mail  = ");
		log.info("Updated cron frequency=");
		if(uh.size()==0)
		{
			Users u = new Users(2,2);
			 ofy().save().entity(u).now();
		}		
		int i=0;
		for (Users u : uh ) {
		  // APT: calls to System.out.println go to the console, calls to out.println go to the html returned to browser
		  // the line below is useful when debugging (jsp or servlet)
		  log.info(" Cron job sending mail  = " + u);
		  log.info("Updated cron frequency="+ u.cronfrequency);
	      if(i==1)
	    	  break;
	  
	     if (u.cronfrequency==1)
	     {sendEmail();}
	     if (u.cronfrequency==2)
	     {
		   if(u.croncounter==12)
		  {
			  sendEmail();
			  u.resetcounter();
			  ofy().save().entity(u).now();
		  }
		  else{
			  u.updatecounter();
			  ofy().save().entity(u).now();
			  
		  }
	      }
	      if(u.cronfrequency==3)
	      {
		  if(u.croncounter==720)
		  {
			  sendEmail();
			  u.resetcounter();
			  ofy().save().entity(u).now();
		  }
		  else{
			  u.updatecounter();
			  ofy().save().entity(u).now();
			  
		  }
	  
	      }
	      i=1;
		  }
  }

  public void sendEmail() {

String emailId = "kamran.ks+aptmini@gmail.com";
	  
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
            	third=second;
            second = s.viewcount;
            
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
            	    break;
            	}
            	}
            for (Stream s : th ) {
            	
            	if(s.viewcount==second && s.name!=firstname)
            	{
            	    secondname=s.name;
            	    break;
            	}
            }
            for (Stream s : th ) {
            	if(s.viewcount==third && s.name!=firstname && s.name!=secondname)
            	{
            	    thirdname=s.name;
            	    break;
            	}
            }
            	
            	
            
            log.info(emailId+ firstname+secondname+thirdname);
          
	  
	  String msgBody = " Trending Streams of Connexus Metro app by Vivek Natarajan vn3399 for APT FALL 13 \n First is  "+ firstname + " "+ first + "views \n Second is " 
	          + secondname +" " + second + "views \n Third is " + thirdname +" "+ third + "views \n";
	    

    try {
      Message msg = new MimeMessage(session);
      try {
        msg.setFrom(new InternetAddress(adminEmail, "Administrator"));
      } catch (UnsupportedEncodingException e) {
        e.printStackTrace();
      }
      msg.addRecipient(Message.RecipientType.TO, new InternetAddress(
          emailId));
      msg.setSubject("Trending Stream Email Digest for APT Miniproject by Vivek Natarajan");
      msg.setText(msgBody);  //TIP: use msg.setContent to send an HTML formatted email
      Transport.send(msg);

    } catch (AddressException e) {
      e.printStackTrace();
    } catch (MessagingException e) {
      e.printStackTrace();
    }
    
    
    
    for (Stream s : th ) {
		  // APT: calls to System.out.println go to the console, calls to out.println go to the html returned to browser
		  // the line below is useful when debugging (jsp or servlet)
		  log.info(" Cron job updating stream s = " + s);
		  log.info("Updated View Count="+ s.resetviewcount());
		  s.resetviewcount();
		  OfyService.ofy().save().entity(s).now();
		  log.info("new view count"+s.viewcount);
		  
    }

  }

}

