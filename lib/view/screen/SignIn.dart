import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../../controller/task_provider.dart';
import '../widget/customeTextField.dart';
import 'SignUp.dart';

class LoginPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Login',
                style: TextStyle(fontSize: 24.0),
              ),
              const SizedBox(height: 20.0),
              CustomTextField("Email", emailController,false,true),
              const SizedBox(height: 20.0),
              CustomTextField("Password", passwordController,true,true),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (emailController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty) {
                    Provider.of<TaskProvider>(context, listen: false).checkUser(
                        context, emailController.text, passwordController.text);
                  }
                },
                child: const Text('Login'),
              ),
              const SizedBox(height: 20.0),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return CreateAccountPage();
                    },
                  ));
                },
                child: const Text(
                  'Create an account',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
