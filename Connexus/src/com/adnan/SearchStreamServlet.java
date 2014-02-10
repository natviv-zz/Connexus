package com.adnan;

import java.io.IOException;
import java.util.List;
import java.util.Collections;

import javax.servlet.http.*;

import static com.googlecode.objectify.ObjectifyService.ofy;

@SuppressWarnings("serial")
public class SearchStreamServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		String streamname =req.getParameter("streamName");
		List<Stream> th = OfyService.ofy().load().type(Stream.class).list();
		Collections.sort(th);
		int i=0;
		for (Stream s : th ) {
		  // APT: calls to System.out.println go to the console, calls to out.println go to the html returned to browser
		  // the line below is useful when debugging (jsp or servlet)
		  System.out.println("s = " + s);
		  if ( s.name.equals(streamname) )
		  {
	         resp.sendRedirect("/ShowaStream.jsp?streamId=" + s.id + "&"
				+ "streamName=" + s.name);
	         i=1;
	         
		  }
		}
		  if (i==0)
		  {
			  
			  resp.sendRedirect("/SearchaStream.jsp");
			  
		  }
		  
	
	
	}
}
