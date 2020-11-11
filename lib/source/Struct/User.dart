import 'package:flutter/material.dart';


class User {
   String lastName;
   String firstName;
   String email;

  void setFirstName(String a){
    this.firstName = a;
  }

  User(this.lastName, this.firstName, this.email);
}

