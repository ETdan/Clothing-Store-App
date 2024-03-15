import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  bool isActiveUnderlined = true;
  bool isCompletedUnderlined = false;
  bool isCancelledUnderlined = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          margin: EdgeInsets.only(top: 16, bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              Text(
                "Orders",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 50,
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isActiveUnderlined = true;
                      isCompletedUnderlined = false;
                      isCancelledUnderlined = false;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: isActiveUnderlined
                              ? const Color(0xFF6055D8)
                              : Colors.transparent,
                          width: 4.0,
                        ),
                      ),
                    ),
                    child: Text(
                      "Active",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isActiveUnderlined = false;
                      isCompletedUnderlined = true;
                      isCancelledUnderlined = false;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: isCompletedUnderlined
                              ? const Color(0xFF6055D8)
                              : Colors.transparent,
                          width: 4.0,
                        ),
                      ),
                    ),
                    child: Text(
                      "Completed",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isActiveUnderlined = false;
                      isCompletedUnderlined = false;
                      isCancelledUnderlined = true;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: isCancelledUnderlined
                              ? const Color(0xFF6055D8)
                              : Colors.transparent,
                          width: 4.0,
                        ),
                      ),
                    ),
                    child: Text(
                      "Cancelled",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Card(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: 370,
                      height: 150,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.red,
                                  ),
                                  height: 120,
                                  width: 150,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Watch",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Rolex",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: const Color(0xFF9B9999),
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "\$40",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: const Color(0xFF6055D8),
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          // SizedBox(
                          //   width: 10,
                          // ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "Track Order",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      const Color(0xFF6055D8)),
                                  fixedSize:
                                      MaterialStateProperty.all(Size(130, 50)),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
