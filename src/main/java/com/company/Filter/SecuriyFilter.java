package com.company.Filter;

import com.company.util.ControlUtil;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter(filterName = "Securityfilter",urlPatterns = {"*"})
public class SecuriyFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) {
            HttpServletResponse res = (HttpServletResponse) response;
        HttpServletRequest req = (HttpServletRequest) request;

        try {

            if (!req.getRequestURI().contains("/login") && (req.getSession().getAttribute("loggedInUser") == null)) {
                res.sendRedirect("login");
            } else {
                chain.doFilter(request, response);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

    @Override
    public void destroy() {

    }


}
