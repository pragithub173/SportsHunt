import { Component, OnInit, AfterViewInit, ElementRef } from '@angular/core';
import { AuthService } from './shared/services/auth.service';
import { JwtHelperService } from "@auth0/angular-jwt";

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit, AfterViewInit {
  title = 'SportsHunt';
  helper = new JwtHelperService();

  constructor(private authService: AuthService,
    private elementRef: ElementRef){}

  ngOnInit(){
    //const token = localStorage.getItem('token');
    //this.authService.decodedToken = this.helper.decodeToken(token);

    this.authService.loggedInUserName = localStorage.getItem('loggedInUserFirstName') + " " + localStorage.getItem('loggedInUserLastName');
  }

  ngAfterViewInit(): void {
    // this.elementRef.nativeElement.ownerDocument.body.style.backgroundColor = '#ccc';
  }
}
