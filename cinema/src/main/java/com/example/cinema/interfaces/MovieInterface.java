package com.example.cinema.interfaces;

import com.example.cinema.dtos.MovieDto;
import com.example.cinema.entities.Movie;
import java.util.List;

public interface MovieInterface {

    List<MovieDto> getMovieDtoListByGenre(String genre);
    MovieDto getByTitle(String title);
    Movie getById(Long movieId);

    List<MovieDto> getMovieDtoByRating();
}
