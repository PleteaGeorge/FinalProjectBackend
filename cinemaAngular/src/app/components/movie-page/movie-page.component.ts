import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Movie } from 'src/app/interfaces/movie';
import { MovieService } from 'src/app/services/movie.service';
import { DomSanitizer } from '@angular/platform-browser';
import { Router } from '@angular/router';

@Component({
  selector: 'app-movie-page',
  templateUrl: './movie-page.component.html',
  styleUrls: ['./movie-page.component.css']
})
export class MoviePageComponent {
  touched = false;
  movie!:Movie;
  title:string = "";
  safeUrl:any;
  constructor(private movieService: MovieService, private route: ActivatedRoute
    , private sanitizer: DomSanitizer, private router: Router){}

  ngOnInit(): void {
    this.route.queryParamMap
    .subscribe(res => { 
        this.title = (res as any).params.title;
        if (this.title) {
          this.movieService.getMovieByTitle(this.title).subscribe((response) =>{
            console.log(response);
            this.movie=response;
            console.log(this.movie.trailerUrl);
            this.safeUrl = this.sanitizer.bypassSecurityTrustResourceUrl(this.movie.trailerUrl);            
          }) 
        }
    });
  }
  addToWatchList(movie: Movie) {
    this.touched= true;
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
}
