package com.adnan;



import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Collections;

import javax.servlet.http.*;

import org.json.JSONArray;
import org.json.JSONObject;

import com.google.gson.Gson;

import static com.googlecode.objectify.ObjectifyService.ofy;

@SuppressWarnings("serial")
public class GeoJsonServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		String streamname =req.getParameter("streamName");
		List<Stream> th = OfyService.ofy().load().type(Stream.class).list();
		List<ConnexusImage> im = OfyService.ofy().load().type(ConnexusImage.class).list();
		Collections.sort(th);
		Collections.sort(im);;
		int i=0;
		ArrayList<String> bkurl = new ArrayList<String>();
		ArrayList<Float> lat = new ArrayList<Float>();
		ArrayList<Float> lon = new ArrayList<Float>();
		ArrayList<Date> date = new ArrayList<Date>();
		ArrayList<ImageObject> imginfo = new ArrayList<ImageObject>();
		
		
		for (ConnexusImage s : im ) {
			  // APT: calls to System.out.println go to the console, calls to out.println go to the html returned to browser
			  // the line below is useful when debugging (jsp or servlet)
			    
			    lat.add(s.latitude);
			    lon.add(s.longitude);
			    date.add(s.createDate);
	            bkurl.add(s.bkUrl);	
	            imginfo.add(new ImageObject(String.valueOf(s.streamId),s.comments,s.bkUrl,String.valueOf(s.createDate.getTime()),String.valueOf(s.latitude),String.valueOf(s.longitude)));
	            System.out.println(s.latitude+" "+s.longitude);
		}
		
		Gson gson = new Gson();
		String jlat = gson.toJson(lat);
		String jlon = gson.toJson(lon);
		String jdate = gson.toJson(date);
		String jbkurl = gson.toJson(bkurl);
		
		ImageObject[] imageArray = new ImageObject[imginfo.size()];
		for(int j=0;j<imageArray.length;j++){
			imageArray[j] = imginfo.get(j);
		}
		
        String jimginfo = gson.toJson(new ReplyMessage(imageArray));	
		
		
		resp.setContentType("application/json");
		// Get the printwriter object from response to write the required json object to the output stream      
		PrintWriter out = resp.getWriter();
		// Assuming your json object is **jsonObject**, perform the following, it will return your json object  
		//out.print(jlat);
		//out.print(jlon);
		//out.print(jdate);
		//out.print(jbkurl);
		out.print(jimginfo);
		out.flush();
		
		
}
	
	public static class ReplyMessage{
		public ImageObject[] array;
		
		public ReplyMessage(ImageObject[] array){
			this.array = array;
		}
	}
	
	
	public static class ImageObject{
		public String streamId;
		public String comments;
		public String bkUrl;
		public String createDate;
	    public String latitude;
	    public String longitude;
	    
	    public ImageObject(String streamId, String content, String bkUrl, String date,
	    		String latitude,String longitude) {
			this.streamId = streamId;
			this.bkUrl = bkUrl;
			this.comments = content;
			this.createDate = date;
			this.latitude=latitude;
			this.longitude=longitude;
			
		}
		
	}
	

}