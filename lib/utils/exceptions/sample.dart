import 'dart:io';

import 'package:boiler_plate/utils/exceptions/execfunc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


// User.dart
class User {
  int? id;
  String? name;
  String? email;

  User({this.id, this.name, this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
    );
  }
}

class Services {
  static const String url = 'https://jsonplaceholder.typicode.com/users';

  static Future<List<User>> getUsers() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (200 == response.statusCode) {
        List<User> users = parseUsers(response.body);
        return users;
        //throw Exception('Unknown Error');
      } else {
        return <User>[];
      }
    } on SocketException catch (e) {
      throw NoInternetException('No Internet');
    } on HttpException {
      throw NoServiceFoundException('No Service Found');
    } on FormatException {
      throw InvalidFormatException('Invalid Data Format');
    } catch (e) {
      throw UnknownException('unknown');
    }
  }

  static List<User> parseUsers(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<User>((json) => User.fromJson(json)).toList();
  }
}


// for ui
//
// list() {
//   return FutureBuilder(
//     future: users,
//     builder: (context, snapshot) {
//       if (snapshot.hasData) {
//         List<User> users = snapshot.data;
//         if (users.isEmpty) {
//           return showError('No Users');
//         }
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: users
//               .map(
//                 (user) => Padding(
//               padding: EdgeInsets.all(10.0),
//               child: Text(
//                 user.name,
//                 style: TextStyle(
//                   fontSize: 20.0,
//                 ),
//               ),
//             ),
//           )
//               .toList(),
//         );
//       }
//       if (snapshot.hasError) {
//         if (snapshot.error is NoInternetException) {
//           NoInternetException noInternetException =
//           snapshot.error as NoInternetException;
//           return showError(noInternetException.message);
//         }
//         if (snapshot.error is NoServiceFoundException) {
//           NoServiceFoundException noServiceFoundException =
//           snapshot.error as NoServiceFoundException;
//           return showError(noServiceFoundException.message);
//         }
//         if (snapshot.error is InvalidFormatException) {
//           InvalidFormatException invalidFormatException =
//           snapshot.error as InvalidFormatException;
//           return showError(invalidFormatException.message);
//         }
//         UnknownException unknownException =
//         snapshot.error as UnknownException;
//         return showError(unknownException.message);
//       }
//       return CircularProgressIndicator();
//     },
//   );
// }