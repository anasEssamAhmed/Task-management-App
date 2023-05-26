import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/controller/task_provider.dart';
import 'package:to_do_app/view/screen/List%20All%20Task.dart';
import 'package:to_do_app/view/screen/List%20Task%20Complete.dart';
import 'package:to_do_app/view/screen/List%20Task%20Not%20Complete.dart';
import 'package:to_do_app/view/widget/largeScreenWidget.dart';
import '../screen/Profile.dart';
import '../screen/SignIn.dart';

class largeScreen extends StatelessWidget {
  PageController page = PageController();

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(builder: (context, provider, child) {
      provider.getUserNameFromEmail();
      return Scaffold(
        appBar: AppBar(title: const Text("To Do List App")),
        body: Row(children: [
          Expanded(
              flex: 1,
              child: ListView(
                children: [
                  SizedBox(
                      child: UserAccountsDrawerHeader(
                          currentAccountPicture: const CircleAvatar(
                            backgroundImage: AssetImage('images/smile.jpg'),
                            radius: 20,
                          ),
                          accountName: Text(provider.nameAccount ?? ""),
                          accountEmail: Text(provider.emailAccount ?? ""))),
                  LargeScreenWidget(page, 0, "All Task"),
                  LargeScreenWidget(page, 1, "Task Complete"),
                  LargeScreenWidget(page, 2, "Task Not Complete"),
                  LargeScreenWidget(page, 3, "Profile"),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) {
                            return LoginPage();
                          },
                        ));
                      },
                      child: const Text('Sign Out'))
                ],
              )),
          Expanded(
              flex: 2,
              child: PageView(controller: page, children: [
                listAllTask(),
                listTaskComplete(),
                listTaskNotComplete(),
                ProfilePage()
              ])),
        ]),
      );
    });
  }
}
