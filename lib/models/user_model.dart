import 'dart:convert';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
  });

  String id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        address: Address.fromJson(json["address"]),
        phone: json["phone"],
        website: json["website"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "address": address.toJson(),
        "phone": phone,
        "website": website,
      };
}

class Address {
  Address({
    required this.street,
    required this.building,
    required this.city,
    required this.zipcode,
  });

  String street;
  String building;
  String city;
  String zipcode;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        building: json["building"],
        city: json["city"],
        zipcode: json["zipcode"],
      );

  Map<String, dynamic> toJson() => {
        "street": street,
        "building": building,
        "city": city,
        "zipcode": zipcode,
      };
}
