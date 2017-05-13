/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package rms.model;

import java.sql.Timestamp;

/**
 *
 * @author sony
 */
public class ApprovalContractor {
    private int contractorcode;
    private int id;
    private String name,position,reason_not_approve,contractorname;
    private Timestamp date;

    public int getContractorcode() {
        return contractorcode;
    }

    public void setContractorcode(int contractorcode) {
        this.contractorcode = contractorcode;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getReason_not_approve() {
        return reason_not_approve;
    }

    public void setReason_not_approve(String reason_not_approve) {
        this.reason_not_approve = reason_not_approve;
    }

    public String getContractorname() {
        return contractorname;
    }

    public void setContractorname(String contractorname) {
        this.contractorname = contractorname;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }
    
    
}
