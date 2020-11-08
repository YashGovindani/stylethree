package com.thinking.machines.hr.servlets;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import com.thinking.machines.hr.dl.*;
import java.util.*;
import java.math.*;
import java.text.*;
public class UpdateEmployee extends HttpServlet
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
EmployeeDTO employeeDTO=new EmployeeDTO();
employeeDTO.setEmployeeId(request.getParameter("employeeId").trim());
System.out.println("Employee Id : ("+employeeDTO.getEmployeeId()+")");
employeeDTO.setName(request.getParameter("name"));
System.out.println("Name : "+employeeDTO.getName());
employeeDTO.setDesignationCode(Integer.parseInt(request.getParameter("designation")));
System.out.println("Designation code : "+employeeDTO.getDesignationCode());
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
System.out.println("sdf created");
employeeDTO.setDateOfBirth(sdf.parse(request.getParameter("dateOfBirth")));
System.out.println("date set");
System.out.println("Date of birth : "+sdf.format(employeeDTO.getDateOfBirth()));
if(request.getParameter("gender").equalsIgnoreCase("Male")) employeeDTO.setGender(employeeDTO.MALE);
else employeeDTO.setGender(employeeDTO.FEMALE);
System.out.println("Gender : "+employeeDTO.getGender());
if(request.getParameter("isIndian").equalsIgnoreCase("True")) employeeDTO.isIndian(true);
else employeeDTO.isIndian(false);
System.out.println("isIndian : "+employeeDTO.isIndian());
employeeDTO.setBasicSalary(new BigDecimal(request.getParameter("basicSalary")));
System.out.println("Basic Salary : "+employeeDTO.getBasicSalary());
employeeDTO.setPANNumber(request.getParameter("panNumber"));
System.out.println("PAN number : "+employeeDTO.getPANNumber());
employeeDTO.setAadharCardNumber(request.getParameter("aadharCardNumber"));
System.out.println("Aadhar card number : "+employeeDTO.getAadharCardNumber());
String errorString="error";
PrintWriter pw=response.getWriter();
response.setContentType("text/plain");
String responseData;
try
{
if(new DesignationDAO().codeExists(employeeDTO.getDesignationCode())==false) errorString+=",designation,Invalid Designation";
EmployeeDAO employeeDAO=new EmployeeDAO();
if(employeeDAO.panNumberExists(employeeDTO.getPANNumber()) && employeeDAO.getByPanNumber(employeeDTO.getPANNumber()).getEmployeeId().equalsIgnoreCase(employeeDTO.getEmployeeId())==false) errorString+=",panNumber,PAN number exists";
if(employeeDAO.aadharCardNumberExists(employeeDTO.getAadharCardNumber()) && employeeDAO.getByAadharCardNumber(employeeDTO.getAadharCardNumber()).getEmployeeId().equalsIgnoreCase(employeeDTO.getEmployeeId())==false) errorString+=",aadharCardNumber,Aadhar card number exists";
employeeDAO.update(employeeDTO);
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
