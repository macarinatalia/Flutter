import 'package:flutter/material.dart';

import '../model/user.dart';

class UserInfoPage extends StatelessWidget {
  User userInfo;
  UserInfoPage({Key? key, required this.userInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Info'),
        centerTitle: true,
      ),
      body: Card(
        margin: const EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              title: Text(
                userInfo.name,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: Text(userInfo.story ?? ''),
              leading: const Icon(
                Icons.person,
                color: Colors.black,
              ),
              trailing: Text(userInfo.country ?? ''),
            ),
            ListTile(
              title: Text(
                userInfo.phone,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              leading: const Icon(
                Icons.phone,
                color: Colors.black,
              ),
            ),
            Visibility(
              visible: userInfo.email?.length != 0,
              child: ListTile(
                title: Text(
                  '${userInfo.email}',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                leading: const Icon(
                  Icons.email,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
