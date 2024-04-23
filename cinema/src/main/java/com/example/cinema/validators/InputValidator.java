package com.example.cinema.validators;

import com.example.cinema.dtos.LoginRequest;
import com.example.cinema.dtos.RegisterRequest;
import com.example.cinema.dtos.UserDto;
import com.example.cinema.entities.User;
import com.example.cinema.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
@Component
public class InputValidator {
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private UserService userService;
    private static final String nameRegex ="([a-zA-Z_0-9\\s]+)";
    private static final String emailRegex ="^[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,4}$";
    public boolean validateRegister(RegisterRequest registerRequest){
        if(userService.findByEmail(registerRequest.getEmail()) != null)
            return false;
        if(!registerRequest.getEmail().matches(emailRegex)){
            System.out.println("invalid email");
            return false;
        }
        if((registerRequest.getPassword().length()<5)){
            System.out.println("invalid password");
            return false;
        }
        if(registerRequest.getRole() == null){
            System.out.println("invalid role");
            return false;
        }
        if(!registerRequest.getName().matches(nameRegex)){
            System.out.println("invalid name");
            return false;
        }
        return true;
    }
    public boolean validateLogin(LoginRequest loginRequest){
        User user = userService.findByEmail(loginRequest.getEmail());
        if(user == null)
            return false;
        return passwordEncoder.matches(loginRequest.getPassword(), user.getPassword());
    }
}
