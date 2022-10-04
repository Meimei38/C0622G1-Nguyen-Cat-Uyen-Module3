package dao;

import model.User;

import java.sql.SQLException;
import java.util.List;

public interface IRepository {
    public void insertUser(User user) throws SQLException;

    public User selectUserById(int id);
    public  List<User> selectUserByCountry(String country);

    public List<User> selectAllUsers();

    public boolean deleteUser(int id) throws SQLException;

    public boolean updateUser(User user) throws SQLException;
    public List<User> display();
    public boolean edit(User user);
    public boolean delete(int id);
}
