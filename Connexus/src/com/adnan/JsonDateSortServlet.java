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
public class JsonDateSortServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		int val1 =Integer.parseInt(req.getParameter("val1"));
		int val2 =Integer.parseInt(req.getParameter("val2"));
		System.out.println(val1);
		System.out.println(val2);
		List<ConnexusImage> im = OfyService.ofy().load().type(ConnexusImage.class).list();
	    Collections.sort(im);;
		int i=0;
		ArrayList<String> bkurl = new ArrayList<String>();
		ArrayList<Float> lat = new ArrayList<Float>();
		ArrayList<Float> lon = new ArrayList<Float>();
		ArrayList<Date> date = new ArrayList<Date>();
		ArrayList<ImageObject> imginfo = new ArrayList<ImageObject>();
		
		Date d = new Date();//intialize your date to any date 
		Date date1 = new Date((long)d.getTime() - (long)(val1 *(long)( 24 * 3600 * 1000)) );
		Date date2 = new Date((long)d.getTime() - (long)(val2 *(long) (24 * 3600 * 1000)) );
		System.out.println(d);
		System.out.println(date1);
		System.out.println(date2);
		System.out.println(date1.after(date2));
		System.out.println(date2.after(date1));
		for (ConnexusImage s : im ) {
			  // APT: calls to System.out.println go to the console, calls to out.println go to the html returned to browser
			  // the line below is useful when debugging (jsp or servlet)
			   // System.out.println(s.createDate);
			    lat.add(s.latitude);
			    lon.add(s.longitude);
			    date.add(s.createDate);
	            bkurl.add(s.bkUrl);	
	            if(s.createDate.after(date2) && s.createDate.before(date1))
	            {
	            	imginfo.add(new ImageObject(String.valueOf(s.streamId),s.comments,s.bkUrl,String.valueOf(s.createDate.getTime()),String.valueOf(s.latitude),String.valueOf(s.longitude)));
	            }
	            
	            
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