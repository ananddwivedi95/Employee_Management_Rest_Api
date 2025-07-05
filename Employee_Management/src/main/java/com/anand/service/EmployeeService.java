package com.anand.service;

import com.anand.dboperation.EmployeeDbOperation;
import com.anand.entity.EmployeeEntity;
import com.anand.entityresponse.EmployeeDetailsRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class EmployeeService {
    @Autowired
    EmployeeDbOperation employeeDbOperation;

    //for add new employee details
    public EmployeeEntity addNewEmployee(EmployeeDetailsRequest request)
    {
        //convert EmployeeDetailsRequest object to entity object

        EmployeeEntity entity=new EmployeeEntity();
        entity.setName(request.getName());
        entity.setEmail(request.getEmail());
        entity.setPhone(request.getPhone());
        entity.setAddress(request.getAddress());
        entity.setDepartment(request.getDepartment());
        entity.setDesignation(request.getDesignation());
        entity.setSalary(request.getSalary());
        entity.setDateOfJoining(request.getDateOfJoining());


       EmployeeEntity response= employeeDbOperation.addNewEmployee(entity);
        return response;
    }
    //for add view al employee details
    public List<EmployeeEntity> viewAllEmployeeDetails()
    {
        List<EmployeeEntity> response=employeeDbOperation.viewAllEmployeeDetails();
        return response;
    }

    //for update employee details
    public EmployeeEntity updateEmployeeDetails(int id,EmployeeDetailsRequest request)
    {
        EmployeeEntity existingEmployee = employeeDbOperation.findByEmployeeId(id).orElse(null);
        if (existingEmployee == null) {
            throw new RuntimeException("Employee not found with id: " + id);
        }

        // Update fields from the request
        existingEmployee.setName(request.getName());
        existingEmployee.setEmail(request.getEmail());
        existingEmployee.setPhone(request.getPhone());
        existingEmployee.setAddress(request.getAddress());
        existingEmployee.setDepartment(request.getDepartment());
        existingEmployee.setDesignation(request.getDesignation());
        existingEmployee.setSalary(request.getSalary());
        existingEmployee.setDateOfJoining(request.getDateOfJoining());

        EmployeeEntity response=employeeDbOperation.addNewEmployee(existingEmployee);
        return response;
    }

    public String deleteEmployeeDetails(int id)
    {
        EmployeeEntity entity=employeeDbOperation.findByEmployeeId(id).orElse(null);
        if(entity==null)
        {
            throw new RuntimeException("Employee not found with id: "+id);
        }
        return employeeDbOperation.deleteEmployeeDetails(id);
    }

    
    public Optional<EmployeeEntity> viewEmployeeDetailsById(int id)
    {
        return employeeDbOperation.findByEmployeeId(id);
    }
}
