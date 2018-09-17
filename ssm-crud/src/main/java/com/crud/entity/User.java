package com.crud.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class User {

    private Date birthday;

    public Date getBirthday() {
        return birthday;
    }
    @DateTimeFormat(pattern = "yyyy/MM/dd")
    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }
}
