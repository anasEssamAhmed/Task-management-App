import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/controller/task_provider.dart';
import 'package:to_do_app/view/screen/List%20All%20Task.dart';
import 'package:to_do_app/view/screen/List%20Task%20Complete.dart';
import 'package:to_do_app/view/screen/List%20Task%20Not%20Complete.dart';
import 'package:to_do_app/view/screen/Profile.dart';
import 'package:to_do_app/view/screen/SignIn.dart';

class SmallScreen extends StatelessWidget {
  PageController page = PageController();

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(builder: (context, provider, child) {
      provider.getUserNameFromEmail();
      return Scaffold(
        drawer: Drawer(
            child: Column(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: AssetImage('images/smile.jpg'),
                ),
                accountName: Text(provider.nameAccount ?? ""),
                accountEmail: Text(provider.emailAccount ?? "")),
            provider.customListTile(
                page,
                0,
                context,
                "All Task",
                "Go To All Task",
                Icons.list,
                Icons.arrow_circle_right_outlined),
            provider.customListTile(
                page,
                1,
                context,
                "Complete Task",
                "Go To Complete Task",
                Icons.done,
                Icons.arrow_circle_right_outlined),
            provider.customListTile(
                page,
                2,
                context,
                "Not Complete Task",
                "Go To Not Complete Task",
                Icons.cancel,
                Icons.arrow_circle_right_outlined),
            provider.customListTile(
                page,
                3,
                context,
                "Profile",
                "Go To My Profile",
                Icons.person,
                Icons.arrow_circle_right_outlined),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) {
                    return LoginPage();
                  },
                ));
              },
              title: const Text("Sign Out"),
              subtitle: const Text("Sign out of the app"),
              leading: const Icon(Icons.logout),
              trailing: const Icon(Icons.arrow_circle_right_outlined),
            ),
          ],
        )),
        appBar: AppBar(title: const Text("To Do List App")),
        body: PageView(controller: page, children: [
          listAllTask(),
          listTaskComplete(),
          listTaskNotComplete(),
          ProfilePage()
        ]),
      );
    });
  }
}
