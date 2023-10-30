package com.company.Filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.Filter;

@WebFilter(filterName = "JSPfilter",urlPatterns = {"*.jsp"})
public class JspFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) {
            HttpServletResponse res = (HttpServletResponse) servletResponse;
        try{
         res.sendRedirect("error?msg=not found");
        }
        catch (Exception ex){
              ex.printStackTrace();
        }
    }

    @Override
    public void destroy() {

    }


}
