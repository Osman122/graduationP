class OrderModel {
  int id;
  String deliveryMethod;
  String vehicleType;
  String pickupLocation;
  String mobile;
  String discription;
  String clientName;
  String address;
  double price;
  int code;
  String paymentMethod;
  String time;
  int car;
  bool ok;
  String company;
  bool done;
  User user;

  OrderModel(
      {this.id,
        this.deliveryMethod,
        this.vehicleType,
        this.pickupLocation,
        this.mobile,
        this.discription,
        this.clientName,
        this.address,
        this.price,
        this.code,
        this.paymentMethod,
        this.time,
        this.car,
        this.ok,
        this.company,
        this.done,
        this.user});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deliveryMethod = json['delivery_method'];
    vehicleType = json['vehicle_type'];
    pickupLocation = json['pickup_Location'];
    mobile = json['mobile'];
    discription = json['discription'];
    clientName = json['client_name'];
    address = json['address'];
    price = json['price'];
    code = json['code'];
    paymentMethod = json['payment_method'];
    time = json['time'];
    car = json['car'];
    ok = json['ok'];
    company = json['company'];
    done = json['done'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['delivery_method'] = this.deliveryMethod;
    data['vehicle_type'] = this.vehicleType;
    data['pickup_Location'] = this.pickupLocation;
    data['mobile'] = this.mobile;
    data['discription'] = this.discription;
    data['client_name'] = this.clientName;
    data['address'] = this.address;
    data['price'] = this.price;
    data['code'] = this.code;
    data['payment_method'] = this.paymentMethod;
    data['time'] = this.time;
    data['car'] = this.car;
    data['ok'] = this.ok;
    data['company'] = this.company;
    data['done'] = this.done;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class User {
  int id;
  String username;
  String email;
  String phone;
  String password;
  Address address;
  String role;
  int active;
  bool card;

  User(
      {this.id,
        this.username,
        this.email,
        this.phone,
        this.password,
        this.address,
        this.role,
        this.active,
        this.card});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    role = json['role'];
    active = json['active'];
    card = json['card'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    data['role'] = this.role;
    data['active'] = this.active;
    data['card'] = this.card;
    return data;
  }
}

class Address {
  String country;
  String city;
  String addressDet;

  Address({this.country, this.city, this.addressDet});

  Address.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    city = json['city'];
    addressDet = json['addressDet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['city'] = this.city;
    data['addressDet'] = this.addressDet;
    return data;
  }
}
