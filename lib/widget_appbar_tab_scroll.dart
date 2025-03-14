import 'package:flutter/material.dart';

List<String> titles = <String>['Cloud 0', 'Beach 1', 'Sunny 2'];

class AppBarTabScrollable extends StatelessWidget {
  const AppBarTabScrollable({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
    const int tabsCount = 3;

    return DefaultTabController(
      initialIndex: 1,
      length: tabsCount,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('AppBar exemplo'),
          notificationPredicate: (ScrollNotification notification) {
            return notification.depth == 1;
          },
          scrolledUnderElevation: 4.0,
          shadowColor: Theme.of(context).shadowColor,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: const Icon(Icons.cloud_outlined), text: titles[0]),
              Tab(icon: const Icon(Icons.beach_access_sharp), text: titles[1]),
              Tab(icon: const Icon(Icons.brightness_5_sharp), text: titles[2]),
            ],
          ),
        ),

        body: TabBarView(
          children: <Widget>[
            ListView.builder(
              itemCount: 35,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  tileColor: index.isOdd ? oddItemColor : evenItemColor,
                  title: Text(
                    '${titles[0]} $index '
                    '?',
                  ),
                );
              },
            ),
            ListView.builder(
              itemCount: 35,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  tileColor: index.isOdd ? oddItemColor : evenItemColor,
                  title: Text('${titles[1]} $index'),
                );
              },
            ),
            ListView.builder(
              itemCount: 35,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  tileColor: index.isOdd ? oddItemColor : evenItemColor,
                  title: Text('${titles[2]} $index'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
