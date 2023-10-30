
<%@ page import="java.util.List" %>

<%@ page import="com.mycompany.entity.Country" %>
<%@ page import="com.mycompany.Context.Context" %>
<%@ page import="com.mycompany.DaoInter.UserDaoInter" %>
<%@ page import="com.mycompany.entity.User" %>
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
            UserDaoInter dao = Context.instanceUserDao();
            List<User> list = dao.getAll2();
             %>
            
            <div class="form-group">
                <form action="userdetail" method="POST">
                <label for="id">id:</label>
                <input class="form-control" type="text" name="id" value=""/>
                
                <label for="name">Country name:</label>
                <input class="form-control" type="text" name="name" value=""/>
                
                <label for="nationality">Nationality name:</label>
                <input class="form-control" type="text" name="nationality" value=""/>
                    <input type="hidden" name="action" value="add">
                    <button type="submit" class="btn btn-primary" value="add">Add</button>
                       
                   </form>
                
              </div>

    <div>
        <table>
            <thead>
            <tr>
                <th>User id</th>
                <th>Name</th>
                <th> Surname </th>
                <th>Birth date</th>
                <th>Phone</th>
                <th> Email </th>
                <th> Nationality </th>
            </tr>
            </thead>
            <tbody>

            <%
 for(User u : list){
            %>
            <tr>
                <td><%=u.getId()%></td>
                <td><%=u.getName()%></td>
                <td><%=u.getSurname()%></td>
                <td><%=u.getBirthDate()%></td>
                <td><%=u.getPhone()%></td>
                <td><%=u.getEmail()%></td>
                <td><%=u.getNationality().getNationality()%></td>




                <td>

                    <form action="userdetail" method="POST">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="id" value="<%=u.getId()%>">

                    <button type="submit" value="delete" class="btn btn-danger">
                       <i class="bi bi-x-circle"></i>
                    </button>

                    </form>
                    <form action="userdetail" method="GET">
                        <input type="hidden" name="id" value="<%=u.getId()%>">
                        <input type="hidden" name="action" value="update">

                        <button type="submit"  value="update" class="btn btn-info">
                            <i class="bi bi-pen-fill"></i>
                        </button>
                    </form>

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
