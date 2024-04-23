import {Component} from '@angular/core';
import {MatIconModule} from '@angular/material/icon';
import {MatButtonModule} from '@angular/material/button';
import {MatToolbarModule} from '@angular/material/toolbar';
import {MatMenuModule} from '@angular/material/menu';
import { MovieService } from 'src/app/services/movie.service';

/**
 * @title Basic toolbar
 */
@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css'],
  standalone: true,
  imports: [MatToolbarModule, MatButtonModule, MatIconModule, MatButtonModule, MatMenuModule],
  
})
export class HeaderComponent {
  constructor(public movieService:MovieService){}

  getMoviesByGenre(genre:string){
    this.movieService.getMoviesByGenre(genre).subscribe((response) =>{
      this.movieService.movies = response;
    })
  }
}
