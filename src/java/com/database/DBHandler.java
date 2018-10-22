/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Mohammad
 */
public class DBHandler {

    private String url = "jdbc:mysql://localhost:3306/yourdb?useSSL=false&useUnicode=true&characterEncoding=utf-8";
    private String username = "yourUname";
    private String password = "yourPassword";  
    private Connection conn;
    private Statement stm;
    private ResultSet rst;

    public void open() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = (Connection) DriverManager.getConnection(url, username, password);
            // I have altered here..........!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        } catch (Exception e) {
            System.err.println("[*] ERROR : DBHandler/open : " + e);
        }
    }

    public void close() {
        try {
            if (!conn.isClosed()) {
                conn.close();
            }
        } catch (SQLException e) {
            System.err.println("[*] ERROR : DBHandler/close : " + e);
        }
    }

    public void saveMessage(String date, String msg) {
        try {
            String query = "INSERT INTO `mobtakerandb`.`tbl_message_maroufsho` "
                    + "("
                    + "`dateSend`, "
                    + "`successfullPaymentMessage`, "
                    + "`failedPaymentMessage`) "
                    + "VALUES "
                    + "("
                    + "'" + date + "', "
                    + "'" + msg + "', "
                    + "'')";
            stm = conn.createStatement();
            stm.executeUpdate(query);
        } catch (SQLException e) {
            System.err.println("[*] ERROR : DBHandler/saveMessage : " + e.getMessage());
        }
    }

    public ReadData getAllMessage() {
        List<Integer> lstId = new ArrayList<>();
        List<String> lstDate = new ArrayList<>();
        List<String> lstMsg = new ArrayList<>();
        try {
            String query = "SELECT * FROM `yourdb`.`yourTable`";
            stm = conn.createStatement();
            rst = stm.executeQuery(query);
            while (rst.next()) {
                lstId.add(rst.getInt("indx"));
                lstDate.add(rst.getString("dateSend"));
                lstMsg.add(rst.getString("successfullPaymentMessage"));
            }
        } catch (SQLException e) {
            System.err.println("[*] ERROR : DBHandler/getAllMessage : " + e.getMessage());
        }
        ReadData rd = new ReadData(lstId, lstDate, lstMsg);
        return rd;
    }

    public void removeMessage(int id) {
        try {
            String query = "DELETE FROM `yourdb`.`yourTable` WHERE `indx`='" + id + "'";
            stm = conn.createStatement();
            stm.executeUpdate(query);
        } catch (SQLException e) {
            System.err.println("[*] ERROR : DBHandler/removeMessage : " + e.getMessage());
        }
    }

    public ReadData searcher(String srchMsg) {
        ReadData rd = new ReadData();
        try {
            List<String> lstDate = new ArrayList<>();
            List<Integer> lstID = new ArrayList<>();
            List<String> lstMsg = new ArrayList<>();
            String querry = "SELECT * FROM `yourdb`.`yourTable` WHERE `successfullPaymentMessage` LIKE '%" + srchMsg + "%'";
            stm = conn.createStatement();
            rst = stm.executeQuery(querry);
            while (rst.next()) {
                lstDate.add(rst.getString("dateSend"));
                lstID.add(rst.getInt("indx"));
                lstMsg.add(rst.getString("successfullPaymentMessage"));
            }
            rd = new ReadData(lstID, lstDate, lstMsg);
        } catch (Exception ex) {
            System.out.println("[*] ERROR : DBHandler/searcher :" + ex);
        }
        return rd;
    }
    
        public ReadData dateSearcher(String srchmsg) {
        ReadData rd = new ReadData();

        try {

            List<String> lstDate = new ArrayList<>();
            List<Integer> lstID = new ArrayList<>();
            List<String> lstMsg = new ArrayList<>();
            String querry = "SELECT * FROM `yourdb`.`yourTable` WHERE `datesend` LIKE '%" +srchmsg+ "%'";
            stm = conn.createStatement();
            rst = stm.executeQuery(querry);

            while (rst.next()) {
                lstDate.add(rst.getString("datesend"));
                lstID.add(rst.getInt("indx"));
                lstMsg.add(rst.getString("successfullPaymentMessage"));
            }
            rd = new ReadData(lstID, lstDate, lstMsg);

        } catch (Exception xx) {
            System.err.println("[*] ERROR : DBHandler/searcher  : " + xx);
        }
        return rd;
    }

    public int duplicate(String duplicateDate) {
        int ans = 0;
        try {
            String query = "SELECT COUNT(*) FROM `yourdb`.`yourTable`"
                    + "WHERE `dateSend` LIKE '%" + duplicateDate + "%'";
            stm = conn.createStatement();
            rst = stm.executeQuery(query);
            rst.next();
            ans = rst.getInt(1);
        } catch (SQLException x) {
            System.out.println("[*] ERROR : DBHandler/dupicateDate :" + x);
        }

        return ans;
    }

    public void update(String msg, String date) {
        try {
            String query = "UPDATE `yourdb`.`yourTable`"
                    + "SET `successfullPaymentMessage`='" + msg + "' WHERE `dateSend` LIKE '" + date + "'";
            stm = conn.createStatement();
            stm.executeUpdate(query);
        }
        catch (Exception ex){
            System.out.println("[*] ERROR : DBHandler/update :" + ex);
        }
    }

}
