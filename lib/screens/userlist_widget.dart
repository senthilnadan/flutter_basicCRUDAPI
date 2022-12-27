import 'package:flutter/material.dart';
import 'user_detail_widget.dart';
import 'package:userapp/models/user_model.dart';

class UserList extends StatelessWidget {
  final List<UserModel> users;
  UserList({Key? key, required this.users}) : super(key: key);

  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Card(
              child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailWidget(users[index])),
              );
            },
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(users[index].id.toString()),
                  Text(users[index].username),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(users[index].email),
                  Text(users[index].website),
                ],
              ),
            ]),
          ));
        });
  }
}
