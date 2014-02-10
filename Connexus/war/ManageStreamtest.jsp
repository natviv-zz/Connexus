<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="com.adnan.Stream" %>
<%@ page import="com.adnan.Users" %>

<%@ page import="com.adnan.OfyService" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>

<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.googlecode.objectify.Objectify"%>
<%@ page import="com.googlecode.objectify.ObjectifyService" %>


<%@ page import="com.adnan.OfyService" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
  <body>
    
<%
		UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();
        if (user!=null)
        {
        
        String email=user.getEmail();
        
        System.out.println(email);
       
		
		List<Stream> th = OfyService.ofy().load().type(Stream.class).list();
		Collections.sort(th);
		
		
		for (Stream s : th ) {
		  // APT: calls to System.out.println go to the console, calls to out.println go to the html returned to browser
		  // the line below is useful when debugging (jsp or servlet)
		  System.out.println("s = " + s);
		  s.updateowner(email);
		  s.addtosubscribers(email);
		  OfyService.ofy().save().entity(s).now();
		  
		  System.out.println(s.name + "  " + s.owner);
		  
		  ArrayList<String> subs=  s.getsubscriber();
		  for(String item : subs)
		  System.out.println("Subscriber for stream " + s.name + item); 
		  
		  
		  
		 
		 
		  }
		  
		  
		  

		  
		  
          
}
                  else{
		  %>
		  
		  <a href="<%= userService.createLoginURL(request.getRequestURI()) %>">Sign in to continue </a>
		  
		  
		  
		  <%
		  }
		  %>
		
  </body>
</html>