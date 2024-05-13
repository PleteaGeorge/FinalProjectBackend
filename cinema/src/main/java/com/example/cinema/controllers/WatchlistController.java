package com.example.cinema.controllers;

import com.example.cinema.dtos.MovieDto;
import com.example.cinema.entities.Watchlist;
import com.example.cinema.services.UserService;
import com.example.cinema.services.WatchlistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.Set;

@RestController
@RequestMapping("/api/watchlist")
@CrossOrigin("http://localhost:4200")
public class WatchlistController {
    @Autowired
    private UserService userService;
    @Autowired
    private WatchlistService watchlistService;
    @GetMapping
    public ResponseEntity<Set<MovieDto>> getWatchlistMovies(Authentication authentication){
        Set<MovieDto> movieDtoSet = watchlistService.getAllMoviesFromWatchlist(authentication.getName());
        if(movieDtoSet.isEmpty()){
            return ResponseEntity.ok(null);
        }
        return  ResponseEntity.ok(movieDtoSet);
    }
    @Transactional
    @DeleteMapping("/remove/{movieId}")
    public ResponseEntity<String> deleteMovieFromWatchlist(@PathVariable Long movieId, Authentication authentication){
        String userEmail = authentication.getName();
        if(watchlistService.deleteMovieFromWatchlist(userEmail, movieId)) {
            return ResponseEntity.ok("{\"status\": \"removed\"}");
        }
        else {
            return ResponseEntity.badRequest().build();
        }
    }
    @PostMapping("/add")
    public ResponseEntity<Watchlist> addMovieToWatchlist(@RequestBody MovieDto movieDto, Authentication authentication) {
        Long userId = userService.findByEmail(authentication.getName()).getId();
        return ResponseEntity.ok(watchlistService.addWatchlist(movieDto.getId(), userId));
    }
}
