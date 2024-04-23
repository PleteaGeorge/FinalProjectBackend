import { Component } from '@angular/core';
import { NgForm } from '@angular/forms';
import { Router } from '@angular/router';
import { User } from 'src/app/interfaces/user';
import { LocalStorageService } from 'src/app/services/local-storage.service';
import { UserService } from 'src/app/services/user.service';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent {
  form: any;
  selectedRole:any;
  constructor(private userService: UserService, private localStorageService: LocalStorageService,
    private router: Router){ } 

  onSubmit(form: NgForm) {
    this.userService.register(form, this.selectedRole).subscribe((data) => {
      this.localStorageService.clear();
      this.localStorageService.setItem('token', data.token);
      console.log(this.localStorageService.getItem('token'));
      alert('Registration successful');
      this.router.navigate(['/home']);
    },
    (error) => {
      console.error('Registration failed:', error);
      alert('Registration failed. Email already exists or bad credentials.');
      form.resetForm();
    });
  }
}
