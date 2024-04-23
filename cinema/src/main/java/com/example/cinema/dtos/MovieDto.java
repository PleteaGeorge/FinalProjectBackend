package com.example.cinema.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MovieDto {
    private Long id;
    private String title;
    private Double rating;
    private LocalDate releaseDate;
    private String imageUrl;
    private String description;
    private List<String> genreList;
    private List<String> actorList;
    private String trailerUrl;

    public MovieDto(Long id, String title, Double rating, LocalDate releaseDate, String imageUrl, String description) {
        this.title = title;
        this.rating = rating;
        this.releaseDate = releaseDate;
        this.imageUrl = imageUrl;
        this.description = description;
        this.id = id;
    }
}