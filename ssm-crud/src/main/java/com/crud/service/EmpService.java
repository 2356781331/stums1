package com.crud.service;

import com.crud.dao.EmpMapper;
import com.crud.entity.Emp;
import com.crud.entity.EmpExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EmpService {
    @Autowired
    private EmpMapper empMapper;

    public List<Emp> findAll() {
        return empMapper.selectByExampleWithDept(null);
    }

    public int addEmp(Emp emp) {
        int i = empMapper.insertSelective(emp);
        return i;
    }

    public boolean findEmpByname(String name) {
        EmpExample emp = new EmpExample();
        EmpExample.Criteria criteria = emp.createCriteria();
        criteria.andEmpNameEqualTo(name);
        long count = empMapper.countByExample(emp);
        return count == 0;
    }

    public Emp getEmp(Integer id) {
        return empMapper.selectByPrimaryKeyWithDept(id);
    }

    public void updateEmp(Emp emp) {
        empMapper.updateByPrimaryKeySelective(emp);
    }

    public void deleteEmp(Integer id) {
        empMapper.deleteByPrimaryKey(id);
    }

    public void deleteEmps(List<Integer> list) {
        EmpExample empExample=new EmpExample();
        EmpExample.Criteria criteria = empExample.createCriteria();
        criteria.andEmpIdIn(list);
        empMapper.deleteByExample(empExample);
    }
}
