package com.crud.entity;

public class Emp {
    private Integer empId;

    private String empName;

    private String empSex;

    private String email;

    private Integer dId;

    private Dept dept;

    public Dept getDept() {
        return dept;
    }

    public Emp(Integer empId, String empName, String empSex, String email, Integer dId) {
        this.empId = empId;
        this.empName = empName;
        this.empSex = empSex;
        this.email = email;
        this.dId = dId;
    }

    public Emp() {
    }

    public void setDept(Dept dept) {
        this.dept = dept;
    }

    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName == null ? null : empName.trim();
    }

    public String getEmpSex() {
        return empSex;
    }

    public void setEmpSex(String empSex) {
        this.empSex = empSex == null ? null : empSex.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Integer getdId() {
        return dId;
    }

    public void setdId(Integer dId) {
        this.dId = dId;
    }
}