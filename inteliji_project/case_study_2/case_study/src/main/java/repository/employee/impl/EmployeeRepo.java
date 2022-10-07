package repository.employee.impl;

import model.employee.Employee;
import repository.BaseRepository;
import repository.employee.IEmployeeRepo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepo implements IEmployeeRepo {

    public static final String SELECT_ALL_EMPLOYEE = "select * from employee where is_delete=0;";
    private static final String INSERT_EMPLOYEE = "INSERT INTO `employee` (`name`, `date_of_birth`, `id_card`, `salary`, `phone_number`, `email`, `address`, `position_id`, `education_degree_id`, `division_id`)" +
            "VALUES (?, ?, ?, ?,?, ?, ?, ?, ?, ?);";
    private static final String EDIT_EMPLOYEE = "UPDATE `employee` set `name` = ?, `date_of_birth` = ?, `id_card`= ?, `salary`= ?, `phone_number`= ?, `email`= ?, `address`= ?, `position_id`= ?, `education_degree_id`= ?, `division_id`= ?" +
            " where id=? and is_delete = 0";
    public static final String FIND_EMPLOYEE_BY_ID = "select * from employee where id=? and is_delete=0;";
    public static final String DELETE_EMPLOYEE = "UPDATE `employee` set `is_delete`=1 where id=?";


    @Override
    public void addEmployee(Employee employee) throws SQLException {
        Connection connection = BaseRepository.getConnectDB();
        PreparedStatement preparedStatement = connection.prepareStatement(INSERT_EMPLOYEE);
        preparedStatement.setString(1, employee.getName());
        preparedStatement.setString(2, employee.getDateOfBirth());
        preparedStatement.setString(3, employee.getIdCard());
        preparedStatement.setDouble(4, employee.getSalary());
        preparedStatement.setString(5, employee.getPhoneNumber());
        preparedStatement.setString(6, employee.getEmail());
        preparedStatement.setString(7, employee.getAddress());
        preparedStatement.setInt(8, employee.getPositionId());
        preparedStatement.setInt(9, employee.getEducationDegreeId());
        preparedStatement.setInt(10, employee.getDivisionId());
        System.out.println(preparedStatement);
        preparedStatement.executeUpdate();
    }

    @Override
    public List<Employee> findAll() {
        List<Employee> employees = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_EMPLOYEE);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String dateOfBirth = rs.getString("date_of_birth");
                String idCard = rs.getString("id_card");
                Double salary = Double.valueOf(rs.getString("salary"));
                String phoneNumber = rs.getString("phone_number");
                String email = rs.getString("email");
                String address = rs.getString("address");
                int positionId = Integer.parseInt(rs.getString("position_id"));
                int educationDegreeId = Integer.parseInt(rs.getString("education_degree_id"));
                int divisionId = Integer.parseInt(rs.getString("division_id"));
                String username = rs.getString("username");
                employees.add(new Employee(id, name, dateOfBirth, idCard, salary, phoneNumber, email, address, positionId, educationDegreeId, divisionId, username));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employees;
    }

    @Override
    public Employee findById(int id) {
        Employee employee = null;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_EMPLOYEE_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                String dateOfBirth = rs.getString("date_of_birth");
                String idCard = rs.getString("id_card");
                Double salary = Double.valueOf(rs.getString("salary"));
                String phoneNumber = rs.getString("phone_number");
                String email = rs.getString("email");
                String address = rs.getString("address");
                int positionId = Integer.parseInt(rs.getString("position_id"));
                int educationDegreeId = Integer.parseInt(rs.getString("education_degree_id"));
                int divisionId = Integer.parseInt(rs.getString("division_id"));
                String username = rs.getString("username");
                employee = new Employee(id, name, dateOfBirth, idCard, salary, phoneNumber, email, address, positionId, educationDegreeId, divisionId, username);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employee;
    }

    @Override
    public boolean deleteEmployee(int id) throws SQLException {
        boolean rowUpdated = false;
        Connection connection = BaseRepository.getConnectDB();
        PreparedStatement preparedStatement = connection.prepareStatement(DELETE_EMPLOYEE);
        preparedStatement.setInt(1, id);
        try {
           rowUpdated = preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return rowUpdated;
    }

    @Override
    public boolean editEmployee(Employee employee) throws SQLException {
        boolean rowUpdated = false;
        Connection connection = BaseRepository.getConnectDB();
        PreparedStatement preparedStatement = connection.prepareStatement(EDIT_EMPLOYEE);
        try {
            preparedStatement.setString(1, employee.getName());
            preparedStatement.setString(2, employee.getDateOfBirth());
            preparedStatement.setString(3, employee.getIdCard());
            preparedStatement.setDouble(4, employee.getSalary());
            preparedStatement.setString(5, employee.getPhoneNumber());
            preparedStatement.setString(6, employee.getEmail());
            preparedStatement.setString(7, employee.getAddress());
            preparedStatement.setInt(8, employee.getPositionId());
            preparedStatement.setInt(9, employee.getEducationDegreeId());
            preparedStatement.setInt(10, employee.getDivisionId());
            preparedStatement.setInt(11, employee.getId());

            rowUpdated = preparedStatement.executeUpdate() > 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return rowUpdated;
    }
}
