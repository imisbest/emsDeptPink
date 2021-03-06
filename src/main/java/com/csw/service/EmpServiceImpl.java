package com.csw.service;

import com.csw.dao.EmpDao;
import com.csw.entity.Emp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class EmpServiceImpl implements EmpService {
    @Autowired
    private EmpDao empDao;

    @Override
    public void delete(String deptid) {
        empDao.deleteBy(deptid);
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public Integer countPage(Integer pageSize, String deptid) {
        Integer countPage = 0;
        Integer count = empDao.queryCount(deptid);
        System.out.println("count;;" + count);
        if (count % pageSize == 0) {
            countPage = count / pageSize;
        } else {
            countPage = count / pageSize + 1;
        }
        return countPage;
    }

    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public List<Emp> queryAllAndByPage(Integer currPage, Integer pageSize, Integer countPage, String deptid) {
        System.out.println("currPage;;" + currPage);
        System.out.println("pageSize;;" + pageSize);
        System.out.println("countPage;;" + countPage);
        Integer firstIndex;
        Integer lastIndex;
        if (currPage != countPage) {
            firstIndex = (currPage - 1) * pageSize + 1;
            lastIndex = currPage * pageSize;
        } else {
            firstIndex = (currPage - 1) * pageSize + 1;
            lastIndex = empDao.queryCount(deptid);
        }
        System.out.println("firstIndex-1//:" + (firstIndex - 1));
        System.out.println("pageSize//:" + pageSize);
        firstIndex = firstIndex - 1;
        if (firstIndex == ((currPage - 1) * pageSize + 1) - 1) {
            firstIndex = 0;
        }
        return empDao.queryAllAndByPage(firstIndex, pageSize, deptid);
    }

    @Override
    public void deleteByID(String id) {
        empDao.deleteByID(id);
    }

    @Override
    public Emp queryById(String id) {
        return empDao.queryById(id);
    }

    @Override
    public void update(Emp emp) {
        empDao.update(emp);
    }

    @Override
    public void add(Emp emp) {
        empDao.add(emp);
    }
}
