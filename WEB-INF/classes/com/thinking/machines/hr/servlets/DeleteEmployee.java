package com.thinking.machines.hr.servlets;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import com.thinking.machines.hr.dl.*;
public class DeleteEmployee extends HttpServlet
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
String employeeId=request.getParameter("employeeId").trim();
System.out.println("Employee Id : ("+employeeId+")");
String errorString="error";
PrintWriter pw=response.getWriter();
response.setContentType("text/plain");
String responseData;
try
{
EmployeeDAO employeeDAO=new EmployeeDAO();
employeeDAO.delete(employeeId);
responseData="success";
System.out.println("Success");
}catch(DAOException daoException)
{
System.out.println(daoException);
responseData=errorString;
}
pw.print(responseData);
}catch(Exception exception)
{
System.out.println("Exception : "+exception);
try
{
response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
}catch(IOException ioException){}
}
}
}
