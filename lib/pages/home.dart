import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  int _currentTab = 0;
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(initialIndex: 0, length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        body: GestureDetector(
          onHorizontalDragEnd: (DragEndDetails details) {
            if (details.primaryVelocity! > 0) {
              if (_currentTab != 0) {
                setState(() {
                  _currentTab = 0;
                  _controller.animateTo(_currentTab);
                });
              }
            } else if (details.primaryVelocity! < 0) {
              if (_currentTab == 0) {
                setState(() {
                  _currentTab = 1;
                  _controller.animateTo(_currentTab);
                });
              }
            }
          },
          child: TabBarView(
            // This disables tab changing by swipe movement.
            physics: const NeverScrollableScrollPhysics(),
            controller: _controller,
            children: [
              ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("$index"),
                      onTap: () {},
                    );
                  },
                  itemCount: 10),
              Text("tab2"),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.check_box_outline_blank),
              label: "Pending",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.check_box_outlined),
              label: "Completed",
            )
          ],
          currentIndex: _currentTab,
          onTap: (index) {
            setState(() {
              _currentTab = index;
              _controller.animateTo(index);
            });
          },
        ));
  }
}
