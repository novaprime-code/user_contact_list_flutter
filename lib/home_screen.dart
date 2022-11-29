import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:user_contact/model/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // State<HomeScreen> createState() => _HomeScreenState();
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  getUserData() async {
    // var url = "https://jsonplaceholder.typicode.com/users";
// method 1
    var url = Uri.https('jsonplaceholder.typicode.com', 'users');
    final response = await http.get(url);
    // var url = "https://jsonplaceholder.typicode.com/users";
    // var response = await http.get();
    // method 3
    // var response = await http.get(Uri.http('jsonplaceholder.typicode.com', 'users', {'_limit': '2'}));
    // var data = jsonDecode(response.body);
    // print(data);

    // final String name;
    // final String username;
    // final String email;
    // final Address address;
    // final String phone;
    // final String website;
    // final Company company;
    var jsonData = jsonDecode(response.body);
    List<User> users = [];
    for (var u in jsonData) {
      User user = User(u["id"], u["name"], u["username"], u["email"],
          u["phone"], u["website"]);
      // User user = User(u["name"], u["email"], u["phone"], u["username"],
      //     u["address"], u["company"], u["website"]);
      users.add(user);
    }
    print(users.length);
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // body: const Center(
      //   child: ElevatedButton(
      //     child: Text('Click Me'),
      //     onPressed: getUserData(),
      //   ),
      // ),
      body: Card(
        // shape: RoundedRectangleBorder(
        //   side: BorderSide(color: Colors.green.shade300),
        //   borderRadius: BorderRadius.circular(15.0),
        // ),
        child: FutureBuilder(
          future: getUserData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(
                child: Text("Loading..."),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),

                    shape: BeveledRectangleBorder(
                      //<-- SEE HERE
                      side: BorderSide(width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    leading: CircleAvatar(
                      backgroundColor: const Color(0xff6ae792),
                      child: Text(
                        snapshot.data[index].id.toString(),
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    // title: Text(snapshot.data[index].name),
                    title: Column(
                      children: [
                        Text(snapshot.data[index].name),
                        Text(snapshot.data[index].username),
                        Text(snapshot.data[index].email),
                        Text(snapshot.data[index].phone),
                        Text(snapshot.data[index].website),
                      ],
                    ),
                    trailing: Icon(Icons.more_vert),
                    // spacing: 20;
                    // SizedBox(height: 10),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
