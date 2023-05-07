import 'package:flutter/material.dart';
import 'package:to_do_app/view/screen/List%20All%20Task.dart';
import 'package:to_do_app/view/screen/List%20Task%20Complete.dart';
import 'package:to_do_app/view/screen/List%20Task%20Not%20Complete.dart';

class largeScreen extends StatefulWidget {
  @override
  State<largeScreen> createState() => _largeScreenState();
}

class _largeScreenState extends State<largeScreen> {
  PageController page = PageController();

  refreshWedget() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("To Do List App")),
      body: Row(children: [
        Expanded(
            flex: 1,
            child: ListView(
              children: [
                const SizedBox(
                    child: UserAccountsDrawerHeader(
                        currentAccountPicture: CircleAvatar(
                          backgroundImage: AssetImage('images/profile.jpg'),
                          radius: 20,
                        ),
                        accountName: Text('Anas Essam Ahmed'),
                        accountEmail: Text('test@gmail.com'))),
                ElevatedButton(
                    onPressed: () {
                      page.animateToPage(0,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear);
                    },
                    child: const Text('All Task')),
                ElevatedButton(
                    onPressed: () {
                      page.animateToPage(1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear);
                    },
                    child: const Text('Task Complete')),
                ElevatedButton(
                    onPressed: () {
                      page.animateToPage(2,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear);
                    },
                    child: const Text('Task incomplete')),
              ],
            )),
        Expanded(
            flex: 2,
            child: PageView(controller: page, children: [
              listAllTask(refreshWedget),
              listTaskComplete(refreshWedget),
              listTaskNotComplete(refreshWedget)
            ])),
      ]),
    );
  }
}
