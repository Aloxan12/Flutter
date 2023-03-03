import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_progect/FormPage/model/user.dart';

class FormInfoPage extends StatelessWidget {

  User? userInfo;
  FormInfoPage({userInfo});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Info'),
        centerTitle: true,
      ),
      body: Card(
        margin: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text(
                'Name',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text('Story'),
              leading: Icon(
                Icons.person,
                color: Colors.black,
              ),
              trailing: Text('country'),
            ),
            ListTile(
              title: Text(
                'Phone',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              leading: Icon(
                Icons.phone,
                color: Colors.black,
              ),
            ),
            ListTile(
              title: Text(
                'Email',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              leading: Icon(
                Icons.email,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
