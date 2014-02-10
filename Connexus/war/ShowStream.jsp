<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="com.adnan.Stream" %>
<%@ page import="com.adnan.ConnexusImage" %>
<%@ page import="com.adnan.OfyService" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>

<%@ page import="com.google.appengine.api.blobstore.BlobstoreService" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>

<%@ page import="com.adnan.OfyService" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
  <body>
    
<%
		BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
		Long streamId = new Long(request.getParameter("streamId"));
		String streamName = request.getParameter("streamName");
		out.println(streamName);
		List<ConnexusImage> images = OfyService.ofy().load().type(ConnexusImage.class).list();
		Collections.sort(images);
		for ( ConnexusImage img : images ) {
		    if ( img.streamId.equals(streamId) ) {
     		  out.println("<img src=\"" + img.bkUrl + "\">"); // better to not use println for html output, use templating instead
     		}
     	 }
%>

<!-- APT: note how we are adding additional parameters when we create the uploadurl - this way blobstore service
     can pass them on to the upload servlet, so upload knows which stream the image blob corresponds to -->

	<form action="<%= blobstoreService.createUploadUrl("/upload?streamId=" 
			+ streamId + "&streamName=" + streamName) %>" 
			method = "post" enctype="multipart/form-data">
	     <input type="file" name="myFile"><br> <input type="submit" value="Submit">
   </form>
   <h2>Add an image</h2>
		
  </body>
</html>