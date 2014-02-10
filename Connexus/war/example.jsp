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
<%@ page import="com.adnan.Stream" %>
<%@ page import="com.adnan.OfyService" %>
<%@ page import="com.adnan.ConnexusImage" %>

<%@ page import="com.adnan.OfyService" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Collections" %>

<%@ page import="com.google.appengine.api.blobstore.BlobstoreService" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>

<%@ page import="com.adnan.OfyService" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>






<%@ page import="com.adnan.OfyService" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>




<%
    BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
%>
	
	
	
	
	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<!-- The HTML 4.01 Transitional DOCTYPE declaration-->
<!-- above set at the top of the file will set     -->
<!-- the browser's rendering engine into           -->
<!-- "Quirks Mode". Replacing this declaration     -->
<!-- with a "Standards Mode" doctype is supported, -->
<!-- but may lead to some differences in layout.   -->

<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <link href="https://rawgithub.com/hayageek/jquery-upload-file/master/css/uploadfile.css" rel="stylesheet">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="https://rawgithub.com/hayageek/jquery-upload-file/master/js/jquery.uploadfile.min.js"></script>
    <script src="js/vendor/jquery.ui.widget.js"></script>
    <title>Upload Test</title>
  </head>


<!--  APT: for test purposes, not part of the app -->
  <body>
    <h1>Upload Test</h1>
    <div id="fileuploader">Upload</div>
    <form id="signup" name="UploadImg" action="<%= blobstoreService.createUploadUrl("/upload") %>" method="post" enctype="multipart/form-data">
    </form>
    <div id="startUpload" class="ajax-file-upload-green">Start Upload</div>
    
  </body>
</html>

<script>
$(document).ready(function()
{
    var url = $("#signup").attr('action');  
	var uploadObj = $("#fileuploader").uploadFile({
    url:url,
    multiple:true,
    autoSubmit:false,
    fileName:"myFile",
    formData: {"stream":"Flags","age":31},
    maxFileSize:102400*100,
    dynamicFormData: function()
    {
	   var data ={ location:"INDIA"}
	   return data;
    },
    showStatusAfterSuccess:false,
    dragDropStr: "<span><b>Drag and drop your files here</b></span>",
    abortStr:"Abort",
    cancelStr:"Cancel",
    doneStr:"Done",
    multiDragErrorStr: "Multiple Drag Error",
    extErrorStr:"Invalid File extension error",
    sizeErrorStr:"Maximum file upload size exceeded",
    uploadErrorStr:"Upload error"

});
    $("#startUpload").click(function()
    {
	   uploadObj.startUpload();
    });
});
</script>





		