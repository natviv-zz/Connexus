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
public class EmailSubServlet extends RemoteServiceServlet {

  String adminEmail = "natviv@gmail.com"; // insert your admin email address
                        // here
  Properties props = new Properties();
  Session session = Session.getDefaultInstance(props, null);
  
  private static Logger log = Logger.getLogger(EmailServiceImpl.class.getCanonicalName());

  @Override
  public void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
   
	    
		String streamname=req.getParameter("streamname");
		String emailId=req.getParameter("email");
		String nickname=req.getParameter("nickname");
		
		  // APT: calls to System.out.println go to the console, calls to out.println go to the html returned to browser
		  // the line below is useful when debugging (jsp or servlet)
		  System.out.println(" Subscriber sending mail  = " + streamname+ nickname+ streamname);
		  
		sendEmail(emailId,streamname,nickname);  
		
		resp.sendRedirect("/ViewOwnedStream.jsp");
  }

  public void sendEmail(String emailId, String streamname, String nickname) {


	  
	  
            
            log.info(emailId+ streamname + nickname);
          
	  
	  String msgBody = " Hi " + nickname + " has invited you to like his photo stream "+ streamname + "http://natviv.appspot.com";
	    

    try {
      Message msg = new MimeMessage(session);
      try {
        msg.setFrom(new InternetAddress(adminEmail, "Administrator"));
      } catch (UnsupportedEncodingException e) {
        e.printStackTrace();
      }
      msg.addRecipient(Message.RecipientType.TO, new InternetAddress(
          emailId));
      msg.setSubject("Invite to like streams at Connexus");
      msg.setText(msgBody);  //TIP: use msg.setContent to send an HTML formatted email
      Transport.send(msg);

    } catch (AddressException e) {
      e.printStackTrace();
    } catch (MessagingException e) {
      e.printStackTrace();
    }
    
    
    
    

  }

}


