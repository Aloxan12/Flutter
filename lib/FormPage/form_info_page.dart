import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_progect/FormPage/model/user.dart';

class FormInfoPage extends StatelessWidget {

  User? userInfo;
  FormInfoPage({this.userInfo});
  @override
  Widget build(BuildContext context) {
    final isNotValidEmail = userInfo?.email?.isEmpty;
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
                '${userInfo?.name}',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text('${userInfo?.story}', style: TextStyle(color: Colors.black),),
              leading: Icon(
                Icons.person,
                color: Colors.black,
              ),
              trailing: Text('${userInfo?.country}'),
            ),
            ListTile(
              title: Text(
                '${userInfo?.phone}',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              leading: Icon(
                Icons.phone,
                color: Colors.black,
              ),
            ),
             ListTile(
              title: Text(
                '${userInfo?.email}',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              leading: Icon(
                isNotValidEmail! ? null : Icons.email,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
