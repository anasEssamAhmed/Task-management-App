import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/task_provider.dart';

class SplashPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // navigate to login page
    Provider.of<TaskProvider>(context , listen: false).navigateToLoginPage(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue, Colors.green],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.check_circle_outline,
                color: Colors.white,
                size: 100.0,
              ),
              SizedBox(height: 16.0),
              Text(
                'My Task Manager',
                style: TextStyle(
                  fontSize: 28.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Your convenient place to manage tasks',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
