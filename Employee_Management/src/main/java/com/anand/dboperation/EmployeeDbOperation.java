package com.anand.dboperation;

import com.anand.employeerepository.EmployeeRepository;
import com.anand.entity.EmployeeEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Optional;

@Component
public class EmployeeDbOperation {

    @Autowired
    EmployeeRepository repo;
    public EmployeeEntity addNewEmployee(EmployeeEntity entity)
    {
      EmployeeEntity response= repo.save(entity);
        return response;
    }
    public List<EmployeeEntity> viewAllEmployeeDetails()
    {
        List<EmployeeEntity> response=repo.findAll();
        return response;
    }
    public Optional<EmployeeEntity> findByEmployeeId(int id)
    {
        Optional<EmployeeEntity> result=repo.findById(id);
        return result;
    }
    public String deleteEmployeeDetails(int id)
    {
        repo.deleteById(id);
        return "Employee delete SuccessFully";
    }
}
