<%@ page language="java" contentType="text/html; characterset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; characterset=UTF-8">
<title>uploadOk</title>
</head>
<body>
<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>

<%@ page contentType= "text/html; characterset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.apache.http.*" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "jdpcJava.CafeDb" %>
<%@ page import = "jdpcJava.CafeStorage" %>
<%@page import = "jdpcJava.CafeTableDb" %>
<%@page import = "jdpcJava.CafeTableStorage" %>

<%

 // 절대 경로

 String savePath = "/data/stdproj/tomcat/webapps/cafe/upload";
System.out.println(savePath);
 int maxSize = 5 * 1024 * 1024; // 최대 업로드 파일 크기 5MB(메가)로 제한
 String fileName=" ";
 DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();

 try {

MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8", policy);
System.out.println("1");
  fileName = multi.getFilesystemName("upfile"); // 파일의 이름 얻기
System.out.println(fileName);

// 여기서 String fileName을 선언하면 try문이 }catch를 만나는 시점에서 fileName 변수는 소멸

  if (fileName == null || fileName.trim().equals("") || fileName.trim().equals(null)) 
  { // 파일이 업로드 되지 않았을때
   out.print("파일 업로드 되지 않았음");
  } 

  else 
  { // 파일이 업로드 되었을때
   out.print("제목 :" + multi.getParameter("title")+ "<br>");
   out.print("</tr>");
   out.print("파일이름  : " + fileName+"<br>");
   out.print("내용" + multi.getParameter("desc")+"<br>");
   out.print("파일경로" + request.getRealPath("fileName")+"<br>"+"<br>");
  }//else

 } 
catch (Exception e) 
{
  out.print("예외 발생 : " + e);
 }//catch




String fullpath = "./upload/" + fileName;

%>

<img src="<%=savePath%>" width=512 height=384></img>
</body>
</html>