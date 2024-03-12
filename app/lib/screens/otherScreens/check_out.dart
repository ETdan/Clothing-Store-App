import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 227, 227, 227),
              ),
              child: Icon(
                Icons.arrow_back,
                color: Colors.black87,
                size: 30,
              ),
            ),
          ),
          title: Center(
            child: Text(
              'Check Out',
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 227, 227, 227),
                      ),
                      child: Icon(
                        Icons.pin_drop,
                        color: Color.fromARGB(
                            255, 103, 67, 176), // You can change the icon color
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '325 15th Eighth Avenue, New York',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        'saepe eague fugiat ea voluptatum veniam.',
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(
                            255, 227, 227, 227), // You can change the color
                      ),
                      child: Icon(
                        Icons.schedule,
                        color: Color.fromARGB(
                            255, 103, 67, 176), // You can change the icon color
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '6:00 pm, Wednesday 20',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),
              Card(
                child: Container(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                  ),
                  width: 350,
                  height: 200,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Order Summery',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [Text('Items'), Spacer(), Text('3')],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [Text('Subtotal'), Spacer(), Text('\$423')],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [Text('Discount'), Spacer(), Text('\$4')],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text('Delivery Charges'),
                          Spacer(),
                          Text('\$2')
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(
                        thickness: 1,
                        color: Colors.grey,
                        height: 3,
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text('Delivery Charges'),
                          Spacer(),
                          Text('\$423')
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Row(
                  children: [
                    Text(
                      'Choose payment method',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.fromLTRB(18, 0, 18, 0),
                child: Row(
                  children: [
                    Icon(Icons.payments),
                    SizedBox(
                      width: 5,
                    ),
                    Text('paypal'),
                    Spacer(),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 227, 227, 227),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.fromLTRB(18, 0, 18, 0),
                child: Row(
                  children: [
                    Icon(Icons.payments),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Credit Card'),
                    Spacer(),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 227, 227, 227),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: EdgeInsets.fromLTRB(18, 0, 18, 0),
                child: Row(
                  children: [
                    Icon(Icons.payments),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Cash'),
                    Spacer(),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 227, 227, 227),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.fromLTRB(18, 0, 18, 0),
                child: Row(
                  children: [
                    Text(
                      'Add new payment method',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Spacer(),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 227, 227, 227),
                      ),
                      child: Icon(
                        Icons.add,
                        color: const Color.fromARGB(255, 103, 103,
                            103), // You can change the icon color
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 300, // Set the desired width
                child: ElevatedButton(
                  onPressed: () {
                    // Handle the button press here
                    /* Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  null),
      ); */
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 103, 67, 176),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Check Out',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )));
  }
}
