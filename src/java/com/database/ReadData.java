/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.database;

import java.util.List;

/**
 *
 * @author Mohammad
 */
public class ReadData {

    private List<Integer> lstId;
    private List<String> lstDate;
    private List<String> lstMsg;

    public ReadData() {
    }

    public ReadData(List<Integer> lstId, List<String> lstDate, List<String> lstMsg) {
        this.lstId = lstId;
        this.lstDate = lstDate;
        this.lstMsg = lstMsg;
    }

    public List<Integer> getLstId() {
        return lstId;
    }

    public void setLstId(List<Integer> lstId) {
        this.lstId = lstId;
    }

    public List<String> getLstDate() {
        return lstDate;
    }

    public void setLstDate(List<String> lstDate) {
        this.lstDate = lstDate;
    }

    public List<String> getLstMsg() {
        return lstMsg;
    }

    public void setLstMsg(List<String> lstMsg) {
        this.lstMsg = lstMsg;
    }

}
