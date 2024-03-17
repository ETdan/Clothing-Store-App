import 'package:flutter/material.dart';

class filter extends StatefulWidget {
  const filter({super.key});

  @override
  State<filter> createState() => _filterState();
}

class _filterState extends State<filter> {
  String gender = '';
  String color = '';
  double current_slidder = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffB81736),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color(0xffB81736),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back,
              size: 30,
              color: const Color.fromARGB(137, 255, 255, 255),
            ),
          ),
          title: Center(
            child: Text(
              'Filter',
              style: TextStyle(
                fontSize: 20,
                color: const Color.fromARGB(221, 255, 255, 255),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: SafeArea(
          child:  Container(
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
            child: Padding(
              padding: const EdgeInsets.all( 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Gender',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(221, 255, 255, 255),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                       Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 245, 222, 226),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.all(2),
                            child: TextButton(
                              onPressed: () {
                                
                              },
                              child: Text(
                                'All',
                                style: TextStyle(
                                  color: Color(0xffB81736),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16, 
                                ),
                              ),
                            ),
                          ),
                           Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 245, 222, 226),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.all(2),
                            child: TextButton(
                               onPressed: () {
                          setState(() {
                            gender = 'male';
                            print(gender);
                          });
                        },
                              child: Text(
                                'Men',
                                style: TextStyle(
                                  color: Color(0xffB81736),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16, 
                                ),
                              ),
                            ),
                          ),
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 245, 222, 226),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.all(2),
                            child: TextButton(
                             onPressed: () {
                          setState(() {
                            gender = 'female';
                            print(gender);
                          });
                        },
                              child: Text(
                                'Women',
                                style: TextStyle(
                                  color: Color(0xffB81736),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16, 
                                ),
                              ),
                            ),
                          ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Brand',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(221, 255, 255, 255),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      smallButton(
                        text: 'Adidas',
                      ),
                      smallButton(
                        text: 'Puma',
                      ),
                      smallButton(
                        text: 'CR7',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      smallButton(
                        text: 'Nike',
                      ),
                      smallButton(
                        text: 'Yeezy',
                      ),
                      smallButton(
                        text: 'Supreme',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Price Range',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(221, 255, 255, 255),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$ ${current_slidder}',
                          style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        '\$ 543',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Slider(
                    value: current_slidder,
                    max: 500,
                    //divisions: 5,
                    label: current_slidder.round().toString(),
                    onChanged: (value) {
                      setState(() {
                        current_slidder = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Color',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(221, 255, 255, 255),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      smallButton(
                        text: 'White',
                      ),
                     smallButton(
                        text: 'Black',
                      ),
                      smallButton(
                        text: 'Grey',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      smallButton(
                        text: 'Yellow',
                      ),
                      smallButton(
                        text: 'Red',
                      ),
                      smallButton(
                        text: 'Green',
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    color: Color.fromARGB(255, 239, 207, 207),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Another options',
                            style: TextStyle(color: Color(0xffB81736),),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xffB81736),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: MaterialButton(
                      height: 70,
                      minWidth: 400,
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/search',
                            arguments: {'gender': gender, 'color': color});
                      },
                      color: Color.fromARGB(255, 255, 224, 224),
                      child: Text(
                        'Apply Filter',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xffB81736),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class smallButton extends StatelessWidget {
  final String text;
  const smallButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return
     Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 245, 222, 226),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.all(2),
                            child: TextButton(
                              onPressed: () {
                                
                              },
                              child: Text(
          text,
        
                                style: TextStyle(
                                  color: Color(0xffB81736),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16, 
                                ),
                              ),
                            ),
                          );
     
  }
}
