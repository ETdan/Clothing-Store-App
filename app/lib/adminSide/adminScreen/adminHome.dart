import 'package:flutter/material.dart';

class adminHome extends StatefulWidget {
  const adminHome({super.key});

  @override
  State<adminHome> createState() => _adminHomeState();
}

class _adminHomeState extends State<adminHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          title: Center(
            child: Text(
              'E-Cloth Admin Panel',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.dark_mode,
                size: 30,
                color: Colors.black87,
              ),
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.home,
                  size: 20,
                  color: Colors.grey,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  size: 20,
                  color: Colors.grey,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.person_2_outlined,
                  size: 20,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Text(
                'this is Admin home page',
              ),
            ),
            Center(
              child: Text(
                'this is Admin controll page',
              ),
            ),
            Center(
              child: Text(
                'this is Admin profile page',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
