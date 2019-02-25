package com.oferr.ppcdb.service;

import org.springframework.stereotype.Component;

import com.oferr.ppcdb.domain.User;

@Component
public interface UserService {
    void save(User user);

    User findByUsername(String username);
}
