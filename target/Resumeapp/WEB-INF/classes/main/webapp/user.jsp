
    Document   : MyJsp
    Created on : Oct 26, 2023, 9:27:43 AM
    Author     : Fuad
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

            
            
            %>
            
            <div>
                <form action="UserController" method="POST"
                <label for="id">id:</label>
                <input type="text" name="id" value=""/>
                
                <label for="name">Country name:</label>
                <input type="text" name="name" value=""/>
                
                <label for="nationality">Nationality name:</label>
                <input type="text" name="nationality" value=""/>
                
                <input type="submit" name="add" value="Add" />
                       
                   </form>
                
              </div>
    </body>
</html>
