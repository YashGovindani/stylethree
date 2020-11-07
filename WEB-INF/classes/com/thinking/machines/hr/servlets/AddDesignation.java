package com.thinking.machines.hr.servlets;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import com.thinking.machines.hr.dl.*;
public class AddDesignation extends HttpServlet
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
String title=request.getParameter("title");
PrintWriter pw=response.getWriter();
response.setContentType("text/plain");
String responseData;
try
{
DesignationDTO designationDTO=new DesignationDTO();
designationDTO.setTitle(title);
new DesignationDAO().add(designationDTO);
responseData="success";
}catch(DAOException daoException)
{
responseData="error,"+daoException.getMessage();
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

