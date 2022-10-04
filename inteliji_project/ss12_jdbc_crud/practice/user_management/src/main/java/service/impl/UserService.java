package service.impl;

import dao.Repository;
import model.User;
import service.IUserService;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService {
Repository repository = new Repository();
    @Override
    public void insertUser(User user) throws SQLException {
        repository.insertUser(user);
    }

    @Override
    public User selectUserById(int id) {
        return repository.selectUserById(id);
    }

    @Override
    public List<User> selectUserByCountry(String country) {
        return repository.selectUserByCountry(country);
    }

    @Override
    public List<User> selectAllUsers() {
        return repository.selectAllUsers();
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return repository.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return repository.updateUser(user);
    }
}
