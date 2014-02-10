<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.adnan.Greeting" %>
<%@ page import="java.util.List" %>
<%@ page import="static com.googlecode.objectify.ObjectifyService.ofy" %>

<!-- APT: warmup exercises, not part of app -->

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
  <body>
<%
		List<Greeting> th = ofy().load().type(Greeting.class).list();
		for (Greeting g : th ) {
		  pageContext.setAttribute("greeting", g.toString());
		  System.out.println("g = " + g);
		  out.println("g = " + g); // different from system.out.println
		}
		
%>


  </body>
</html>