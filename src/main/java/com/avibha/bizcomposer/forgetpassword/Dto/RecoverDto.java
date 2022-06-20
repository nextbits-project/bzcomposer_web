package com.avibha.bizcomposer.forgetpassword.Dto;

public class RecoverDto {
    String userName;
    String passwordHint;
    String passwordAnswer;
    String password;
    String emailAddress;

    public String getEmailAddress() {
        return emailAddress;
    }
    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getUserName() {
        return userName;
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }
    public String getPasswordHint() {
        return passwordHint;
    }
    public void setPasswordHint(String passwordHint) {
        this.passwordHint = passwordHint;
    }
    public String getPasswordAnswer() {
        return passwordAnswer;
    }
    public void setPasswordAnswer(String passwordAnswer) {
        this.passwordAnswer = passwordAnswer;
    }
}
