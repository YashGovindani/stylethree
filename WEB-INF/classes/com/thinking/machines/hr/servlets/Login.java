package com.thinking.machines.hr.servlets;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import com.thinking.machines.hr.dl.*;
public class Login extends HttpServlet
{
public void doGet(HttpServletRequest request,HttpServletResponse response)
{
try
{
response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
}catch(Exception exception)
{
// do nothing
}
}
public void doPost(HttpServletRequest request,HttpServletResponse response)
{
try
{
String username=request.getParameter("username");
String password=request.getParameter("password");
System.out.println(password);
PrintWriter pw=response.getWriter();
response.setContentType("text/plain");
String errorString="error";
String responseData;
try
{
AdministratorDTO administratorDTO=new AdministratorDAO().getByUsername(username);
if(password.equalsIgnoreCase(administratorDTO.getPassword())==false)
{
errorString+=",password,Incorrect password";
responseData=errorString;
}
else
{
responseData="success";
HttpSession session=request.getSession();
session.setAttribute("username",username);
}
}catch(DAOException daoException)
{
errorString+=",username,Invalid username";
responseData=errorString;
}
pw.print(responseData);
}catch(Exception exception)
{
try
{
response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
}catch(IOException ioException){}
}
}
}