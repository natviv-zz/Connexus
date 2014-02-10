<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Collections" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.googlecode.objectify.Objectify"%>
<%@ page import="com.googlecode.objectify.ObjectifyService" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreService" %>

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
            <div class="tile-group tile-drag" style="width:70%;">
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
                <div class="tile double image-slider" data-role="tile-slider" data-param-period="5000" data-param-direction="left">
                    <div class="tile-content">
                        <img src="public/images/1.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="public/images/2.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="public/images/3.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="public/images/4.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="public/images/5.jpg" alt="">
                    </div>
                </div>
                
                
                <div class="tile double image-slider" data-role="tile-slider" data-param-period="5000" data-param-direction="left">
                    <div class="tile-content">
                        <img src="public/images/9.1.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="public/images/9.2.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="public/images/9.3.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="public/images/9.4.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="public/images/9.5.jpg" alt="">
                    </div>
                </div>

                

                
                    
                <div class="tile double image-slider" data-role="tile-slider" data-param-period="5000" data-param-direction="left">
                    <div class="tile-content">
                        <img src="public/images/8.1.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="public/images/8.2.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="public/images/8.3.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="public/images/8.4.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="public/images/8.5.jpg" alt="">
                    </div>
                </div>

            </div>
            
            <script>
                      function redirect()
                      {
                       
                       var url='WelCarousel.jsp';
                       window.location.assign(url,'width=640,height=480');
                       }
                       </script>
            
            
            

            <div class="tile-group" onclick="redirect()";>
                <div class="tile quadro double-vertical image-set">
                    <div class="tile-content">
                        <img src="public/images/1.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="public/images/2.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="public/images/3.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="public/images/4.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="public/images/5.jpg" alt="">
                    </div>
                    <div class="brand">
                        <span class="name">Wildlife</span>
                    </div>
                </div>
            </div>
            
            <div class="tile-group" onclick="redirect()";>
                <div class="tile quadro double-vertical image-set">
                    <div class="tile-content">
                        <img src="public/images/2.1.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="public/images/2.2.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="public/images/2.3.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="public/images/2.4.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="public/images/2.5.jpg" alt="">
                    </div>
                    <div class="brand">
                        <span class="name">Travel</span>
                    </div>
                </div>
            </div>
            
            <div class="tile-group" onclick="redirect()";>
                <div class="tile quadro double-vertical image-set">
                    <div class="tile-content">
                        <img src="public/images/3.1.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="public/images/3.2.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="public/images/3.3.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="public/images/3.4.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="public/images/3.5.jpg" alt="">
                    </div>
                    <div class="brand">
                        <span class="name">Ronaldo</span>
                    </div>
                </div>
            </div>
            
            <div class="tile-group" onclick="redirect()";>
                <div class="tile quadro double-vertical image-set">
                    <div class="tile-content">
                        <img src="public/images/4.1.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="public/images/4.2.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="public/images/4.3.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="public/images/4.4.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="public/images/4.5.jpg" alt="">
                    </div>
                    <div class="brand">
                        <span class="name">Great Moments</span>
                    </div>
                </div>
            </div>
            
            <div class="tile-group" onclick="redirect()";>
                <div class="tile quadro double-vertical image-set">
                    <div class="tile-content">
                        <img src="public/images/5.1.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="public/images/5.2.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="public/images/5.3.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="public/images/5.4.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="public/images/5.5.jpg" alt="">
                    </div>
                    <div class="brand">
                        <span class="name">Celebration of Life</span>
                    </div>
                </div>
            </div>
            
            <div class="tile-group" onclick="redirect()";>
                <div class="tile quadro double-vertical image-set">
                    <div class="tile-content">
                        <img src="public/images/6.1.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="public/images/6.2.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="public/images/6.3.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="public/images/6.4.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="public/images/6.5.jpg" alt="">
                    </div>
                    <div class="brand">
                        <span class="name">Unreal</span>
                    </div>
                </div>
            </div>
            
            <div class="tile-group" onclick="redirect()";>
                <div class="tile quadro double-vertical image-set">
                    <div class="tile-content">
                        <img src="public/images/10.1.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="public/images/10.2.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="public/images/10.3.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="public/images/10.4.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="public/images/10.5.jpg" alt="">
                    </div>
                    <div class="brand">
                        <span class="name">The Archives</span>
                    </div>
                </div>
            </div>
            
            
            
            
            
            
            
            
            <div class="tile-group" onclick="redirect()";>
                <div class="tile quadro double-vertical image-set">
                    <div class="tile-content">
                        <img src="public/images/7.1.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="public/images/7.2.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="public/images/7.3.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="public/images/7.4.jpg" alt="">
                    </div>
                    <div class="tile-content">
                        <img src="public/images/7.5.jpg" alt="">
                    </div>
                    <div class="brand">
                        <span class="name">Birds</span>
                    </div>
                </div>
            </div>
            
       <div class="footer" onclick="redirect()";>
			<div class="iconcontainer" id="searchbutton">
                <a href="SearchaStream.jsp" target="_blank">
				<div class="iconcontainerbg"></div>
				search
				</a>
			</div>
			
			
			
		    <div class="iconcontainer" id="helpbutton">
		        <a href="InfoStream.jsp" target="_blank">
				<div class="iconcontainerbg"></div>
				info
				</a>
			</div>
			
 			<%
 			String url = (request.getRequestURL()).toString();
 			System.out.println(url);
            
             %>
			<div class="iconcontainer" id="facebookbutton">
				
				<a href="https://www.facebook.com/sharer/sharer.php?u=<%=url%>">
               
                
                
				<div class="iconcontainerbg"></div>
				facebook
				</a>
			</div>	
	        <div class="iconcontainer" id="homebutton">
	            <a href="https://natviv.appspot.com" target="_blank">
				<div class="iconcontainerbg"></div>
				home
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
	