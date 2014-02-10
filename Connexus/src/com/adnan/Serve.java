package com.adnan;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;
import com.google.appengine.api.images.ImagesService;
import com.google.appengine.api.images.ImagesServiceFactory;


// APT: this is not used in connexus, it was just part of the warmup
@SuppressWarnings("serial")
public class Serve extends HttpServlet {

	private BlobstoreService blobstoreService = BlobstoreServiceFactory
			.getBlobstoreService();

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws IOException {
		BlobKey blobKey = new BlobKey(req.getParameter("blob-key"));
		// TODO: why does this cause it to fail? System.out.println(blobKey);
		// blobstoreService.serve(blobKey, res);
		res.setContentType("text/html");
		ImagesService imagesService = ImagesServiceFactory.getImagesService();
		String imageUrl = imagesService.getServingUrl(blobKey); // to get url for img
		res.getWriter().println("<html><body><img src=\"" + imageUrl + "\" alt=\"Adnan's picture\"></body></html>");
	}

}
