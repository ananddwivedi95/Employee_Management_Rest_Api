package com.anand.controller;

import com.anand.entity.EmployeeEntity;
import com.anand.entityresponse.EmployeeDetailsRequest;
import com.anand.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/employee")
public class EmployeeController {

    @Autowired
    EmployeeService service;

    @GetMapping("/welcome")
    public String welcomePage() {
        return "welcomePage";
    }

    @GetMapping("/mainpage")
    public String mainPage()
    {
       return "mainPage";
    }
    @GetMapping("/addEmployeePage")
     public String addEmployeePage()
     {
         return "addEmployeePage";
     }

    ///------------------------------------------------------------------------------------
    @PostMapping("/add")
    @ResponseBody
    public EmployeeEntity addnewEmployee(@RequestBody EmployeeDetailsRequest request ) {
        
        return service.addNewEmployee(request);
    }

    @GetMapping("/view/all")
    @ResponseBody
    public List<EmployeeEntity> viewAllEmployeeDetails(Model model) {

        return service.viewAllEmployeeDetails();
    }

    @PostMapping("/update/{id}")
    @ResponseBody
    public EmployeeEntity updateEmployee(@PathVariable("id") int id, @RequestBody EmployeeDetailsRequest request) {
        return service.updateEmployeeDetails(id, request);
    }

    @DeleteMapping("/delete/{id}")
    @ResponseBody
    public String deleteEmployeeDetails(@PathVariable("id") int id) {
        return service.deleteEmployeeDetails(id);
    }

    @GetMapping("/view/{id}")
    @ResponseBody
    public EmployeeEntity viewEmployeeDetailsById(@PathVariable("id") int id) {
        return service.viewEmployeeDetailsById(id)
                .orElseThrow(() -> new RuntimeException("Employee not found with id: " + id));
    }

    @GetMapping("/check")
    @ResponseBody
    public String check() {
        return "Welcome in String world !!";
    }
}
