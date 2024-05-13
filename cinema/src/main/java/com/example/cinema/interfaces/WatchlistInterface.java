package com.example.cinema.interfaces;

import com.example.cinema.dtos.MovieDto;
import com.example.cinema.entities.Watchlist;

import java.util.Set;

public interface WatchlistInterface {
    Set<MovieDto> getAllMoviesFromWatchlist(String email);
    boolean deleteMovieFromWatchlist(String userEmail, Long movieId);
    Watchlist addWatchlist(Long movieId, Long userId);
}
