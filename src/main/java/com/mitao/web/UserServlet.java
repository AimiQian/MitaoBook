package com.mitao.web;

import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.servlet.KaptchaServlet;
import com.google.gson.Gson;
import com.mitao.pojo.User;
import com.mitao.service.UserService;
import com.mitao.service.impl.UserServiceImpl;
import com.mitao.utils.WebUtils;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "UserServlet", value = "/userServlet")
public class UserServlet extends BaseServlet {

    private UserService userService = new UserServiceImpl();

    protected void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        User login = userService.login(new User(null, username, password, null));

        if(login == null){
            req.setAttribute("msg","Username or Password Wrong!");
            req.setAttribute("username",username);
            req.getRequestDispatcher("/pages/user/login.jsp").forward(req,resp);
        }
        else{
            req.getSession().setAttribute("user",login);
            req.getRequestDispatcher("/pages/user/login_success.jsp").forward(req,resp);
        }
    }

    protected void logout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
            HttpSession session = req.getSession();
            if(sessuib != null){
                try{
                session.removeAttribute("user");
                session.invalidate(); 
                resp.sendRedirect(req.getContextPath());}
                catch (Exception ex){
                    System.out.println(ex.getMessage());
                }
            }
            
            
//             req.getSession().removeAttribute("user");
//             req.getSession().invalidate(); 
//             System.out.print(req.getContextPath());
//             resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
//             resp.sendRedirect(req.getContextPath());
    }

    protected void register(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String token = (String)req.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
        req.getSession().removeAttribute(Constants.KAPTCHA_SESSION_KEY);

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String code = req.getParameter("code");

        User user = WebUtils.copyParamToBean(req.getParameterMap(), new User());

        //bnbnp
        if (token!=null && token.equalsIgnoreCase(code)) {
            if (userService.exitsUsername(username)) {

                req.setAttribute("msg", "Username Exists!!");
                req.setAttribute("username", username);
                req.setAttribute("email", email);

                req.getRequestDispatcher("/pages/user/regist.jsp").forward(req, resp);

            } else {
                userService.registerUser(new User(null, username, password, email));
                req.getRequestDispatcher("/pages/user/regist_success.jsp").forward(req, resp);
            }

        } else {
            req.setAttribute("msg", "Wrong Verification Code!!");
            req.setAttribute("username", username);
            req.setAttribute("email", email);
            req.getRequestDispatcher("/pages/user/regist.jsp").forward(req, resp);
        }
    }

    protected void ajaxExitUsername(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //get username
        String username = req.getParameter("username");
        boolean existsUsername = userService.exitsUsername(username);
        Map<String,Object> resultMap = new HashMap<>();
        resultMap.put("existsUsername", existsUsername);

        Gson gson = new Gson();
        String json = gson.toJson(resultMap);

        resp.getWriter().write(json);
    }
}
