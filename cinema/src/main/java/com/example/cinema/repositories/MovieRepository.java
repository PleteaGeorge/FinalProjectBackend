package com.example.cinema.repositories;

import com.example.cinema.dtos.MovieDto;
import com.example.cinema.entities.Movie;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Set;

@Repository
public interface MovieRepository extends JpaRepository<Movie, Long> {
    @Query("SELECT new  com.example.cinema.dtos.MovieDto" +
            "(m.id, m.title, m.rating, m.releaseDate, m.imageUrl, m.description)" +
            " FROM Movie m JOIN m.genres g WHERE g.name = :genre")
    List<MovieDto> findAllByGenresName(@Param("genre") String genre);
    Movie findByTitle(String title);
    @Query("SELECT new com.example.cinema.dtos.MovieDto" +
            "(m.id, m.title, m.rating, m.releaseDate, m.imageUrl, m.description)" +
            " FROM Movie m ORDER BY m.rating DESC")
    List<MovieDto> findAllOrderByRatingDesc();
}