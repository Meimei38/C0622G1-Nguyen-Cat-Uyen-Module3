package service.employee.impl;


import model.employee.Employee;
import repository.employee.IEmployeeRepo;
import repository.employee.impl.EmployeeRepo;
import service.employee.IEmployeeService;

import java.sql.SQLException;
import java.util.List;

public class EmployeeService implements IEmployeeService {
    IEmployeeRepo employeeRepo = new EmployeeRepo();


    @Override
    public void addEmployee(Employee employee) throws SQLException {
        employeeRepo.addEmployee(employee);

    }

    @Override
    public List<Employee> findAll() {
        return employeeRepo.findAll();
    }

    @Override
    public boolean deleteEmployee(int id) throws SQLException {
        return false;
    }

    @Override
    public boolean editEmployee(Employee employee) throws SQLException {
        return employeeRepo.editEmployee(employee);
    }

    @Override
    public Employee findById(int id) {
        return employeeRepo.findById(id);
    }
}
