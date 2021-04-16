package com.csw.controller;

import com.csw.entity.Dept;
import com.csw.service.DeptService;
import com.csw.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("d")
public class DeptController {
    @Autowired
    private DeptService deptService;
    @Autowired
    private EmpService empService;

    @RequestMapping("showAll")
    public String showAll(HttpServletRequest request) {
        List<Dept> depts = deptService.queryAll();
        request.setAttribute("depts", depts);
        return "dept/deptlist";
    }

    @RequestMapping("delete")
    public String delete(String deptid) {
        empService.delete(deptid);
        deptService.delete(deptid);
        return "redirect:/d/showAll";
    }

    @RequestMapping("updatefirst")
    public String updatefirst(String deptid, HttpServletRequest request) {
        Dept dept = deptService.queryById(deptid);
        request.setAttribute("dept", dept);
        return "dept/updateDept";
    }

    @RequestMapping("updatelast")
    public String updatelast(Dept dept) {
        System.out.println("dept//：" + dept);
        deptService.update(dept);
        return "redirect:/d/showAll";
    }

    @RequestMapping("add")
    public String add(Dept dept) {
        dept.setId(UUID.randomUUID().toString());
        deptService.add(dept);
        return "redirect:/d/showAll";
    }
}
