package service.employee;

import model.employee.Employee;
import model.employee.EmployeeDto;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.List;

public interface IEmployeeService {
    public void addEmployee(Employee employee) throws SQLException;
    
    public List<Employee> findAll();

    public List<EmployeeDto> findAllDto();

    public boolean deleteEmployee(int id) throws SQLException;

    public boolean editEmployee(Employee employee) throws SQLException;
    public Employee findById(int id);

}
