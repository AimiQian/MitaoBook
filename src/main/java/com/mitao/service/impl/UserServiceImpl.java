package com.mitao.service.impl;

import com.mitao.dao.UserDao;
import com.mitao.dao.impl.UserDaoImpl;
import com.mitao.pojo.User;
import com.mitao.service.UserService;

public class UserServiceImpl implements UserService {

    private UserDao userDao = new UserDaoImpl();

    @Override
    public void registerUser(User user) {
        userDao.saveUser(user);
    }

    @Override
    public User login(User user) {
        return userDao.queryUserByUsernameAndPassword(user.getUsername(),user.getPassword());
    }

    @Override
    public boolean exitsUsername(String username) {
        if(userDao.queryUserByUsername(username) == null){
            return false;
        }
        return true;
    }
}
