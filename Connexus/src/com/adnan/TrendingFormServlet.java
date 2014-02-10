package com.adnan;

import java.io.IOException;
import java.util.Collections;
import java.util.List;
import java.util.Properties;
import java.util.logging.Logger;

import javax.mail.Session;
import javax.servlet.http.*;

import static com.googlecode.objectify.ObjectifyService.ofy;

// Backs up CreateStream.html form submission. Trivial since there's no image uploaded, just a URL
@SuppressWarnings("serial")

public class TrendingFormServlet extends HttpServlet {
	  Properties props = new Properties();
	  Session session = Session.getDefaultInstance(props, null);
	  
	  private static Logger log = Logger.getLogger(EmailServiceImpl.class.getCanonicalName());
	
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		
		List<Users> uh = OfyService.ofy().load().type(Users.class).list();
		Collections.sort(uh);
		if(uh.size()==0)
		{
			Users u = new Users(2,2);
			
			 ofy().save().entity(u).now();
			 
			 log.info("new user added"+u.cronfrequency);
		}		
		int cronfrequency = Integer.parseInt(req.getParameter("cronfrequency"));
		for (Users u : uh ) {
		
			
			u.updatecron(cronfrequency);
			ofy().save().entity(u).now();
			log.info("Cron frequency updated"+ u.cronfrequency);
		}
		
		resp.sendRedirect("/TrendingStream.jsp");
	}

}
