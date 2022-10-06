package repository.employee;

import model.employee.Employee;

import java.sql.SQLException;
import java.util.List;

public interface IEmployeeRepo {
    public void addEmployee(Employee employee) throws SQLException;

    public List<Employee> findAll();
    public Employee findById(int id);

    public boolean deleteEmployee(int id) throws SQLException;

    public boolean editEmployee(Employee employee) throws SQLException;

}
