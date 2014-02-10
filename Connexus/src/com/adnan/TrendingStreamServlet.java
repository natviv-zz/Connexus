package com.adnan;

import java.io.IOException;
import java.util.List;
import java.util.Collections;

import javax.servlet.http.*;
import java.util.logging.Logger;

import static com.googlecode.objectify.ObjectifyService.ofy;

@SuppressWarnings("serial")
public class TrendingStreamServlet extends HttpServlet {

	private static final Logger log = Logger.getLogger(TrendingStreamServlet.class.getName());
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException 
	    {
		
		List<Stream> th = OfyService.ofy().load().type(Stream.class).list();
		Collections.sort(th);
		
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

