package com.adnan;
import java.io.IOException;
import java.util.Collections;
import java.util.List;
import java.util.ArrayList;

import javax.servlet.http.*;

import static com.googlecode.objectify.ObjectifyService.ofy;

// Backs up CreateStream.html form submission. Trivial since there's no image uploaded, just a URL
@SuppressWarnings("serial")

public class SubscribeStreamServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		
		String streamname =req.getParameter("streamName");
		String email=req.getParameter("email");
		Long streamId = new Long(req.getParameter("streamId"));
		
		System.out.println(email + streamname);
		List<Stream> th = OfyService.ofy().load().type(Stream.class).list();
		Collections.sort(th);
		
		
		
		
			for(Stream s:th)
			{
				if((s.name).equals(streamname))
				{
					if(((s.subscribers).indexOf(email))==-1)
					{
						s.addtosubscribers(email);
						OfyService.ofy().save().entity(s).now();
					}
					
				}
				
				
			}
		
		
		
		
		
			resp.sendRedirect("UploadImgnew.jsp?streamId="+streamId+"&streamName="+streamname);
		

		//resp.sendRedirect("/ManageStream.jsp");
	}
}
