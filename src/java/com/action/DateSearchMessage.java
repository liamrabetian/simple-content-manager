/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Mohammad
 */
@WebServlet(name = "DateSearchMessage ", urlPatterns = {"/DateSearchMessage"})
public class DateSearchMessage extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String content = request.getParameter("date");
//        String[] str =content.split("/");
//        String newDate = str[2] + "-" + str[0] + "-" + str[1];
        
        request.setAttribute("Message", content);

        RequestDispatcher ds = request.getRequestDispatcher("datePage.jsp");
        ds.forward(request, response);

    }

}
