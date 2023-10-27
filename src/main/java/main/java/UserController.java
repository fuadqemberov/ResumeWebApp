package main.java;



import com.mycompany.Context.Context;
import com.mycompany.DaoInter.CountryDaoInter;
import com.mycompany.entity.Country;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Fuad
 */
@WebServlet(name = "UserController" , urlPatterns = {"/UserController"})
public class UserController extends HttpServlet {

    private CountryDaoInter dao = Context.instanceCountryDao();


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.valueOf(request.getParameter("id"));
        String name = String.valueOf(request.getParameter("name"));
        String nationality = String.valueOf(request.getParameter("nationality"));

        dao.addCountry(new Country(id,name,nationality));
        response.sendRedirect("user.jsp");



    }


}
