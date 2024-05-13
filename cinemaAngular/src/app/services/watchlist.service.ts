import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Movie } from '../interfaces/movie';
import { Observable } from 'rxjs';
import { LocalStorageService } from './local-storage.service';
@Injectable({
  providedIn: 'root'
})
export class WatchlistService {

  constructor(private http: HttpClient, 
    private localStorageService: LocalStorageService) { }
  myUrl = 'http://localhost:8081/api/watchlist';
  myUrlForPostWatchlist="http://localhost:8081/api/watchlist/add";
  httpHeaders = new HttpHeaders({
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Access-Control-Allow-Origin': '*',
    'Authorization': 'Bearer ' + this.localStorageService.getItem('token')
  })
  getWatchlist(): Observable<Movie[]> {
    return this.http.get<Movie[]>(this.myUrl, { headers: this.httpHeaders });
  }
  removeFromWatchlist(movie: Movie) : Observable<any> {
    return this.http.delete(this.myUrl + "/remove/" + movie.id, { headers: this.httpHeaders });
  }
  addToWatchlist(movie: Movie) : Observable<any> {
    return this.http.post(this.myUrlForPostWatchlist, movie, { headers: this.httpHeaders });
  }
}
