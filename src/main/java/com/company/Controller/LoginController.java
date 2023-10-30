package com.company.Controller;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.company.util.ControlUtil;
import com.mycompany.Context.Context;
import com.mycompany.DaoInter.UserDaoInter;
import com.mycompany.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.concurrent.BrokenBarrierException;

@WebServlet(name = "LoginController" , urlPatterns = {"/login"})
public class LoginController extends HttpServlet {
    private UserDaoInter userDaoInter = Context.instanceUserDao();
    private BCrypt.Hasher crypt= BCrypt.withDefaults();
    private  static BCrypt.Verifyer verifyer = BCrypt.verifyer();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

             request.getRequestDispatcher("login.jsp").forward(request,response);

    }

    protected void doPost (HttpServletRequest request, HttpServletResponse response){

       try {
           String email = request.getParameter("email");
           String password = request.getParameter("password");
           User user = userDaoInter.findByEmail(email);

           if (user == null)
               throw new IllegalArgumentException("User doesn't exist !!!");

           BCrypt.Result rs = verifyer.verify(password.toCharArray(),user.getPassword().toCharArray());
           if(!rs.verified){
               throw new IllegalArgumentException("Password is not correct !");
           }
           request.getSession().setAttribute("loggedInUser", user);
           response.sendRedirect("users");
       }catch (Exception ex){
           ControlUtil.errorPage(response,ex);
       }
    }

}
