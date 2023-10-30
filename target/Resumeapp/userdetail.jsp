

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
            User u = (User) request.getAttribute("user");

             %>
            
            <div class="form-group">
                <form action="userdetail" method="POST">
                <label for="id">id:</label>
                <input class="form-control" type="text" name="id" value="<%=u.getId() %>"/>
                    <input type="hidden" name="action " value="update">
                
                <label for="name">Name:</label>
                <input class="form-control" type="text" name="name" value="<%=u.getName() %>"/>
                
                <label for="surname">Surname:</label>
                <input class="form-control" type="text" name="surname" value="<%=u.getSurname()%>"/>

                    <label for="birth_date">Birtday:</label>
                    <input class="form-control" type="text" name="birth_date" value="<%=u.getBirthDate()%>"/>

                    <label for="email">Email:</label>
                    <input class="form-control" type="text" name="email" value="<%=u.getEmail()%>"/>

                    <label for="phone">Phone:</label>
                    <input class="form-control" type="text" name="phone" value="<%=u.getPhone()%>"/>

                   <button type="submit" class="btn btn-primary" value="update">Update</button>
                       
                   </form>
                
              </div>



    </body>
</html>
