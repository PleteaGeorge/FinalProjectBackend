import { Component } from '@angular/core';
import { NgForm } from '@angular/forms';
import { Router } from '@angular/router';
import { LocalStorageService } from 'src/app/services/local-storage.service';
import { UserService } from 'src/app/services/user.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent {

  constructor(private userService: UserService,
     private localStorageService: LocalStorageService,
     private router: Router){}

  onSubmit(form: NgForm) {
  this.userService.login(form).subscribe(
    (data) => {
      if (data && data.token) {
        this.localStorageService.clear();
        this.localStorageService.setItem('token', data.token);
        this.router.navigate(['/home']);
        form.resetForm();
      } else {
        alert('Bad Credentials');
        this.router.navigate(['/login']);
      }
    },
    (error) => {
      console.error('Login failed:', error);
      alert('Login failed. Please check your credentials.');
      form.resetForm();
    }
  );
}



}
