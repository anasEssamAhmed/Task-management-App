import 'package:provider/provider.dart';
import 'package:to_do_app/controller/task_provider.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/view/widget/customeTextField.dart';
import '../../model/User.dart';

class CreateAccountPage extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Create Account',
                style: TextStyle(fontSize: 24.0),
              ),
              const SizedBox(height: 20.0),
              CustomTextField("Name", nameController,false,true),
              const SizedBox(height: 20.0),
              CustomTextField("Email", emailController,false,true),
              const SizedBox(height: 20.0),
              CustomTextField("Password", passwordController,true,true),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: (){
                  if (emailController.text.isNotEmpty &&
                      nameController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty) {
                    User user = User(emailController.text, nameController.text,
                        passwordController.text);
                    Provider.of<TaskProvider>(context, listen: false)
                        .insertDataToUserTable(user, context);
                  }
                },
                child: const Text('Create Account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
