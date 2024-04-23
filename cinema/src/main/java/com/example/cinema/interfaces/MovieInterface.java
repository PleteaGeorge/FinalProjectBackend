package com.example.cinema.interfaces;

import com.example.cinema.dtos.MovieDto;
import com.example.cinema.entities.Movie;
import com.example.cinema.entities.Watchlist;
import java.util.List;

public interface MovieInterface {

    List<MovieDto> getMovieDtoListByGenre(String genre);
    MovieDto getByTitle(String title);
    Watchlist addWatchlist(Long movieId, Long userId);

    Movie getById(Long movieId);

    List<MovieDto> getMovieDtoByRating();

}
