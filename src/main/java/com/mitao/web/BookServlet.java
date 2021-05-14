package com.mitao.web;

import com.mitao.pojo.Book;
import com.mitao.pojo.Page;
import com.mitao.service.BookService;
import com.mitao.service.impl.BookServiceImpl;
import com.mitao.utils.WebUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BookServlet", value = "/manager/bookServlet")
public class BookServlet extends BaseServlet {
    BookService bookService = new BookServiceImpl();

    protected void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        int pageNo = WebUtils.parseInt(request.getParameter("pageNo"),0) + 1;
        Book book = WebUtils.copyParamToBean(request.getParameterMap(),new Book());
        bookService.addBook(book);
//        request.getRequestDispatcher("/manager/bookServlet?action=list").forward(request,response);

        response.sendRedirect(request.getContextPath() + "/manager/bookServlet?action=page&pageNo=" + pageNo);

    }

    protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String idString = request.getParameter("id");
        int id = WebUtils.parseInt(idString,0);
        bookService.deleteBookById(id);
        response.sendRedirect(request.getContextPath() + "/manager/bookServlet?action=page&pageNo=" + request.getParameter("pageNo"));

    }

    protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

        Book book = WebUtils.copyParamToBean(request.getParameterMap(),new Book());
        bookService.updateBook(book);
        response.sendRedirect(request.getContextPath() + "/manager/bookServlet?action=page&pageNo=" + request.getParameter("pageNo"));



    }

    protected void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        List<Book> books = bookService.queryBooks();
        request.setAttribute("books",books);
        request.getRequestDispatcher("/pages/manager/book_manager.jsp").forward(request,response);
    }

    protected void getBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String idString = request.getParameter("id");
        int id = WebUtils.parseInt(idString,0);
        Book book = bookService.queryBookById(id);
        request.setAttribute("book", book);
        request.getRequestDispatcher("/pages/manager/book_edit.jsp").forward(request,response);

    }

    protected void page(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pageNo = WebUtils.parseInt(request.getParameter("pageNo"), 1);
        int pageSize = WebUtils.parseInt(request.getParameter("pageSize"), Page.PAGE_SIZE);


        Page<Book> page = bookService.page(pageNo,pageSize);
        request.setAttribute("page",page);
        request.getRequestDispatcher("/pages/manager/book_manager.jsp").forward(request,response);
    }
}
