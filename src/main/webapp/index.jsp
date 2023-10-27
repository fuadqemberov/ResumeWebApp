<%@ page import="com.mycompany.DaoInter.CountryDaoInter" %>
<%@ page import="com.mycompany.entity.Country" %>
<%@ page import="com.mycompany.Context.Context" %>
<%@ page import="java.util.List" %>
<html>
<body>
<%
CountryDaoInter dao = Context.instanceCountryDao();
List<Country> list = dao.getAll();

%>
<h2>
    <%for(Country c :list){
        System.out.println(c.toString());
            }%>
</h2>
</body>
</html>
