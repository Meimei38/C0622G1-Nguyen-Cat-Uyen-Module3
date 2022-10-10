package repository.employee;

import model.employee.Employee;
import model.employee.EmployeeDto;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface IEmployeeRepo {
    void addEmployee(Employee employee) throws SQLException;

    List<Employee> findAll();

    Employee findById(int id);

    boolean deleteEmployee(int id) throws SQLException;

    boolean editEmployee(Employee employee) throws SQLException;

    List<Employee> searchEmployee(String searchName, String searchDateOfBirth, String searchPositionId);
    Map<Integer, String> selectAllPosition();
    Map<Integer, String> selectAllEducationDegree();
    Map<Integer, String> selectAllDivision();

}
