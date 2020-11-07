package com.thinking.machines.hr.servlets;
import com.thinking.machines.hr.dl.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ConfirmDeleteDesignation extends HttpServlet
{
public void doGet(HttpServletRequest request,HttpServletResponse response)
{
int code=0;
try
{
code=Integer.parseInt(request.getParameter("code"));
}catch(NumberFormatException numberFormatException)
{
try
{
RequestDispatcher requestDispatcher;
requestDispatcher=request.getRequestDispatcher("/Designations.jsp");
requestDispatcher.forward(request,response);
return;
}catch(Exception exception)
{
// Do nothing
}
}
DesignationDAO designationDAO;
designationDAO=new DesignationDAO();
try
{
if(designationDAO.codeExists(code)==false)
{
try
{
RequestDispatcher requestDispatcher;
requestDispatcher=request.getRequestDispatcher("/Designations.jsp");
requestDispatcher.forward(request,response);
return;
}catch(Exception exception)
{
// Do nothing
}
}
DesignationDTO designationDTO;
designationDTO=designationDAO.getByCode(code);
request.setAttribute("code",designationDTO.getCode());
request.setAttribute("title",designationDTO.getTitle());
try
{
RequestDispatcher requestDispatcher;
requestDispatcher=request.getRequestDispatcher("/ConfirmDeleteDesignation.jsp");
requestDispatcher.forward(request,response);
}catch(Exception exception)
{
// Do nothing
}
}catch(DAOException daoException)
{
// Do nothing
}
}
public void doPost(HttpServletRequest request,HttpServletResponse response)
{
doGet(request,response);
}
}
