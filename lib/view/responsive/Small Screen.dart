import 'package:flutter/material.dart';
import 'package:to_do_app/view/screen/List%20All%20Task.dart';
import 'package:to_do_app/view/screen/List%20Task%20Complete.dart';
import 'package:to_do_app/view/screen/List%20Task%20Not%20Complete.dart';

class SmallScreen extends StatefulWidget {
  @override
  State<SmallScreen> createState() => _SmallScreenState();
}

class _SmallScreenState extends State<SmallScreen> {
  PageController page = PageController();
  refreshWedget() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: Column(
        children: [
          const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/profile.jpg'),
              ),
              accountName: Text('Anas Essam Ahmed'),
              accountEmail: Text('test@gmail.com')),
          ListTile(
            onTap: () {
              page.jumpToPage(0);
              setState(() {});
              Navigator.of(context).pop();
            },
            title: const Text("All Task"),
            subtitle: const Text("Go To All Task"),
            leading: const Icon(Icons.list),
            trailing: const Icon(Icons.arrow_circle_right_outlined),
          ),
          ListTile(
            onTap: () {
              page.jumpToPage(1);
              setState(() {});
              Navigator.of(context).pop();
            },
            title: const Text("Comlete Task"),
            subtitle: const Text("Go To Complete Task"),
            leading: const Icon(Icons.done),
            trailing: const Icon(Icons.arrow_circle_right_outlined),
          ),
          ListTile(
            onTap: () {
              page.jumpToPage(2);
              setState(() {});
              Navigator.of(context).pop();
            },
            title: const Text("Incomplete Task"),
            subtitle: const Text("Go To Incomplete Task"),
            leading: const Icon(Icons.cancel),
            trailing: const Icon(Icons.arrow_circle_right_outlined),
          ),
        ],
      )),
      appBar: AppBar(title: const Text("To Do List App")),
      body: PageView(controller: page, children: [
        listAllTask(refreshWedget),
        listTaskComplete(refreshWedget),
        listTaskNotComplete(refreshWedget)
      ]),
    );
  }
}
