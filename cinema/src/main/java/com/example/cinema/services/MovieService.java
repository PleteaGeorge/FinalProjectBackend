package com.example.cinema.services;

import com.example.cinema.dtos.MovieDto;
import com.example.cinema.entities.*;
import com.example.cinema.interfaces.MovieInterface;
import com.example.cinema.repositories.MovieRepository;
import com.example.cinema.repositories.WatchlistRepository;
import com.example.cinema.utils.Utility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
public class MovieService implements MovieInterface {
    @Autowired
    private UserService userService;
    @Autowired
    private MovieRepository movieRepository;
    @Autowired
    private WatchlistRepository watchlistRepository;


    public List<MovieDto> getMovieDtoListByGenre(String genre){
        return movieRepository.findAllByGenresName(genre);
    }

    @Override
    public MovieDto getByTitle(String title) {
        Movie movie = movieRepository.findByTitle(title);
        if(movie == null){
            return null;
        }
        else {
            MovieDto movieDto = Utility.getMovieDtoMapped(movie);

            List<String> actorNames = new ArrayList<>();
            for (Actor actor : movie.getActors()) {
                actorNames.add(actor.getName());
            }
            movieDto.setActorList(actorNames);

            List<String> genreNames = new ArrayList<>();
            for(Genre genre : movie.getGenres()){
                genreNames.add(genre.getName());
            }
            movieDto.setGenreList(genreNames);
            return movieDto;
        }
    }

    @Override
    public Watchlist addWatchlist(Long movieId, Long userId) {
        Watchlist watchlist = new Watchlist();
        watchlist.setMovieId(movieId);
        watchlist.setUserId(userId);
        return watchlistRepository.save(watchlist);
    }
    @Override
    public Movie getById(Long movieId) {
        return movieRepository.findById(movieId).orElse(null);
    }

    @Override
    public List<MovieDto> getMovieDtoByRating() {
        List<MovieDto> movieDtos = movieRepository.findAllOrderByRatingDesc();
        if (movieDtos.isEmpty()) {
            return Collections.emptyList();
        }
        movieDtos.forEach(movieDto -> System.out.println(movieDto.getRating()));
        return movieDtos;
    }

    public Movie getMovieByTitle(String title) {
        return movieRepository.findByTitle(title);
    }
}
