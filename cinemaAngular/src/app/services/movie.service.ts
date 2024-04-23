import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { __values } from 'tslib';
import { Movie } from '../interfaces/movie';
import { LocalStorageService } from './local-storage.service';

@Injectable({
  providedIn: 'root'
})
export class MovieService {

  myUrlForCategories="http://localhost:8081/api/movies/categories";
  myUrlForTitle="http://localhost:8081/api/movies/title/";
  myUrlForPostWatchlist="http://localhost:8081/api/movies/watchlist";
  myUrlForMovieRating = "http://localhost:8081/api/movies/rating";
  
  movies:Movie[] = [];
  constructor(private http: HttpClient, private localStorageService: LocalStorageService) { }
  
  getMoviesByGenre(genre: string): Observable<Movie[]> {
    return this.http.get<Movie[]>(`${this.myUrlForCategories}?genre=${genre}`);
  }
  getMovieByTitle(title: string): Observable<Movie> {
    return this.http.get<Movie>(this.myUrlForTitle + title);
  }

  addToWatchlist(movie: Movie) : Observable<any> {
    const httpHeaders = new HttpHeaders({
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Access-Control-Allow-Origin': '*',
      'Authorization': 'Bearer ' + this.localStorageService.getItem('token')
    });
    return this.http.post(this.myUrlForPostWatchlist, movie, { headers: httpHeaders });
  }
  getMoviesByRating(): Observable<Movie[]>{
    return this.http.get<Movie[]>(this.myUrlForMovieRating);
  }
}
