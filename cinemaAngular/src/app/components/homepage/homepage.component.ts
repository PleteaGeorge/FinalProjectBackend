import { Component, Injectable, OnInit } from '@angular/core';
import { Movie } from 'src/app/interfaces/movie';
import { MovieService } from 'src/app/services/movie.service';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root'
})
@Component({
  selector: 'app-homepage',
  templateUrl: './homepage.component.html',
  styleUrls: ['./homepage.component.css']
})
export class HomepageComponent implements OnInit{
  imageUrl= "/assets/images/movies_main.avif"
  
  constructor(public movieService: MovieService, private router: Router){}
  ngOnInit(): void {
    this.getMoviesByRating();
  }

  getMoviesByGenre(genre:string){
    this.movieService.getMoviesByGenre(genre).subscribe((response) =>{
      this.movieService.movies = response;
    })
  }
  addToWatchList(event: Event, movie: Movie) {
    event.preventDefault();
    this.movieService.watchlistService.addToWatchlist(movie).subscribe(
      (data) => {
        if (!data) {
          alert('Please login to add movies to watchlist');
          this.router.navigate(['/login']);
        } else {
          console.log('Movie added to watchlist:', data);
        }
      },
      (error) => {
        alert('Please login to add movies to watchlist');
        console.error('Error adding movie to watchlist:', error);
        this.router.navigate(['/login']);
      }
    );
  }
  getMoviesByRating(){
    this.movieService.getMoviesByRating().subscribe((data) => 
    this.movieService.movies = data);
  }
}
