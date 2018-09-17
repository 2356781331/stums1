package com.crud.service;

import com.crud.dao.DeptMapper;
import com.crud.entity.Dept;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


public interface DeptService {

    public List<Dept> selectByExample();
}
