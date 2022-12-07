import 'dart:convert';
import 'dart:math';

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
  List<User> userList = [];
  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  fetchUser() async {
    // var url = "https://jsonplaceholder.typicode.com/users";
// method 1
    // var url = Uri.https('jsonplaceholder.typicode.com', 'users');
    try {
      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

      final decodedResponse = jsonDecode(response.body) as List;
      userList = decodedResponse.map((e) => User.fromJson(e)).toList();
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Contact"),
      ),
      // body: const Center(
      //   child: ElevatedButton(
      //     child: Text('Click Me'),
      //     onPressed: getUserData(),
      //   ),
      // ),
      body: ListView.separated(
        itemCount: userList.length,
        separatorBuilder: (context, index) => const SizedBox(height: 5),
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color:
                  Colors.primaries[Random().nextInt(Colors.primaries.length)],
              // shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(userList[index].name),
                Text(userList[index].address.street),
                Text(userList[index].phone),
                Text(userList[index].email),
                Text(userList[index].company.name),
              ],
            ),
          );
        },
      ),
    );
  }
}
