import 'package:flutter/material.dart';
import 'package:lession_3_messenger/main.dart';

import '../contacts/contacts_screen.dart';
import '../screen_consts.dart';
import '../story/story_screen.dart';

class CallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => MyCallPage(),
        RouteName.HOME_SCREEN: (context) => MyApp(),
        RouteName.CALL_SCREEN: (context) => CallScreen(),
        RouteName.CONTACTS_SCREEN: (context) => ContactsScreen(),
        RouteName.STORY_SCREEN: (context) => StoryScreen(),
      },
      initialRoute: '/',
    );
  }
}

class MyCallPage extends StatelessWidget {
  const MyCallPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: const Text('Messenger'),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt)),
            IconButton(onPressed: () {}, icon: Icon(Icons.chat))
          ],
        ),
        drawer: Drawer(
          child: Center(
            child: Container(
              child: Text('This is Setting'),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: 1,
                  itemBuilder: (context, index) {return Text('Call screen');
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: 1,
          items: [
            BottomNavigationBarItem(
                icon: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(RouteName.HOME_SCREEN);
                  },
                  icon: Icon(Icons.chat),
                ),
                label: 'Chat'),
            BottomNavigationBarItem(
                icon: IconButton(
                  onPressed: () {
                  },
                  icon: Icon(Icons.videocam_sharp),
                ),
                label: 'Call'),
            BottomNavigationBarItem(
                icon: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(RouteName.CONTACTS_SCREEN);
                  },
                  icon: Icon(Icons.people),
                ),
                label: 'Contacts'),
            BottomNavigationBarItem(
                icon: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(RouteName.STORY_SCREEN);
                  },
                  icon: Icon(Icons.camera),
                ),
                label: 'Story'),
          ],
        ));
  }
}
