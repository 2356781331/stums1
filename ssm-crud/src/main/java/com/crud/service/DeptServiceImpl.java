package com.crud.service;

import com.crud.dao.DeptMapper;
import com.crud.entity.Dept;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service()
public class DeptServiceImpl implements DeptService {
    @Autowired
    DeptMapper deptMapper;
    public List<Dept> selectByExample() {
        return  deptMapper.selectByExample(null);
    }
}
