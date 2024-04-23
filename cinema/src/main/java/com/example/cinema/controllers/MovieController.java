package com.example.cinema.controllers;

import com.example.cinema.dtos.MovieDto;
import com.example.cinema.entities.Watchlist;
import com.example.cinema.services.GenreService;
import com.example.cinema.services.MovieService;
import com.example.cinema.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/movies")
@CrossOrigin("http://localhost:4200")
public class MovieController {
    @Autowired
    private MovieService movieService;
    @Autowired
    private GenreService genreService;

    @Autowired
    private UserService userService;

    @GetMapping("/categories")
    public ResponseEntity<List<MovieDto>> getMoviesByGenre(@RequestParam(name = "genre") String genreName){
        if(!genreService.existsByName(genreName)){
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(movieService.getMovieDtoListByGenre(genreName));
    }
    @GetMapping("/title/{movieTitle}")
    public ResponseEntity<MovieDto> getMovieByName(@PathVariable String movieTitle){
        if(movieService.getByTitle(movieTitle) == null){
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(movieService.getByTitle(movieTitle));
    }
    @PostMapping("/watchlist")
    public ResponseEntity<Watchlist> addMovieToWatchlist(@RequestBody MovieDto movieDto, Authentication authentication) {
        Long userId = userService.findByEmail(authentication.getName()).getId();
        return ResponseEntity.ok(movieService.addWatchlist(movieDto.getId(), userId));
    }
    @GetMapping("/rating")
    public ResponseEntity<List<MovieDto>> getMovieDtosByRating(){
        List<MovieDto> movieDtos = movieService.getMovieDtoByRating();
        if(movieDtos.isEmpty()){
            return ResponseEntity.internalServerError().build();
        }
        return ResponseEntity.ok(movieDtos);
    }
}
