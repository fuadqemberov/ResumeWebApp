
<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.DaoInter.CountryDaoInter" %>
<%@ page import="com.mycompany.entity.Country" %>
<%@ page import="com.mycompany.Context.Context" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            CountryDaoInter dao = Context.instanceCountryDao();
            List<Country> list = dao.getAll();
             %>
            
            <div class="form-group">
                <form action="UserController" method="POST">
                <label for="id">id:</label>
                <input class="form-control" type="text" name="id" value=""/>
                
                <label for="name">Country name:</label>
                <input class="form-control" type="text" name="name" value=""/>
                
                <label for="nationality">Nationality name:</label>
                <input class="form-control" type="text" name="nationality" value=""/>

                    <button type="submit" class="btn btn-primary" value="add">Add</button>
                       
                   </form>
                
              </div>

    <div>
        <table>
            <thead>
            <tr>
                <th>Country ID</th>
                <th>Country name</th>
                <th> Nationality </th>
            </tr>
            </thead>
            <tbody>

            <%
 for(Country c : list){
            %>
            <tr>
                <td><%=c.getId()%></td>
                <td><%=c.getName()%></td>
                <td><%=c.getNationality()%></td>
                <td>
                    <button type="button" name="action" value="delete" class="btn btn-danger">
                        <i class="bi bi-x-circle"></i>
                    </button>

                    <button type="button" name="action" value="update" class="btn btn-info">
                        <i class="bi bi-pen-fill"></i>
                    </button>
                </td>

            </tr>
     <%}%>
            </tbody>
        </table>

            </tbody>


        </table>


    </div>


    </body>
</html>
