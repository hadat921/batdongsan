/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author TrongNhan
 */
public class Users {
    private long userID;
    private String fullName;
    private String userEmail;
    private String userPass;

    public Users() {
    }

    public Users(long userID, String fullName, String userEmail, String userPass) {
        this.userID = userID;
        this.fullName = fullName;
        this.userEmail = userEmail;
        this.userPass = userPass;
    }

    public long getUserID() {
        return userID;
    }

    public void setUserID(long userID) {
        this.userID = userID;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPass() {
        return userPass;
    }

    public void setUserPass(String userPass) {
        this.userPass = userPass;
    }

    @Override
    public String toString() {
        return "Users{" + "userID=" + userID + ", fullName=" + fullName + ", userEmail=" + userEmail + ", userPass=" + userPass + '}';
    }

    
    
}
