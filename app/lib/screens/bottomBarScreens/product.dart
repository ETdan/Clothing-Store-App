import 'package:app/screens/bottomBarScreens/Home.dart';
import 'package:app/screens/otherScreens/pro.dart';
import 'package:app/screens/otherScreens/showdetails.dart';
import 'package:app/utils/collections.dart';
import 'package:app/utils/textfield.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  
   TextEditingController _ProductController = TextEditingController();
 final images = [
    'assets/im1.jpg',
    'assets/im2.jpg',
    'assets/im3.jpg',
    'assets/prof.jpg',
    'assets/im1.jpg',
    'assets/im2.jpg',
    'assets/im3.jpg',
    'assets/prof.jpg',
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:  SingleChildScrollView(
        
          child: Column(
            
            children: [
               SizedBox(height: 30,),
              Row(
               
                children: [
                 
                

                  IconButton(
                    onPressed: (){}, icon: Icon(Icons.arrow_back, ), style: ButtonStyle(iconSize:MaterialStatePropertyAll(30)),),

                    const SizedBox(width: 160),

                    Text("Products",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize:20 ),)

                ],
              ),

              SizedBox(height: 10),
                
              Padding(
                padding: EdgeInsets.all( 16),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 20,
                    children: List.generate(8, (index) {
                      return Container(
                        height: 100,
                        width: 100,
                    
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 150,
                                  width: 200,
                                   
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'images[index]',
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 170,
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.favorite_border_outlined,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'watch',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      Text(
                                        '\$12',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ClipOval(
                                    clipBehavior: Clip.antiAlias,
                                    child: Material(
                                      color: Color.fromARGB(214, 117, 73, 220),
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Center(
                                          child: Icon(
                                            Icons.add,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}