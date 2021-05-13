package com.mitao.service;

import com.mitao.pojo.User;

public interface UserService {
    public void registerUser(User user);

    public User login(User user);

    public boolean exitsUsername(String username);
}
