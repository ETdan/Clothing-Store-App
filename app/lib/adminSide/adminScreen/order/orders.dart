
import 'package:flutter/material.dart';

class orders extends StatelessWidget {
  const orders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Stack(
        children:[ 
          
         Container( 


          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffB81736),
                Color(0xff281537),
              ]
              ),
          ),
            child: Column(
              children: [
                SizedBox(height: 30,),
                 SizedBox(height: 70,),
                Row(
               
                  children: [
                   IconButton(
           onPressed: () {
             Navigator.pop(context);
           },
           icon: Icon(Icons.arrow_back, color: Colors.white,) , iconSize:26 ,
         
         ),
         SizedBox(width: 130,),
         Text('Catagories', style: TextStyle(fontSize: 20,  fontWeight:FontWeight.bold, color: Colors.white),)
         
         
                  ],
                ),
                SizedBox(height: 20),
                Card(
                  child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 10,),
                    Text('0'),
                    Text('gdsc group1'),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.bike_scooter,
                        color: Colors.blueAccent,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: Colors.green,
                      ),
                    ),
                  ],
                          ),
                ),

                 SizedBox(height: 20),
                Card(
                  child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 10,),
                    Text('0'),
                    Text('gdsc group1'),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.bike_scooter,
                        color: Colors.blueAccent,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: Colors.green,
                      ),
                    ),
                  ],
                          ),
                ),

                 SizedBox(height: 20),
                Card(
                  child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 10,),
                    Text('0'),
                    Text('gdsc group1'),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.bike_scooter,
                        color: Colors.blueAccent,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: Colors.green,
                      ),
                    ),
                  ],
                          ),
                ),
              ],
            ),
          ),
        ]
      ),
    );
  }
}
