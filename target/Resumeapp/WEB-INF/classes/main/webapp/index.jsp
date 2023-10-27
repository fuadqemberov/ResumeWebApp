<%@ page import="az.company.Context.Context" %>
<%@ page import="az.company.DaoInter.CountryDaoInter" %>
<%@ page import="az.company.entity.Country" %>
<%@ page import="java.util.List" %>
<html>
<body>
<%
CountryDaoInter dao = Context.instanceCountryDao();
List<Country> list = dao.getAll();

%>
<h2>
    <%=list %>
</h2>
</body>
</html>
