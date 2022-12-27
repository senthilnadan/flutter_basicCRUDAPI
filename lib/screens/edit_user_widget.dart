import 'package:flutter/material.dart';
import 'package:userapp/service/api_service.dart';
import 'package:userapp/models/user_model.dart';

class EditDataWidget extends StatefulWidget {
  EditDataWidget(this.user);

  final UserModel user;

  @override
  _EditDataWidgetState createState() => _EditDataWidgetState();
}

class _EditDataWidgetState extends State<EditDataWidget> {
  _EditDataWidgetState();

  final ApiService api = ApiService();
  final _addFormKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _userNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _idController = TextEditingController();
  final _websiteController = TextEditingController();
  final _streetController = TextEditingController();
  final _buildingController = TextEditingController();
  final _cityController = TextEditingController();
  final _zipcodeController = TextEditingController();

  @override
  void initState() {
    _idController.text = widget.user.id;
    _nameController.text = widget.user.name;
    _userNameController.text = widget.user.username;
    _emailController.text = widget.user.email;
    _phoneController.text = widget.user.phone;
    _websiteController.text = widget.user.website;
    _streetController.text = widget.user.address.street;
    _buildingController.text = widget.user.address.building;
    _cityController.text = widget.user.address.city;
    _zipcodeController.text = widget.user.address.zipcode;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add User"),
        ),
        body: Form(
          key: _addFormKey,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  width: 440,
                  child: Column(children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(children: <Widget>[
                        Text("id"),
                        TextFormField(
                          controller: _idController,
                          decoration: const InputDecoration(
                            hintText: 'id',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter id';
                            }
                            return null;
                          },
                          onChanged: (value) {},
                        )
                      ]),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(children: <Widget>[
                        Text("Full Name"),
                        TextFormField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                            hintText: 'Full Name',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter full name';
                            }
                            return null;
                          },
                          onChanged: (value) {},
                        )
                      ]),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(children: <Widget>[
                        Text("userName"),
                        TextFormField(
                          controller: _userNameController,
                          decoration: const InputDecoration(
                            hintText: 'UserName',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter User name';
                            }
                            return null;
                          },
                          onChanged: (value) {},
                        )
                      ]),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(children: <Widget>[
                        Text("email"),
                        TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            hintText: 'email',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter email';
                            }
                            return null;
                          },
                          onChanged: (value) {},
                        )
                      ]),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(children: <Widget>[
                        Text("phone"),
                        TextFormField(
                          controller: _phoneController,
                          decoration: const InputDecoration(
                            hintText: 'phone',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter phone';
                            }
                            return null;
                          },
                          onChanged: (value) {},
                        )
                      ]),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(children: <Widget>[
                        Text("street"),
                        TextFormField(
                          controller: _streetController,
                          decoration: const InputDecoration(
                            hintText: 'street',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter street';
                            }
                            return null;
                          },
                          onChanged: (value) {},
                        )
                      ]),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(children: <Widget>[
                        Text("building"),
                        TextFormField(
                          controller: _buildingController,
                          decoration: const InputDecoration(
                            hintText: 'building',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter building';
                            }
                            return null;
                          },
                          onChanged: (value) {},
                        )
                      ]),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(children: <Widget>[
                        Text("city"),
                        TextFormField(
                          controller: _cityController,
                          decoration: const InputDecoration(
                            hintText: 'city',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter city';
                            }
                            return null;
                          },
                          onChanged: (value) {},
                        )
                      ]),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(children: <Widget>[
                        Text("pincode"),
                        TextFormField(
                          controller: _zipcodeController,
                          decoration: const InputDecoration(
                            hintText: 'pincode',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter pincode';
                            }
                            return null;
                          },
                          onChanged: (value) {},
                        )
                      ]),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Column(children: <Widget>[
                        ElevatedButton(
                          onPressed: () async {
                            if (_addFormKey.currentState!.validate()) {
                              _addFormKey.currentState!.save();
                              Address address = Address(
                                  street: _streetController.text,
                                  building: _buildingController.text,
                                  city: _cityController.text,
                                  zipcode: _zipcodeController.text);
                              UserModel updatedUser = await api.updateUsers(
                                  _idController.text,
                                  UserModel(
                                      id: _idController.text,
                                      name: _nameController.text,
                                      username: _userNameController.text,
                                      email: _emailController.text,
                                      phone: _phoneController.text,
                                      website: _websiteController.text,
                                      address: address));

                              Navigator.pop(context);
                            }
                          },
                          style: const ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.blue)),
                          child: const Text('Save',
                              style: TextStyle(color: Colors.white)),
                        )
                      ]),
                    ),
                  ]),
                ),
              ),
            ),
          ),
        ));
  }
}
