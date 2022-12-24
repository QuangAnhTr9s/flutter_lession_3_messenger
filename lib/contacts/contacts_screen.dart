import 'package:flutter/material.dart';

import '../call/call_screen.dart';
import '../main.dart';
import '../screen_consts.dart';
import '../story/story_screen.dart';

class ContactsScreen extends StatelessWidget {  @override
Widget build(BuildContext context) {
  return MaterialApp(
    routes: {
      '/': (context) => MyContactScreen(),
      RouteName.HOME_SCREEN: (context) => MyApp(),
      RouteName.CALL_SCREEN: (context) => CallScreen(),
      RouteName.STORY_SCREEN: (context) => StoryScreen(),
    },
    initialRoute: '/',
  );
}
}

class MyContactScreen extends StatelessWidget {
  const MyContactScreen({
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
                  itemCount: 2,
                  itemBuilder: (context, index) {return Text('Contacts screen');
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
          currentIndex: 2,
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
                    Navigator.of(context).pushNamed(RouteName.CALL_SCREEN);
                  },
                  icon: Icon(Icons.videocam_sharp),
                ),
                label: 'Call'),
            BottomNavigationBarItem(
                icon: IconButton(
                  onPressed: () {
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