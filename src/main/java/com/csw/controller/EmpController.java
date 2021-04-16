package com.csw.controller;

import com.csw.entity.Dept;
import com.csw.entity.Emp;
import com.csw.service.DeptService;
import com.csw.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("e")
public class EmpController {
    @Autowired
    private EmpService empService;
    @Autowired
    private DeptService deptService;

    @RequestMapping("queryAndPage")
    public String queryAndPage(HttpServletRequest request, Integer currPage, String deptid) {
        System.out.println("currPage;;" + currPage);
        System.out.println("deptid;;" + deptid);
        HttpSession session = request.getSession();
        System.out.println("deptid//:" + deptid);
        if (deptid != null) {
            session.setAttribute("deptid", deptid);
        }
        if (deptid == null) {
            deptid = (String) session.getAttribute("deptid");
            System.out.println("deptid//:" + deptid);
        }
        /**
         *
         */
        Integer pageSize = 2;
        Integer countPage = empService.countPage(pageSize, deptid);
        request.setAttribute("countPage", countPage);
        if (currPage == -1) {///分页
            currPage = 0;///分页
        }///分页
        if (currPage == 0) {///分页
            currPage = 1;///分页
        }///分页
        if (currPage == countPage + 1) {///分页
            currPage = countPage;///分页
        }///分页
        List<Emp> empList = empService.queryAllAndByPage(currPage, pageSize, countPage, deptid);
        for (Emp emp : empList) {
            System.out.println("empList;;" + emp);
        }
        request.setAttribute("empList", empList);
        request.setAttribute("currPage", currPage);
        return "emp/emplist";
    }

    @RequestMapping("delete")
    public String delete(String id) {
        System.out.println("delete id;;" + id);

        empService.deleteByID(id);
        return "redirect:/e/queryAndPage?currPage=1";
    }

    @RequestMapping("updatefirst")
    public String updatefirst(String id, HttpServletRequest request) {
        System.out.println("updatefirst id;;" + id);
        HttpSession session = request.getSession();
        Emp emp = empService.queryById(id);
        request.setAttribute("emp", emp);
        String deptid = (String) session.getAttribute("deptid");
        Dept dept = deptService.queryById(deptid);
        request.setAttribute("dept", dept);
        List<Dept> depts = deptService.queryAll();
        request.setAttribute("depts", depts);
        return "emp/updateEmp";
    }

    @RequestMapping("update")
    public String update(Emp emp) {
        System.out.println("update emp;;" + emp);
        empService.update(emp);
        return "redirect:/e/queryAndPage?currPage=1";
    }

    @RequestMapping("addfirst")
    public String addfirst(HttpServletRequest request) {
        List<Dept> depts = deptService.queryAll();
        request.setAttribute("depts", depts);
        return "emp/addEmp";
    }

    @RequestMapping("add")
    public String add(Emp emp) {
        System.out.println(" add emp;;" + emp);
        emp.setId(UUID.randomUUID().toString());
        SimpleDateFormat sf = new SimpleDateFormat("yyyy/MM/dd");

        System.out.println(" add emp;;" + emp);
        empService.add(emp);
        return "redirect:/e/queryAndPage?currPage=1";
    }
}
