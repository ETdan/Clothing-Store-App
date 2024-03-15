import '/adminSide/adminScreen/catagories/catagories.dart';
import '/adminSide/adminScreen/dashboard.dart';
import '/adminSide/adminScreen/order/orders.dart';
import '/adminSide/adminScreen/products/products.dart';
import '/adminSide/adminScreen/settings.dart';
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
      length: 5,
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
             Container(
  width: 100, // Set your desired width here
  child: Tab(
    child: Text(
      'Dashboard',
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: Colors.black87,
      ),
    ),
  ),
),

              Tab(
                icon: Text(
                  'Catagories',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                ),
              ),
              Tab(
                icon: Text(
                  'Products',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                ),
              ),
              Tab(
                icon: Text(
                  'Orders',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                ),
              ),
              Tab(
                icon: Text(
                  'Settings',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                ),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            dashBoard(),
            Categories(),

            products(),
            orders(),
            Setting(),
          ],
        ),
      ),
    );
  }
}
