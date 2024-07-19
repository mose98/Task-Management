import 'package:flutter/material.dart';
import 'package:task_management/screens/menu_page.dart';
import 'package:task_management/screens/profile_page.dart';
import 'package:task_management/widgets/constants.dart';
import 'package:task_management/widgets/premium.dart';
import 'package:task_management/widgets/tasks.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> _pages = [
    const HomePage(),
    const ProfilePage(),
  ];
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomNavigationBar(
            backgroundColor: kwhite,
            selectedItemColor: Colors.blueAccent,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded, size: 30),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded, size: 30),
                label: 'Person',
              ),
            ],
            onTap: (index) {
              setState(() {
                activeIndex = index;
              });
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: kdark,
        child: Icon(
          Icons.add,
          color: klgihtgrey,
          size: 35,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: _pages[activeIndex],
    );
  }
}

AppBar _buildAppBar(BuildContext context) {
  return AppBar(
      backgroundColor: kwhite,
      elevation: 0,
      title: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 10, top: 5),
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                color: klgihtgrey, borderRadius: BorderRadius.circular(10)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('assets/profile.jpg'),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            'Hello, Amogh',
            style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.more_vert,
            color: Colors.grey.shade600,
            size: 35,
          ),
          onPressed: () {
            Navigator.push(
                context as BuildContext,
                MaterialPageRoute(
                    builder: (context) => MenuPage()));
          },
        ),
      ]);
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding:
          EdgeInsets.only(right: 8.0, left: 8.0, top: 20.0, bottom: 10.0),
          child: GoPremium(),
        ),
        Container(
          padding: const EdgeInsets.all(15),
          child: Text(
            'Tasks',
            style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 26,
                fontWeight: FontWeight.w500),
          ),
        ),
        Expanded(child: Tasks())
      ],
    );
  }
}
