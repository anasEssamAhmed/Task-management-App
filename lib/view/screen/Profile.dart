import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/controller/task_provider.dart';

import '../widget/customeTextField.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(builder: (context, provider, child) {
      return Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Edit information ',
                  style: TextStyle(fontSize: 24.0),
                ),
                const SizedBox(height: 20.0),
                CustomTextField("Name", provider.name,false,provider.isEditing),
                const SizedBox(height: 20.0),
                CustomTextField("Email", provider.email,false,provider.isEditing),
                const SizedBox(height: 20.0),
                CustomTextField("Password", provider.password,true,provider.isEditing),
                const SizedBox(height: 20.0),
              provider.isEditing
                    ? ElevatedButton(
                        onPressed: () {
                          provider.updateUserData(context);
                        },
                        child: const Text('Save Changes'),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          provider.ShowUserInfo();
                        },
                        child: const Text('Edit Profile'),
                      ),
              ],
            ),
          ),
        ),
      );

    });
  }
}
