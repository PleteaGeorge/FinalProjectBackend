package com.example.cinema.services;

import com.example.cinema.dtos.MovieDto;
import com.example.cinema.entities.Movie;
import com.example.cinema.entities.User;
import com.example.cinema.entities.Watchlist;
import com.example.cinema.interfaces.WatchlistInterface;
import com.example.cinema.repositories.WatchlistRepository;
import com.example.cinema.utils.Utility;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import java.util.HashSet;
import java.util.Set;

@Service
@RequiredArgsConstructor
public class WatchlistService implements WatchlistInterface {

    private final WatchlistRepository watchlistRepository;
    private final UserService userService;
    private final MovieService movieService;

    @Override
    public Watchlist addWatchlist(Long movieId, Long userId) {
        Watchlist watchlist = new Watchlist();
        watchlist.setMovieId(movieId);
        watchlist.setUserId(userId);
        return watchlistRepository.save(watchlist);
    }
    @Override
    public boolean deleteMovieFromWatchlist(String userEmail, Long movieId){
        Long userId = userService.findByEmail(userEmail).getId();
        if(watchlistRepository.existsByUserIdAndMovieId(userId, movieId)){
            watchlistRepository.deleteAllByUserIdAndMovieId(userId, movieId);
            return true;
        }
        return false;
    }
    @Override
    public Set<MovieDto> getAllMoviesFromWatchlist(String email) {
        User user = userService.findByEmail(email);
        if(user != null) {
            Set<Watchlist> watchlist = watchlistRepository
                    .findAllByUserId(user.getId());
            Set<MovieDto> movieDtoSet =  new HashSet<>();
            for(Watchlist entry: watchlist){
                Movie movie = movieService.getById(entry.getMovieId());
                if (movie == null){
                    throw new RuntimeException("Movie not found");
                }
                MovieDto movieDto = Utility.getMovieDtoMapped(movie);
                movieDtoSet.add(movieDto);
            }
            return movieDtoSet;

        }
        throw new RuntimeException("Can not found user");
    }

}
