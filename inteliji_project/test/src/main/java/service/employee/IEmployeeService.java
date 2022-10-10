package service.employee;

import model.employee.Employee;
import model.employee.EmployeeDto;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface IEmployeeService {
    void addEmployee(Employee employee) throws SQLException;
    List<Employee> searchEmployee(String searchName, String searchDateOfBirth,String searchPositionId) throws SQLException;

    List<Employee> findAll();


    boolean deleteEmployee(int id) throws SQLException;

    boolean editEmployee(Employee employee) throws SQLException;
    Employee findById(int id);
    Map<Integer, String> selectAllPosition();
    Map<Integer, String> selectAllEducationDegree();
    Map<Integer, String> selectAllDivision();

}
