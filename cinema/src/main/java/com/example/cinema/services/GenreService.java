package com.example.cinema.services;

import com.example.cinema.interfaces.GenreInterface;
import com.example.cinema.repositories.GenreRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GenreService implements GenreInterface {
    @Autowired
    private GenreRepository genreRepository;


    @Override
    public boolean existsByName(String genreName) {
        return genreRepository.existsByName(genreName);
    }
}
