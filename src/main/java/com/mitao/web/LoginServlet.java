package com.mitao.web;

import com.mitao.pojo.User;
import com.mitao.service.UserService;
import com.mitao.service.impl.UserServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/loginServlet")
public class LoginServlet extends HttpServlet {
    private UserService userService = new UserServiceImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        User login = userService.login(new User(null, username, password, null));

        if(login == null){
            req.getRequestDispatcher("/pages/user/login.html").forward(req,resp);
        }
        else{
            req.getRequestDispatcher("/pages/user/login_success.html").forward(req,resp);
        }
    }
}
