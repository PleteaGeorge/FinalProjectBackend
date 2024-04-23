import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Movie } from '../interfaces/movie';
import { Observable } from 'rxjs';
import { LocalStorageService } from './local-storage.service';
@Injectable({
  providedIn: 'root'
})
export class WatchlistService {

  constructor(private http: HttpClient, private localStorageService: LocalStorageService) { }
  myUrl = 'http://localhost:8081/api/watchlist';

  getWatchlist(): Observable<Movie[]> {
    const httpHeaders = new HttpHeaders({
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Access-Control-Allow-Origin': '*',
      'Authorization': 'Bearer ' + this.localStorageService.getItem('token')
    });
    return this.http.get<Movie[]>(this.myUrl, { headers: httpHeaders });
  }
  removeFromWatchlist(movie: Movie) : Observable<any> {
    const httpHeaders = new HttpHeaders({
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Access-Control-Allow-Origin': '*',
      'Authorization': 'Bearer ' + this.localStorageService.getItem('token')
    });
    return this.http.delete(this.myUrl + "/remove/" + movie.id, { headers: httpHeaders });
  }
}
