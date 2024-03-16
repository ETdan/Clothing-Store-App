import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:shega_cloth_store_app/adminSide/adminScreen/order/orders.dart';
import 'package:shega_cloth_store_app/adminSide/adminScreen/settings.dart';

import '/adminSide/adminScreen/catagories/catagories.dart';
import '/adminSide/adminScreen/products/products.dart';
import 'package:flutter/material.dart';

class dashBoard extends StatefulWidget {
  const dashBoard({super.key});

  @override
  State<dashBoard> createState() => _dashBoardState();
}

class _dashBoardState extends State<dashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      
      body: SafeArea(
        
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                   Row(
                        children: [
                          Text('Wellcome to the\n admin pannel',
                           style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                                              ),),
                        ],
                      ),
                      SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                     
                      

Row(
  children: [
    CircleAvatar(), SizedBox(width: 5),
                        Text('hi dagi',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),),
  ],
),
                    
                    
                          
                          
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue[600],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.all(12),
                      child: Icon(Icons.notifications, color: Colors.white,))
                  ],),
SizedBox(height: 5),

                  Row(
                    
                    children: [
                      
                      Text('23/23/23',
                      style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),),
                      
                    ],
                  ),
                          SizedBox(height: 20,),
                  Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue[600],
                      borderRadius: BorderRadius.circular(12)
                    ),
                    padding: EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        Text('Search',
                        style: TextStyle(color: Colors.white),),
                      ],
                    ),
                  ),
                  SizedBox(height: 70,)
                ],
              ),
            ),
        
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: EdgeInsets.all(25),
                  color: const Color.fromARGB(255, 206, 204, 204),
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(height: 30,),
                          Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Activities', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                            Icon(Icons.more_horiz),
                          ],
                        ),
                        SizedBox(height: 40,),
                                    
                                    
                                    
                      GestureDetector(
                    onTap: () {
                   /*   // Navigate to categories screen
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Categories()));*/
                    },
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Container(
                    padding: EdgeInsets.all(16),
                    color: Colors.orange,
                    child: Icon(Icons.favorite, color: Colors.white),
                                    ),
                              ),
                              SizedBox(width: 12),
                              Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                    Text('Categories', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('--------'),
                                    ],
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(Icons.more_horiz),
                        ],
                      ),
                    ),
                                    ),
                                    
                                    
                                    SizedBox(height: 15,),
                                    
                                    
                                    
                                    
                                     GestureDetector(
                    onTap: () {
                    /*  // Navigate to categories screen
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => products()));*/
                    },
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Container(
                    padding: EdgeInsets.all(16),
                    color: Colors.orange,
                    child: Icon(Icons.favorite, color: Colors.white),
                                    ),
                              ),
                              SizedBox(width: 12),
                              Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                    Text('Categories', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('--------'),
                                    ],
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(Icons.more_horiz),
                        ],
                      ),
                    ),
                                    ),
                                    
                                    
                                    SizedBox(height: 15,),
                                    
                                    
                                    
                                    
                                     GestureDetector(
                    onTap: () {
                   /*   // Navigate to categories screen
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => orders()));*/
                    },
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Container(
                    padding: EdgeInsets.all(16),
                    color: Colors.orange,
                    child: Icon(Icons.favorite, color: Colors.white),
                                    ),
                              ),
                              SizedBox(width: 12),
                              Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                    Text('Categories', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('--------'),
                                    ],
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(Icons.more_horiz),
                        ],
                      ),
                    ),
                                    ),
                                    
                                    SizedBox(height: 15,),
                                    
                                    
                                    
                                    
                                     GestureDetector(
                    onTap: () {
                     /* // Navigate to categories screen
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => Setting()));*/
                    },
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Container(
                    padding: EdgeInsets.all(16),
                    color: Colors.orange,
                    child: Icon(Icons.favorite, color: Colors.white),
                                    ),
                              ),
                              SizedBox(width: 12),
                              Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                    Text('Categories', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('--------'),
                                    ],
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(Icons.more_horiz),
                        ],
                      ),
                    ),
                                    )
                                    
                                    
                        ],
                                    
                        // list view
                        
                      ),
                    ),
                  ),
                  
                ),
              ),
            ),
          ],
        ))
    );

  }
}
