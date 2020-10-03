class RegisterModel {
  String username;
  String email;
  String phone;
  String password;

  String role;
  int active;
  bool card;
  String country;
  String city;
  String addressDet;
  RegisterModel(
      {this.username,
        this.email,
        this.phone,
        this.password,

        this.role,
        this.active,
        this.card,
        this.country, this.city, this.addressDet});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    country = json['country'];
    city = json['city'];
    addressDet = json['addressDet'];
    role = json['role'];
    active = json['active'];
    card = json['card'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
     {
       data['country'] = this.country;
       data['city'] = this.city;
       data['addressDet'] = this.addressDet;
    }
    data['role'] = this.role;
    data['active'] = this.active;
    data['card'] = this.card;
    return data;
  }
}


