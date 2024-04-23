package com.example.cinema.interfaces;

import com.example.cinema.dtos.AuthenticationResponse;
import com.example.cinema.dtos.LoginRequest;
import com.example.cinema.dtos.RegisterRequest;
import com.example.cinema.dtos.UserDto;
import com.example.cinema.entities.User;

import java.util.List;
import java.util.Optional;

public interface UserInterface {
    User findByEmail(String email);
    Optional<User> getUserById(Long id);
    List<User> getAllUsers();
    void deleteById(Long id);

    AuthenticationResponse register(RegisterRequest request);

    AuthenticationResponse authenticate(LoginRequest request);

    UserDto getUserDtoByEmail(String name);
}
