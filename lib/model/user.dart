import 'address.dart';
import 'company.dart';

class User {
  final int id;
  final String name;
  final String username;
  final String email;
  // final Address address;
  final String phone;
  final String website;
  // final Company company;

  User(
    this.id,
    this.name,
    this.username,
    this.email,
    // this.address,
    this.phone,
    this.website,
    // this.company,
  );
  // User({
  //   required this.name,
  //   required this.username,
  //   required this.email,
  //   required this.address,
  //   required this.phone,
  //   required this.website,
  //   required this.company,
  // });

  // factory User.fromJson(Map<String, dynamic> json) {
  //   return User(
  //     name: json['name'],
  //     username: json['username'],
  //     email: json['email'],
  //     address: Address.fromJson(json['address']),
  //     phone: json['phone'],
  //     website: json['website'],
  //     company: Company.fromJson(json['company']),
  //   );
  // }
}



// "id": 1,
//     "name": "Leanne Graham",
//     "username": "Bret",
//     "email": "Sincere@april.biz",
//     "address": {
//       "street": "Kulas Light",
//       "suite": "Apt. 556",
//       "city": "Gwenborough",
//       "zipcode": "92998-3874",
//       "geo": {
//         "lat": "-37.3159",
//         "lng": "81.1496"
//       }
//     },
//     "phone": "1-770-736-8031 x56442",
//     "website": "hildegard.org",
//     "company": {
//       "name": "Romaguera-Crona",
//       "catchPhrase": "Multi-layered client-server neural-net",
//       "bs": "harness real-time e-markets"
//     }