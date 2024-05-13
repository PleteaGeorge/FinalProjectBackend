package com.example.cinema.controllers;

import com.example.cinema.dtos.*;
import com.example.cinema.services.MovieService;
import com.example.cinema.services.UserService;
import com.example.cinema.validators.InputValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/users")
@CrossOrigin("http://localhost:4200")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private MovieService movieService;
    @Autowired
    private InputValidator inputValidator;
    @PostMapping("/register")
    public ResponseEntity<AuthenticationResponse> registerUser(@RequestBody RegisterRequest registerRequest){
        if(!inputValidator.validateRegister(registerRequest)){
            return ResponseEntity.badRequest().build();
        }
        return ResponseEntity.ok(userService.register(registerRequest));
    }
    @PostMapping("/login")
    public ResponseEntity<AuthenticationResponse> loginUser(@RequestBody LoginRequest loginRequest){
        if(!inputValidator.validateLogin(loginRequest)){
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(userService.authenticate(loginRequest));
    }
    @DeleteMapping("/delete/{id}")
    public ResponseEntity<String> deleteUserById(@PathVariable Long id){
        if(userService.getUserById(id).isEmpty()){
            return ResponseEntity.notFound().build();
        }
        userService.deleteById(id);
        return ResponseEntity.ok("User with id " + id + " deleted");
    }
    @GetMapping("/get")
    public ResponseEntity<UserDto> getUserDto(Authentication authentication){
        UserDto userDto = userService.getUserDtoByEmail(authentication.getName());
        if (userDto == null){
            return ResponseEntity.noContent().build();
        }
        return ResponseEntity.ok(userDto);
    }
}
