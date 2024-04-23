package com.example.cinema.repositories;

import com.example.cinema.dtos.MovieDto;
import com.example.cinema.entities.Movie;
import com.example.cinema.entities.Watchlist;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Set;

@Repository
public interface WatchlistRepository extends JpaRepository<Watchlist, Long>  {
    Set<Watchlist> findAllByUserId(Long id);
    void deleteAllByUserIdAndMovieId(Long  userId, Long movieId);

    boolean existsByUserIdAndMovieId(Long userId, Long movieId);
}
