package repository.employee.impl;

import model.employee.Employee;
import model.employee.EmployeeDto;
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
    public static final String SELECT_ALL_EMPLOYEE_DTO = "select employee.*, position.name as position_name, education_degree.name as education_degree_name, division.name as division_name from employee\n" +
            "join position on employee.position_id = position.id\n" +
            "join education_degree on employee.education_degree_id = education_degree.id\n" +
            "join division on employee.division_id = division.id where employee.is_delete =0 order by employee.id";
    private static final String INSERT_EMPLOYEE = "INSERT INTO `employee` (`name`, `date_of_birth`, `id_card`, `salary`, `phone_number`, `email`, `address`, `position_id`, `education_degree_id`, `division_id`)" +
            "VALUES (?, ?, ?, ?,?, ?, ?, ?, ?, ?);";
    private static final String EDIT_EMPLOYEE = "UPDATE `employee` set `name` = ?, `date_of_birth` = ?, `id_card`= ?, `salary`= ?, `phone_number`= ?, `email`= ?, `address`= ?, `position_id`= ?, `education_degree_id`= ?, `division_id`= ?" +
            " where id=? and is_delete = 0";
    public static final String FIND_EMPLOYEE_BY_ID = "select * from employee where id=? and is_delete=0;";
    public static final String DELETE_EMPLOYEE = "UPDATE `employee` set `is_delete`=1 where id=?";
    private static final String SEARCH = "select employee.*, position.name as position_name, education_degree.name as education_degree_name, division.name as division_name from employee\n" +
            "join position on employee.position_id = position.id\n" +
            "join education_degree on employee.education_degree_id = education_degree.id\n" +
            "join division on employee.division_id = division.id where employee.name like ? and employee.date_of_birth like? and employee.position_id like ? and employee.is_delete =0 order by employee.id";


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
    public List<EmployeeDto> findAllDto() {
        List<EmployeeDto> employeeDtoList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_EMPLOYEE_DTO);
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
                String position = rs.getString("position_name");
                String educationDegree = rs.getString("education_degree_name");
                String division = rs.getString("division_name");
                String username = rs.getString("username");
                employeeDtoList.add(new EmployeeDto(id, name, dateOfBirth, idCard, salary, phoneNumber, email, address, position, educationDegree, division, username));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employeeDtoList;
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

    @Override
    public List<EmployeeDto> searchEmployee(String searchName, String searchDateOfBirth, String searchPositionId) {
        List<EmployeeDto> employees = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH);
            preparedStatement.setString(1,"%"+searchName+"%");
            preparedStatement.setString(2,"%"+searchDateOfBirth+"%");
            preparedStatement.setString(3,"%"+searchPositionId+"%");
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()){
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String dateOfBirth = rs.getString("date_of_birth");
                String idCard = rs.getString("id_card");
                Double salary = Double.valueOf(rs.getString("salary"));
                String phoneNumber = rs.getString("phone_number");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String position = rs.getString("position_name");
                String educationDegree = rs.getString("education_degree_name");
                String division = rs.getString("division_name");
                String username = rs.getString("username");
                employees.add(new EmployeeDto(id, name, dateOfBirth, idCard, salary, phoneNumber, email, address, position, educationDegree, division, username));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return employees;
    }
}
