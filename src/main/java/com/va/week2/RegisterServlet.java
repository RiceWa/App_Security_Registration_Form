package com.va.week2;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final RegisterDao dao = new RegisterDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RegisterForm f = new RegisterForm();
        f.userId = request.getParameter("userId");
        f.password = request.getParameter("password");
        f.name = request.getParameter("name");
        f.address = request.getParameter("address");
        f.country = request.getParameter("country");
        f.zip = request.getParameter("zip");
        f.email = request.getParameter("email");
        f.sex = request.getParameter("sex");

        String[] langs = request.getParameterValues("language");
        f.language = (langs != null && langs.length > 0) ? langs[0] : "";

        f.about = request.getParameter("about");

        try {
        	int result = dao.registerForm(f);
        	System.out.println(result);

        } catch (ClassNotFoundException e) {
            throw new ServletException(e);
        }

        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }
}
