package com.adnan;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Collections;

import javax.servlet.http.*;

import org.json.JSONArray;
import org.json.JSONObject;

import com.google.gson.Gson;

import static com.googlecode.objectify.ObjectifyService.ofy;

@SuppressWarnings("serial")
public class SearchStreamServletAC extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		String streamname =req.getParameter("streamName");
		List<Stream> th = OfyService.ofy().load().type(Stream.class).list();
		List<ConnexusImage> im = OfyService.ofy().load().type(ConnexusImage.class).list();
		Collections.sort(th);
		Collections.sort(im);;
		int i=0;
		ArrayList<String> list = new ArrayList<String>();
		for (Stream s : th ) {
		  // APT: calls to System.out.println go to the console, calls to out.println go to the html returned to browser
		  // the line below is useful when debugging (jsp or servlet)
		  
            list.add(s.name);			
	}
		int x=1;
		float y=0.000001f;
		for (ConnexusImage s : im ) {
			  // APT: calls to System.out.println go to the console, calls to out.println go to the html returned to browser
			  // the line below is useful when debugging (jsp or servlet)
			   s.updatecoord(30.25f+(x*y),17.75f+(x*y));
                			   
			    {
			    	if(s.comments.equals("dummy content")==false)
			    		s.updatecoord(23.5f+(x*y),37.7f+(x*y));
			    }
	            list.add(s.comments);	
	            ofy().save().entity(s).now();
	            System.out.println(s.latitude+" "+s.longitude);
	            x+=1;
	            y+=y;
		}
		
		Gson gson = new Gson();
		String json = gson.toJson(list);
		
		resp.setContentType("application/json");
		// Get the printwriter object from response to write the required json object to the output stream      
		PrintWriter out = resp.getWriter();
		// Assuming your json object is **jsonObject**, perform the following, it will return your json object  
		out.print(json);
		out.flush();
		
		
}

}