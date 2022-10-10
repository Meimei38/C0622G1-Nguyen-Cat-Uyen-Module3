package service.employee.impl;


import model.employee.Employee;
import model.employee.EmployeeDto;
import repository.employee.IEmployeeRepo;
import repository.employee.impl.EmployeeRepo;
import service.employee.IEmployeeService;
import service.validation.Validation;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class EmployeeService implements IEmployeeService {
    private IEmployeeRepo employeeRepo = new EmployeeRepo();


    @Override
    public Map<String, String> addEmployee(Employee employee) throws SQLException {
        Map<String, String> errorMap = new HashMap<>();
        if (!Validation.checkEmail(employee.getEmail())) {
            errorMap.put("email", "Email không đúng định dạng");
        }
        if (!Validation.checkName(employee.getName())) {
            errorMap.put("name", "Tên không đúng định dạng");
        }


        if (!Validation.checkPhone(employee.getPhoneNumber())) {
            errorMap.put("phoneNumber", "Số điện thoại không đúng định dạng (XX)-(0XXXXXXXXX)");
        }


        int age = LocalDate.now().getYear() - LocalDate.parse(employee.getDateOfBirth()).getYear();
        if (age < 18 || age > 100) {
            errorMap.put("dateOfBirth", "Ngày sinh không hợp lệ (age>18 && age<100)");
        }

        if (errorMap.size() == 0) {
            employeeRepo.addEmployee(employee);
        }

        return errorMap;

    }

    @Override
    public List<Employee> searchEmployee(String searchName, String searchDateOfBirth, String searchPositionId) throws SQLException {

        return employeeRepo.searchEmployee(searchName, searchDateOfBirth, searchPositionId);
    }

    @Override
    public List<Employee> findAll() {
        return employeeRepo.findAll();
    }


    @Override
    public boolean deleteEmployee(int id) throws SQLException {
        return employeeRepo.deleteEmployee(id);
    }

    @Override
    public Map<String, String> editEmployee(Employee employee) throws SQLException {
        Map<String, String> errorMap = new HashMap<>();
        if (!Validation.checkEmail(employee.getEmail())) {
            errorMap.put("email", "Email không đúng định dạng");
        }
        if (!Validation.checkName(employee.getName())) {
            errorMap.put("name", "Tên không đúng định dạng");
        }


        if (!Validation.checkPhone(employee.getPhoneNumber())) {
            errorMap.put("phoneNumber","Số điện thoại phải đúng định dạng 090xxxxxxx hoặc 091xxxxxxx hoặc (84)+90xxxxxxx hoặc (84)+91xxxxxxx.");
        }


        int age = LocalDate.now().getYear() - LocalDate.parse(employee.getDateOfBirth()).getYear();
        if (age < 18 || age > 100) {
            errorMap.put("dateOfBirth", "Ngày sinh không hợp lệ (age>18 && age<100)");
        }

        if (errorMap.size() == 0) {
            boolean check = employeeRepo.editEmployee(employee);
        }

        return errorMap;
    }

    @Override
    public Employee findById(int id) {
        return employeeRepo.findById(id);
    }

    @Override
    public Map<Integer, String> selectAllPosition() {
        return employeeRepo.selectAllPosition();
    }

    @Override
    public Map<Integer, String> selectAllEducationDegree() {
        return employeeRepo.selectAllEducationDegree();
    }

    @Override
    public Map<Integer, String> selectAllDivision() {
        return employeeRepo.selectAllDivision();
    }
}
