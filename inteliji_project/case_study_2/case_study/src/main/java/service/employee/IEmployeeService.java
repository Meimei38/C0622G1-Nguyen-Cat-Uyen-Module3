package service.employee;

import model.employee.Employee;
import model.employee.EmployeeDto;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;

public interface IEmployeeService {
    void addEmployee(Employee employee) throws SQLException;
    
    List<Employee> findAll();

    List<EmployeeDto> findAllDto();

    boolean deleteEmployee(int id) throws SQLException;

    boolean editEmployee(Employee employee) throws SQLException;
    Employee findById(int id);

}
