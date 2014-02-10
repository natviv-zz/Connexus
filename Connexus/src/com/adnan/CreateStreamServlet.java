package com.adnan;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.*;

import static com.googlecode.objectify.ObjectifyService.ofy;

// Backs up CreateStream.html form submission. Trivial since there's no image uploaded, just a URL
@SuppressWarnings("serial")
public class CreateStreamServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		
		List<Stream> th = OfyService.ofy().load().type(Stream.class).list();
		Collections.sort(th);
		int k=0;
		for (Stream s:th)
		{ 
			if(s.name.equals(req.getParameter("streamName")))
			{
				resp.sendRedirect("/Error.jsp");
				k=1;
				break;
			}
			
		}
		
		if (k==0)
		{
		Stream s = new Stream(req.getParameter("streamName"),
				req.getParameter("tags"), req.getParameter("url"), req.getParameter("user"));
		// persist to datastore
		ofy().save().entity(s).now();
		resp.sendRedirect("/ViewStream.jsp");
	}}
}