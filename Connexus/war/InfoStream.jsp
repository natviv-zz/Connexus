<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Collections" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.googlecode.objectify.Objectify"%>
<%@ page import="com.googlecode.objectify.ObjectifyService" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreService" %>
<%@ page import="com.adnan.Stream" %>
<%@ page import="com.adnan.OfyService" %>

<%@ page import="com.adnan.OfyService" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
%>
	

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="target-densitydpi=device-dpi, width=device-width, initial-scale=1.0, maximum-scale=1">
    <meta name="description" content="Modern UI CSS">
    <meta name="author" content="Sergey Pimenov">
    <meta name="keywords" content="windows 8, modern style, modern ui, style, modern, css, framework">

    <link href="public/css/modern.css" rel="stylesheet">
    <link href="public/css/theme-dark.css" rel="stylesheet">
    <link href="public/css/modern-responsive.css" rel="stylesheet">
    <link href="public/css/main.css" rel="stylesheet">
    

    <script src="public/js/assets/jquery-1.8.2.min.js"></script>
    <script src="public/js/assets/google-analytics.js"></script>
    <script src="public/js/assets/jquery.mousewheel.min.js"></script>
    <script src="public/js/assets/github.info.js"></script>
    <script src="public/js/modern/tile-slider.js"></script>
    <script src="public/js/modern/start-menu.js"></script>
    <script src="public/js/modern/tile-drag.js"></script>

    <title>WELCOME TO CONNEXUS METRO</title>

    <style>
        body {
            background: #1d1d1d;
              }
              
        .container {
    width: 1000px;
    max-width: 1000px;
    margin: 0 auto;
    position: absolute
    left: 20%
}


.iconcontainerbg{
	position: absolute;
	top: 0px;
	left: 50%;
	margin-left: -10px;
	background-repeat: no-repeat;
	width: 30px;
	height: 30px;
}










}







#signup {
    padding: 0px 25px 25px;
    background: #fff;
    box-shadow: 
        0px 0px 0px 5px rgba( 255,255,255,0.4 ), 
        0px 4px 20px rgba( 0,0,0,0.33 );
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;
    border-radius: 5px;
    display: table;
    position: static;
}

#signup .header {
    margin-bottom: 10px;
}

#signup .header h3 {
    color: #ffffff;
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 5px;
}

#signup .header p {
    color: #ffffff;
    font-size: 14px;
    font-weight: 300;
}

#signup .sep {
    height: 1px;
    background: #e8e8e8;
    width: 406px;
    margin: 0px -25px;
}

#signup .inputs {
    margin-top: 25px;
}

#signup .inputs label {
    color: #8f8f8f;
    font-size: 12px;
    font-weight: 300;
    letter-spacing: 1px;
    margin-bottom: 7px;
    display: block;
}

input::-webkit-input-placeholder {
    color:    #b5b5b5;
}

input:-moz-placeholder {
    color:    #b5b5b5;
}

#signup .inputs input[type=text], input[type=url] {
    background: #f5f5f5;
    font-size: 0.8rem;
    -moz-border-radius: 3px;
    -webkit-border-radius: 3px;
    border-radius: 3px;
    border: none;
    padding: 13px 10px;
    width: 330px;
    margin-bottom: 20px;
    box-shadow: inset 0px 2px 3px rgba( 0,0,0,0.1 );
    clear: both;
}

#signup .inputs input[type=text]:focus, input[type=url]:focus {
    background: #fff;
    box-shadow: 0px 0px 0px 3px #fff38e, inset 0px 2px 3px rgba( 0,0,0,0.2 ), 0px 5px 5px rgba( 0,0,0,0.15 );
    outline: none;   
}



#signup .inputs label.terms {
    float: left;
    font-size: 14px;
    font-style: italic;
}

#signup .inputs #submit {
    width: 30%;
    margin-top: 5px;
    padding: 7px 0;
    color: #fff;
    font-size: 14px;
    font-weight: 500;
    letter-spacing: 1px;
    text-align: center;
    text-decoration: none;
        background: -moz-linear-gradient(
        top,
        #b9c5dd 0%,
        #a4b0cb);
    background: -webkit-gradient(
        linear, left top, left bottom, 
        from(#b9c5dd),
        to(#a4b0cb));
    -moz-border-radius: 5px;
    -webkit-border-radius: 5px;
    border-radius: 5px;
    border: 1px solid #737b8d;
    -moz-box-shadow:
        0px 5px 5px rgba(000,000,000,0.1),
        inset 0px 1px 0px rgba(255,255,255,0.5);
    -webkit-box-shadow:
        0px 5px 5px rgba(000,000,000,0.1),
        inset 0px 1px 0px rgba(255,255,255,0.5);
    box-shadow:
        0px 5px 5px rgba(000,000,000,0.1),
        inset 0px 1px 0px rgba(255,255,255,0.5);
    text-shadow:
        0px 1px 3px rgba(000,000,000,0.3),
        0px 0px 0px rgba(255,255,255,0);
    display: table;
    position: static;
    clear: both;
}

#signup .inputs #submit:hover {
    background: -moz-linear-gradient(
        top,
        #a4b0cb 0%,
        #b9c5dd);
    background: -webkit-gradient(
        linear, left top, left bottom, 
        from(#a4b0cb),
        to(#b9c5dd));
}      
        
        

       
        
        
    </style>
    
</head>
<body class="metrouicss">
<div class="page secondary fixed-header">
    <div class="page-header ">
        <div class="page-header-content">
            <div class="user-login">
                <%
    
  						  UserService userService = UserServiceFactory.getUserService();
    					  User user = userService.getCurrentUser();
                          if (user != null) {
                          pageContext.setAttribute("user", user);
                %>              
            
            
                <a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">
                    <div class="name">
                        
                     
                          <span class="first-name">Hello, ${fn:escapeXml(user.nickname)}!</span>
                          <span class="last-name">sign out</span>
                <%
  						  } else {
  						  
				%>
                <a href="<%= userService.createLoginURL(request.getRequestURI()) %>">
                    <div class="name"> 				
                 				
                           
                          <span class="first-name">Hello!</span>
                          <span class="last-name">sign in</span> 
                        <%
  						  }
						%>
                    
                    
                    </div>
                    <div class="avatar">
                        <!--<img src="images/myface.jpg"/>-->
                        <i class="icon-user fg-color-white"></i>
                    </div>
                </a>
            </div>

            <h1 class="fg-color-white">Welcome to Connexus Metro!</h1>
            
        </div>
    </div>

    <div class="page-region">
        <div class="page-region-content tiles">
            <div class="tile-group tile-drag">
                <div class="tile bg-color-darken icon">
                    <div class="tile-content">
                        <img src="public/images/create2.jpg"/>
                    </div>
                    <div class="brand">
                        
                        <div class="name"><a href="CreateStream.jsp">Create streams</a></div>
                    </div>
                </div>
                
                
                <div class="tile bg-color-darken icon">
                    <div class="tile-content">
                        <img src="public/images/manage.jpg"/>
                    </div>
                    <div class="brand">
                        
                        <div class="name"><a href="ManageStream.jsp">Manage streams</a></div>
                    </div>
                </div>


                

                <div class="tile bg-color-darken icon">
                    <div class="tile-content">
                        <img src="public/images/view stream.jpg"/>
                    </div>
                    <div class="brand">
                        
                        <div class="name"><a href="ViewStream.jsp">View streams</a></div>
                    </div>
                </div>

                <div class="tile bg-color-darken icon">
                    <b class="check"></b>
                    <div class="tile-content">
                        <img src="public/images/create.jpg" alt="" />
                    </div>
                    <div class="brand">
                        <div class="name"><a href="SearchaStream.jsp">Search streams</a></div>
                    </div>
                </div>

                

                <div class="tile bg-color-darken icon">
                    <div class="tile-content">
                        <img src="public/images/share.jpg"/>
                    </div>
                    <div class="brand">
                        <div class="name"><a href="ShareStream.jsp">Share streams</a></div>
                        
                    </div>
                </div>

                <div class="tile bg-color-darken icon">
                    <div class="tile-content">
                        <img src="public/images/trends.jpg" alt="" />
                    </div>
                    <div class="brand">
                        <div class="name"><a href="TrendingStream.jsp">Trending streams</a></div>
                    </div>
                </div>
             </div>
             
                
       
       <%
       
        if (user != null) {
                          pageContext.setAttribute("user", user);
                         
       
                          String email=user.getEmail();
        
                          System.out.println(email);
        %>        
        
        <div class="tile-group tile-drag">
        <div class="tile double bg-color-darken image-slider" data-role="tile-slider" data-param-period="5000" data-param-direction="left">
                    <div class="tile-content bg-color-green">
                    <h3> Created by Vivek Natarajan for APT Mini Project for Fall 2013. For further info contact natviv@gmail.com                                         </h3>
                    </div>
                   
          </div>
          </div> 
                    
    </div>
      
             
             <%
            } else {
  						  
				%>
               
       
            </div>     				
             <div class= "form">
                <div class="container">

                  <form id="signup" name="createStreamInput" action="createStreamServlet" method="get">

                  <div class="header">
                  <div class="user-login"><a href="<%= userService.createLoginURL(request.getRequestURI()) %>">        
                  <h3><div class="name"> Sign in to continue </a></h3>
            
                       
                 </div>
                 </div>
                 
                 </form>
              </div>
            </div>  
              <%
              }
              %>
            
            
                     
       <div class="footer">
			<div class="iconcontainer" id="searchbutton">
                <a href="SearchaStream.jsp" target="_blank">
				<div class="iconcontainerbg"></div>
				
				</a>
			</div>
			
			
			
		    <div class="iconcontainer" id="helpbutton">
		        <a href="InfoStream.jsp" target="_blank">
				<div class="iconcontainerbg"></div>
				
				</a>
			</div>
			
 			<%
			String url = (request.getRequestURL()).toString();
 			%>
 			
			<div class="iconcontainer" id="facebookbutton">
				<a href="https://www.facebook.com/sharer/sharer.php?u=<%=url%>">
				<div class="iconcontainerbg"></div>
				
				</a>
			</div>	
	        <div class="iconcontainer" id="homebutton">
	            <a href="https://natviv.appspot.com" target="_blank">
				<div class="iconcontainerbg"></div>
				
			</div>
			
       </div>            
            
        </div>
    </div>
</div>
<a href='http://hit.ua/?x=19154' target='_blank'>
    <script language="javascript" type="text/javascript"><!--
    Cd=document;Cr="&"+Math.random();Cp="&s=1";
    Cd.cookie="b=b";if(Cd.cookie)Cp+="&c=1";
    Cp+="&t="+(new Date()).getTimezoneOffset();
    if(self!=top)Cp+="&f=1";
    //--></script>
    <script language="javascript1.1" type="text/javascript"><!--
    if(navigator.javaEnabled())Cp+="&j=1";
    //--></script>
    <script language="javascript1.2" type="text/javascript"><!--
    if(typeof(screen)!='undefined')Cp+="&w="+screen.width+"&h="+
            screen.height+"&d="+(screen.colorDepth?screen.colorDepth:screen.pixelDepth);
    //--></script>
    <script language="javascript" type="text/javascript"><!--
    Cd.write("<img src='http://c.hit.ua/hit?i=19154&g=0&x=2"+Cp+Cr+
            "&r="+escape(Cd.referrer)+"&u="+escape(window.location.href)+
            "' border='0' wi"+"dth='1' he"+"ight='1'/>");
    //--></script>
    <noscript>
        <img src='http://c.hit.ua/hit?i=19154&amp;g=0&amp;x=2' border='0'/>
    </noscript></a>
<!-- / hit.ua -->

</body>
</html>	
	                