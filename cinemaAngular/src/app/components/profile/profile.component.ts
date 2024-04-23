import { Component, OnInit } from '@angular/core';
import { Movie } from 'src/app/interfaces/movie';
import { User } from 'src/app/interfaces/user';
import { UserService } from 'src/app/services/user.service';
import { WatchlistService } from 'src/app/services/watchlist.service';

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.css']
})
export class ProfileComponent implements OnInit {
  user!: User;
  movies: Movie[] = [];
  isLoading: boolean = false;
  error: string | null = null;

  constructor(private watchlistService: WatchlistService, private userService: UserService) {}

  ngOnInit(): void {
    this.getUser();
    this.getWatchlistMovies();
  }

  getWatchlistMovies() {
    this.isLoading = true;
    this.watchlistService.getWatchlist().subscribe({
      next: (response) => {
        this.movies = response;
        this.isLoading = false;
      },
      error: (err) => {
        this.error = "Failed to load movies. Please try again later.";
        this.isLoading = false;
        console.error('Error fetching watchlist:', err);
      }
    });
  }
  getUser() {
    this.userService.getUser().subscribe({
      next: (response) => {
        this.user = response;
        console.log(this.user);
        
      },
      error: (err) => {
        console.error('Error fetching user:', err);
      }
    });
  }
  logout() {
    this.userService.logout();
  }

  removeFromWatchlist(movie: Movie) {
    this.watchlistService.removeFromWatchlist(movie).subscribe((response) => {
      if (!response) {
        alert('Failed to remove movie from watchlist');
      } else {
        console.log('Movie removed from watchlist:', response.status);
        this.getWatchlistMovies();
      }
    })
  }
}
