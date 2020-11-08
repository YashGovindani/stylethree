package com.thinking.machines.hr.servlets;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.math.*;
import java.text.*;
import java.util.*;
import com.thinking.machines.hr.dl.*;
public class EmployeeDetails extends HttpServlet
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
String employeeId=request.getParameter("employeeId");
PrintWriter pw=response.getWriter();
response.setContentType("text/plain");
String responseData="";
try
{
EmployeeDTO employeeDTO=new EmployeeDAO().getByEmployeeId(employeeId);
responseData+=employeeId+",";
responseData+=employeeDTO.getName()+",";
responseData+=employeeDTO.getDesignationCode()+",";
responseData+=new SimpleDateFormat("yyyy-MM-dd").format(employeeDTO.getDateOfBirth())+",";
responseData+=employeeDTO.getGender()+",";
if(employeeDTO.isIndian()) responseData+="true,";
else responseData+="false,";
responseData+=employeeDTO.getBasicSalary().toPlainString()+",";
responseData+=employeeDTO.getPANNumber()+",";
responseData+=employeeDTO.getAadharCardNumber()+",";
responseData+=new DesignationDAO().getByCode(employeeDTO.getDesignationCode()).getTitle();
}catch(DAOException daoException)
{
responseData+="invalid";
}
pw.print(responseData);
System.out.println("EmployeeDetails is working fine");
}catch(Exception exception)
{
System.out.println(exception);
try
{
response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
}catch(IOException ioException){}
}
}
}
