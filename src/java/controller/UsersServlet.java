/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;


import dao.UsersDAO;
import java.io.IOException;
import java.util.regex.Matcher;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Users;
import org.apache.commons.codec.digest.DigestUtils;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

/**
 *
 * @author TrongNhan
 */
public class UsersServlet extends HttpServlet {
    private final UsersDAO usersDAO = new UsersDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // viet phuong thuc
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String command = request.getParameter("command");
        String url = "/index.jsp";
        Users users = new Users();
        HttpSession session = request.getSession();
        switch (command) {
            case "insert":{
//                String Email = "^[\\w-_.]{5,15}+\\@[\\w&&[^0-9]]{5,8}+.com+$";
                String Email = "[\\w\\-_.]{0,30}\\@gmail\\.com(\\.\\w*)*";
                
                   Pattern pattern = Pattern.compile(Email);
                   Matcher matcheremail = pattern.matcher(request.getParameter("Email"));
                   if(matcheremail.find()){
                        try {
                 
                   
                            users.setUserID(new java.util.Date().getTime());
                            users.setFullName(request.getParameter("fullname"));
                            users.setUserEmail(request.getParameter("Email"));
                            users.setUserPass(DigestUtils.md5Hex(request.getParameter("Password")));
                            usersDAO.insertUser(users);
                            session.setAttribute("user", users);
                            url = "/login.jsp";
                        } catch (Exception e) {
                            System.out.println("Loi " );
                        }
                    } else {
                       url = "/register.jsp";
                    }
            
                break; 
            }
        case "login":
          try {
                users = usersDAO.login(request.getParameter("email"),
             request.getParameter("password"));
                if (users != null) {session.setAttribute("user", users);
                    url = "/index.jsp";
                } else {
                    session.setAttribute("error", "sai email hoac mat khau!");
                    url = "/login.jsp";
                }
           } catch (Exception e) {
              
                System.out.println("Loi " );
            
            break;
        }
        

    }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
}}
   