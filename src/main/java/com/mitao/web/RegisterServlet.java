package com.mitao.web;

import com.mitao.pojo.User;
import com.mitao.service.UserService;
import com.mitao.service.impl.UserServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "RegisterServlet", value = "/registerServlet")
public class RegisterServlet extends HttpServlet {
    private UserService userService = new UserServiceImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String code = req.getParameter("code");

        //bnbnp
        if("bnbnp".equalsIgnoreCase(code)){
            if(userService.exitsUsername(username)){
                req.getRequestDispatcher("/pages/user/regist.html").forward(req,resp);
            }else {
                userService.registerUser(new User(null,username,password,email));
                req.getRequestDispatcher("/pages/user/regist_success.html").forward(req,resp);
            }

        }else{
            req.getRequestDispatcher("/pages/user/regist.html").forward(req,resp);
        }
    }
}
