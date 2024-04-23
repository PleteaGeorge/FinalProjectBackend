package com.example.cinema.utils;

import com.example.cinema.dtos.MovieDto;
import com.example.cinema.dtos.UserDto;
import com.example.cinema.entities.Movie;
import com.example.cinema.entities.User;

public class Utility {
    public static MovieDto getMovieDtoMapped(Movie movie) {
        MovieDto movieDto = new MovieDto();
        movieDto.setId(movie.getId());
        movieDto.setDescription(movie.getDescription());
        movieDto.setTitle(movie.getTitle());
        movieDto.setRating(movie.getRating());
        movieDto.setImageUrl(movie.getImageUrl());
        movieDto.setReleaseDate(movie.getReleaseDate());
        movieDto.setTrailerUrl(movie.getTrailerUrl());
        return movieDto;
    }

    public static UserDto getUserDtoMapped(User user) {
        UserDto userDto = new UserDto();
        userDto.setName(user.getName());
        userDto.setEmail(user.getEmail());
        return userDto;
    }
}
