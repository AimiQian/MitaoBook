package com.mitao.filter;

import com.mitao.pojo.User;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@WebFilter(filterName = "ManagerFilter")
public class ManagerFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        User user = (User) httpServletRequest.getSession().getAttribute("user");


        if(!user.getUsername().equals("admin")){
            request.setAttribute("isManager", false);
            httpServletRequest.getRequestDispatcher("/pages/user/login_success.jsp").forward(request,response);
        }else{
            request.setAttribute("isManager", true);
            chain.doFilter(request,response);
        }
    }
}
