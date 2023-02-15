import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => Container(
        child: ListTile(
          leading: Text(
            'ID: 1',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          title: Column(
            children: <Widget>[
              Text(
                'My name',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Email: test@test.com',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  Text(
                    'Phone: +375293332299',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
