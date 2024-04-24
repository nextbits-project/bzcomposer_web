package com.avibha.common.mail;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.avibha.common.log.Loger;
import com.nxsol.bizcomposer.common.EmailSenderDto;

public class SmtpMailSend {

	static Properties properties = new Properties();
    static {
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
    }
    
    public boolean sendMail(String txtTo, String txtSubject, String txtMessage, EmailSenderDto emailSenderDto) {
    	boolean flag = true;
    	//update bca_preference set Mailserver='smtp.gmail.com', Mail_username='rohitpatidar364@gmail.com', Mail_password='pvzp uixs mjnl mylj', Mail_senderEmail='rohitpatidar364@gmail.com' WHERE CompanyID=1;
    	//please update according to mail configuration
    	String frommail = emailSenderDto.getMailSenderEmail();
    	String user = emailSenderDto.getMailUsername();
    	String password = emailSenderDto.getMailPassword();
    	properties.put("mail.smtp.host", emailSenderDto.getMailServer());
    	
    	Loger.log("Email to:"+txtTo+" txtSubject:"+txtSubject+" frommail:"+frommail+" user"+user+" password******");
		Session session = Session.getDefaultInstance(properties, new javax.mail.Authenticator() {
		    protected PasswordAuthentication getPasswordAuthentication() {  
		    return new PasswordAuthentication(user,password);  
		      }  
		    });  
		  
		   //Compose the message
		try {
			MimeMessage message = new MimeMessage(session);  
			message.setFrom(new InternetAddress(frommail));  
			message.addRecipient(Message.RecipientType.TO,new InternetAddress(txtTo));  
			message.setSubject(txtSubject);  
			message.setText(txtMessage);  
		    //send the message  
			Transport.send(message);
			System.out.println("message sent successfully...");
		 	} catch (MessagingException e) {
		 		flag = false;
		 		Loger.log(Loger.DEBUG, e);
		 		e.printStackTrace();
		 	}
			return flag;
    }
}
