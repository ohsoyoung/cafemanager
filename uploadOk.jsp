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

 // ���� ���

 String savePath = "/data/stdproj/tomcat/webapps/cafe/upload";
System.out.println(savePath);
 int maxSize = 5 * 1024 * 1024; // �ִ� ���ε� ���� ũ�� 5MB(�ް�)�� ����
 String fileName=" ";
 DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();

 try {

MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8", policy);
System.out.println("1");
  fileName = multi.getFilesystemName("upfile"); // ������ �̸� ���
System.out.println(fileName);

// ���⼭ String fileName�� �����ϸ� try���� }catch�� ������ �������� fileName ������ �Ҹ�

  if (fileName == null || fileName.trim().equals("") || fileName.trim().equals(null)) 
  { // ������ ���ε� ���� �ʾ�����
   out.print("���� ���ε� ���� �ʾ���");
  } 

  else 
  { // ������ ���ε� �Ǿ�����
   out.print("���� :" + multi.getParameter("title")+ "<br>");
   out.print("</tr>");
   out.print("�����̸�  : " + fileName+"<br>");
   out.print("����" + multi.getParameter("desc")+"<br>");
   out.print("���ϰ��" + request.getRealPath("fileName")+"<br>"+"<br>");
  }//else

 } 
catch (Exception e) 
{
  out.print("���� �߻� : " + e);
 }//catch




String fullpath = "./upload/" + fileName;

%>

<img src="<%=savePath%>" width=512 height=384></img>
</body>
</html>