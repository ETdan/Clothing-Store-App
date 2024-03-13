
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
final Map<String, dynamic> userData;

  SettingPage({required this.userData});

  @override
  Widget build(BuildContext context) {
    String name = userData['name'] ?? 'Default Name';
    String email = userData['email'] ?? 'Default Email';
    String avatarUrl = userData['avatarUrl'] ?? 'Default Avatar URL';
  
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(

          child: Column(
            children: [
              SizedBox(height: 60,),
             Row(
  children: [ 
    IconButton(
      onPressed: null , // need to adjust later on
      icon: Icon(Icons.arrow_back),
      style: ButtonStyle(iconSize: MaterialStatePropertyAll(30)),
    ),

    SizedBox(width: 150),

    Text('Settings', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)
  ],
),

Column(
  children: [
    Row(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          
          children:[ Text('Account', style: TextStyle(fontWeight: FontWeight.bold),)])

      ],
    ),
    GestureDetector(
                    onTap: () {
                      /*Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  null),
    );*/
                    },
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 16,
                          right: 16,
                        ),
                        width: 350,
                        height: 60,
                        child:  Row(
                          children: [
                          CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(avatarUrl),
                    ),
                            SizedBox(width: 10),
                    Column(
                      children: [
                        Text(name, style: TextStyle(fontWeight: FontWeight.bold),),
                        Text(
                          email,
                           style: TextStyle(fontSize: 16, color: Colors.grey),
                        )
                      ],
                    ),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ),
                    ),
                    
    ),
    SizedBox(height: 10,),

    Divider(
      thickness: 1,
      color: Colors.grey,
      height: 3, 
    ),

    Text('Setting', style: TextStyle(fontWeight: FontWeight.bold),),


     GestureDetector(
                    onTap: () {
                      /*Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  null),
    );*/
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Card(
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                          ),
                          width: 350,
                          height: 40,
                          child: const Row(
                            children: [
                              Icon(Icons.notifications, color: Colors.black, ),
                              
                              SizedBox(width: 10),
                              Text('Notification', style: TextStyle(fontWeight: FontWeight.bold),),
                              Spacer(),
                              Icon(Icons.arrow_forward_ios)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                    /*  Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SettingPage(userData: {
          'name': 'John Doe',
          'email': 'john.doe@example.com',
          'avatarUrl':
              'https://example.com/avatar.jpg', // Replace with the actual URL
        },)),
                      );*/
                    },
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 16,
                          right: 16,
                        ),
                        width: 350,
                        height: 40,
                        child: const Row(
                          children: [
                            Icon(Icons.language, color: Colors.black,),
                            SizedBox(width: 7),
                            Text('Setting', style: TextStyle(fontWeight: FontWeight.bold)),
                            Spacer(),
                            Text('English'),
                            Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      /*Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  null),
    );*/
                    },
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 16,
                          right: 16,
                        ),
                        width: 350,
                        height: 40,
                        child: const Row(
                          children: [
                            Icon(Icons.gpp_maybe, color: Colors.black,),
                            SizedBox(width: 7),
                            Text('Privacy', style: TextStyle(fontWeight: FontWeight.bold)),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      /*Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  null),
    );*/
                    },
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 16,
                          right: 16,
                        ),
                        width: 350,
                        height: 40,
                        child: const Row(
                          children: [
                            Icon(Icons.help, color: Colors.black,),
                            SizedBox(width: 7),
                            Text('Help Center', style: TextStyle(fontWeight: FontWeight.bold)),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ),
                    ),
                  ),

                   GestureDetector(
                    onTap: () {
                      /*Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  null),
    );*/
                    },
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.only(
                          left: 16,
                          right: 16,
                        ),
                        width: 350,
                        height: 40,
                        child: const Row(
                          children: [
                            Icon(Icons.info, color: Colors.black,),
                            SizedBox(width: 7),
                            Text('About Us', style: TextStyle(fontWeight: FontWeight.bold)),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ),
                    ),
                  ),
  ],
),

            ],
          ),

        )),
    );
  }
}
