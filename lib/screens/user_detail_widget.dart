import 'package:flutter/material.dart';
import 'package:userapp/models/user_model.dart';
import 'package:userapp/service/api_service.dart';
import 'edit_user_widget.dart';

class DetailWidget extends StatefulWidget {
  DetailWidget(this.users);

  final UserModel users;

  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  _DetailWidgetState();

  final ApiService api = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.all(20.0),
        child: Card(
            child: Container(
          width: 440,
          padding: EdgeInsets.all(10.0),
          child: Column(children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Column(
                children: <Widget>[
                  Text('Name:',
                      style: TextStyle(color: Colors.black.withOpacity(0.8))),
                  Text(widget.users.name,
                      style: const TextStyle(color: Colors.blue))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Column(
                children: <Widget>[
                  Text('id:',
                      style: TextStyle(color: Colors.black.withOpacity(0.8))),
                  Text(widget.users.id,
                      style: const TextStyle(color: Colors.blue))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Column(
                children: <Widget>[
                  Text('UserName:',
                      style: TextStyle(color: Colors.black.withOpacity(0.8))),
                  Text(widget.users.username,
                      style: const TextStyle(color: Colors.blue))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Column(
                children: <Widget>[
                  Text('email:',
                      style: TextStyle(color: Colors.black.withOpacity(0.8))),
                  Text(widget.users.email,
                      style: const TextStyle(color: Colors.blue))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Column(
                children: <Widget>[
                  Text('phone:',
                      style: TextStyle(color: Colors.black.withOpacity(0.8))),
                  Text(widget.users.phone,
                      style: const TextStyle(color: Colors.blue))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Column(
                children: <Widget>[
                  Text('website:',
                      style: TextStyle(color: Colors.black.withOpacity(0.8))),
                  Text(widget.users.website,
                      style: const TextStyle(color: Colors.blue))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Column(
                children: <Widget>[
                  Text('street:',
                      style: TextStyle(color: Colors.black.withOpacity(0.8))),
                  Text(widget.users.address.street,
                      style: const TextStyle(color: Colors.blue))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Column(
                children: <Widget>[
                  Text('building:',
                      style: TextStyle(color: Colors.black.withOpacity(0.8))),
                  Text(widget.users.address.building,
                      style: const TextStyle(color: Colors.blue))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Column(
                children: <Widget>[
                  Text('city:',
                      style: TextStyle(color: Colors.black.withOpacity(0.8))),
                  Text(widget.users.address.city,
                      style: const TextStyle(color: Colors.blue))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Column(
                children: <Widget>[
                  Text('pincode:',
                      style: TextStyle(color: Colors.black.withOpacity(0.8))),
                  Text(widget.users.address.zipcode,
                      style: const TextStyle(color: Colors.blue))
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(140, 0, 0, 10),
                      child: ElevatedButton(
                          onPressed: () {
                            _navigateToEditScreen(context, widget.users);
                          },
                          child: const Text("Edit",
                              style: TextStyle(color: Colors.white))),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 10),
                      child: ElevatedButton(
                          onPressed: () {
                            _confirmDialog();
                            ;
                          },
                          child: const Text("delete",
                              style: TextStyle(color: Colors.white))),
                    )
                  ],
                )),
          ]),
        )),
      )),
    );
  }

  _navigateToEditScreen(BuildContext context, UserModel users) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditDataWidget(users)),
    );
  }

  Future<void> _confirmDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Warning!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text('Are you sure want delete this item?'),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Yes'),
              onPressed: () {
                api.deleteUser(widget.users.id);
                Navigator.popUntil(
                    context, ModalRoute.withName(Navigator.defaultRouteName));
              },
            ),
            ElevatedButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
