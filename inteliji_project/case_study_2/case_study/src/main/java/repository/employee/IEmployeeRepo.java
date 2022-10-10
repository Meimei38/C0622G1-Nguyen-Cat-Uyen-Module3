package repository.employee;

import model.employee.Employee;
import model.employee.EmployeeDto;

import java.sql.SQLException;
import java.util.List;

public interface IEmployeeRepo {
    void addEmployee(Employee employee) throws SQLException;

    List<Employee> findAll();
    List<EmployeeDto> findAllDto();
    Employee findById(int id);

    boolean deleteEmployee(int id) throws SQLException;

    boolean editEmployee(Employee employee) throws SQLException;

    List<EmployeeDto> searchEmployee(String searchName, String searchDateOfBirth, String searchPositionId);
}
