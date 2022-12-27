import 'package:flutter/material.dart';
import 'package:userapp/models/user_model.dart';
import 'package:userapp/service/api_service.dart';
import 'user_detail_widget.dart';
import 'adddatawidget.dart';
import 'userlist_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<UserModel> _userModel = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _userModel = (await ApiService().getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  Future _loadData() {
    Future<List<UserModel>?> futureCases = ApiService().getUsers();
    futureCases.then((userModel) {
      setState(() {
        this._userModel = userModel!;
      });
    });
    return futureCases;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Rest Example"),
      ),
      body: _userModel == null || _userModel.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : new FutureBuilder(
              future: _loadData(),
              builder: (context, snapshot) {
                return _userModel.length > 0
                    ? new UserList(users: _userModel)
                    : Center(
                        child: const CircularProgressIndicator(),
                      );
              }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToAddScreen(context);
        },
        tooltip: 'addUser',
        child: const Icon(Icons.add),
      ),
    );
  }

  _navigateToAddScreen(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddDataWidget()),
    );
  }
}
