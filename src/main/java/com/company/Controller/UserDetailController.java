package com.company.Controller;



import com.mycompany.Context.Context;
import com.mycompany.DaoInter.CountryDaoInter;
import com.mycompany.DaoInter.UserDaoInter;
import com.mycompany.entity.Country;
import com.mycompany.entity.User;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Fuad
 */
@WebServlet(name = "UserDetailController" , urlPatterns = {"/userdetail"})
public class UserDetailController extends HttpServlet {

    private UserDaoInter dao = Context.instanceUserDao();


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UserDaoInter userDao = Context.instanceUserDao();
        int id = Integer.valueOf(request.getParameter("id"));
        String action=request.getParameter("action");
        if (action.equals("update")) {
            String name = request.getParameter("name");
            String surname = request.getParameter("surname");

            User user = userDao.getById(id);

            user.setName(name);
            user.setSurname(surname);


            userDao.updateUser(user);
        }else if(action.equals("delete")){
            userDao.removeUserById(id);
        }



        response.sendRedirect("users");

 }

 @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String id1 = request.getParameter("id");

            if (id1 == null || id1.trim().isEmpty())
                throw new IllegalArgumentException("id is not specified ");

            int id = Integer.parseInt(id1);

            UserDaoInter dao = Context.instanceUserDao();
            User u = dao.getById(id);
            if (u == null)
                throw new IllegalArgumentException("there is no user with this id");
            request.setAttribute("user", u);
            request.getRequestDispatcher("userdetail.jsp").forward(request, response);
        }catch (Exception ex){
            ex.printStackTrace();
            response.sendRedirect("error?msg="+ex.getMessage());
        }
 }


}
