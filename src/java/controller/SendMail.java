/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

/**
 *
 * @author TrongNhan
 */
public class SendMail {
    private String to, from, subject, message;

    public SendMail(String to, String from, String subject, String message) {
        this.to = to;
        this.from = from;
        this.subject = subject;
        this.message = message;
    }
    

    
    public void sendMail() {
        final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
        final String username = "bdsvippro@gmail.com";//
        final String password = "908764ha";
        String host = "smtp.gmail.com";
        Properties properties = System.getProperties();
        properties.setProperty("mail.smtp.host", host);
        properties.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
        properties.setProperty("mail.smtp.socketFactory.fallback", "false");
        properties.setProperty("mail.smtp.port", "465");
        properties.setProperty("mail.smtp.socketFactory.port", "465");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.debug", "true");
        properties.put("mail.store.protocol", "pop3");
        properties.put("mail.transport.protocol", "smtp");
        
        // Get the default Session object.
        try{
        Session session = Session.getDefaultInstance(properties, 
                            new Authenticator(){
                               protected PasswordAuthentication getPasswordAuthentication() {
                                  return new PasswordAuthentication(username, password);
                               }});

        // -- Create a new message --
        Message msg = new MimeMessage(session);

        // -- Set the FROM and TO fields --
        msg.setFrom(new InternetAddress(from));
        msg.setRecipients(Message.RecipientType.TO, 
                          InternetAddress.parse(to ,false));
        msg.setSubject(subject);
        msg.setText(message);
        msg.setSentDate(new Date());
        Transport.send(msg);
        System.out.println("Message sent.");
      } catch (MessagingException e){ 
        System.out.println("Error, cause: " + e);
      }
        
    }
    public static void main(String [] args) { 
        // ví dụ cách sử dụng class SendMail
        String to = "hoangungdai@gmail.com";
        String from = "bdsvippro@gmail.com";
        String subject = "test thử";
        String message = "Bất động sản";
        SendMail mail = new SendMail(to, from, subject, message);
        mail.sendMail();
//      final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
//      final String username = "bdsvippro@gmail.com";//
//      final String password = "908764ha";
//      // Recipient's email ID needs to be mentioned.
//      String to = "hoangungdai@gmail.com";
//
//      // Sender's email ID needs to be mentioned
//      String from = "bdsvippro@gmail.com";
//
//      // Assuming you are sending email from localhost
//      String host = "smtp.gmail.com";
//
//      // Get system properties
//       Properties properties = System.getProperties();
//      
//      // Setup mail and password
////      properties.setProperty("mail.user", username);
////      properties.setProperty("mail.password", password);
//      properties.setProperty("mail.smtp.host", host);
//      properties.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
//      properties.setProperty("mail.smtp.socketFactory.fallback", "false");
//      properties.setProperty("mail.smtp.port", "465");
//      properties.setProperty("mail.smtp.socketFactory.port", "465");
//      properties.put("mail.smtp.auth", "true");
//      properties.put("mail.debug", "true");
//      properties.put("mail.store.protocol", "pop3");
//      properties.put("mail.transport.protocol", "smtp");
//      
//
//      // Get the default Session object.
//      try{
//      Session session = Session.getDefaultInstance(properties, 
//                          new Authenticator(){
//                             protected PasswordAuthentication getPasswordAuthentication() {
//                                return new PasswordAuthentication(username, password);
//                             }});
//
//   // -- Create a new message --
//      Message msg = new MimeMessage(session);
//
//   // -- Set the FROM and TO fields --
//      msg.setFrom(new InternetAddress(from));
//      msg.setRecipients(Message.RecipientType.TO, 
//                        InternetAddress.parse(to ,false));
//      msg.setSubject("Hello");
//      msg.setText("How are you");
//      msg.setSentDate(new Date());
//      Transport.send(msg);
//      System.out.println("Message sent.");
//    }catch (MessagingException e){ 
//      System.out.println("Error, cause: " + e);
//    }
  }
}
