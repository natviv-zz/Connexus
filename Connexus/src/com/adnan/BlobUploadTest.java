package com.adnan;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;


// APT: unrelated to connexus, just code to try out the blob service
@SuppressWarnings("serial")
public class BlobUploadTest extends HttpServlet {
	
	private BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
	
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		resp.setContentType("text/html");
		resp.getWriter().println("<html><head><title>Upload Test</title></head><body>\n<form action=\""  
				+ blobstoreService.createUploadUrl("/upload") 
				+ "\" method = \"post\" enctype=\"multipart/form-data\">\n"
	            + "<input type=\"text\" name=\"foo\">\n <input type=\"file\" name=\"myFile\">\n <input type=\"submit\" value=\"Submit\">\n </form>\n</body>\n</html>");
		
			
	}
}
		

