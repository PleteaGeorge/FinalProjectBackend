import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { NgForm } from '@angular/forms';
import { Router } from '@angular/router';
import { Observable } from 'rxjs';
import { AuthenticationResponse } from '../interfaces/authentication-response';
import { User } from '../interfaces/user';
import { LocalStorageService } from './local-storage.service';

@Injectable({
  providedIn: 'root'
})
export class UserService {
  myUrl = 'http://localhost:8081/api/users';

  constructor(private http: HttpClient, private localStorageService: LocalStorageService, 
    private router: Router) { }
  register(form: NgForm, userRole: string) : Observable<AuthenticationResponse> {
    const user:User = {
      name: form.value.name,
      email: form.value.email,
      password: form.value.password,
      role: userRole
    };
    console.log(user);
    return this.http.post<AuthenticationResponse>(this.myUrl+'/register', user);
  }

  login(form: NgForm): Observable<AuthenticationResponse> {
    const email:string = form.value.email;
    const password:string = form.value.password;
    return this.http.post<AuthenticationResponse>(this.myUrl+'/login', {email :email, password:password});
  }
  getUser(): Observable<User> {
    const httpHeaders = new HttpHeaders({
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Access-Control-Allow-Origin': '*',
      'Authorization': 'Bearer ' + this.localStorageService.getItem('token')
    });
    return this.http.get<User>(this.myUrl+"/get", { headers: httpHeaders });
  }
  logout() {
    this.localStorageService.clear();
    this.router.navigate(['/login']);
  }
}
