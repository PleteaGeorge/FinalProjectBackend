package com.example.cinema.entities;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
public class Watchlist {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Long userId;
    private Long movieId;
}
