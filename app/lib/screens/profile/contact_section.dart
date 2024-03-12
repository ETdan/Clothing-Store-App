import 'package:flutter/material.dart';
class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              Text('Contact Us', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                 children: [
                   Card(
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 16,
                              right: 16,
                            ),
                            width: 300,
                            height: 300,
                            child:  Column(
                              children: [
                                SizedBox(height: 15),
                                Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
                        CircleAvatar(
                          radius: 50,
                        
                        ),
                      ]),
                      SizedBox(height: 15),
                      Text('Talk to us',
                      style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 18,
                      ),
                      ),

                      SizedBox(height: 5,),
                      Text('We\'ll help you find the right products\n               and pricing for you,')
                              ],
                            ),
                          ),
                        ),
                 ],
               ),

               SizedBox(height: 20),
              
            GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ContactSection()),
    );
  },
  child: ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ContactSection()),
      );
    },
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 30),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
       fixedSize: Size(250, 40),
    ),
    child: Row(
      children: [
        Icon(Icons.phone),
        SizedBox(width: 7),
        Text('Call'),
        Spacer(),
        Icon(Icons.arrow_forward_ios),
      ],
    ),
  ),
),

SizedBox(height: 5),
 GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ContactSection()),
    );
  },
  child: ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ContactSection()),
      );
    },
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 30),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
       fixedSize: Size(250, 40),
    ),
    child: Row(
      children: [
        Icon(Icons.telegram),
        SizedBox(width: 7),
        Text('Telegram'),
        Spacer(),
        Icon(Icons.arrow_forward_ios),
      ],
    ),
  ),
),



SizedBox(height: 5),
 GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ContactSection()),
    );
  },
  child: ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ContactSection()),
      );
    },
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 30),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
       fixedSize: Size(250, 40),
    ),
    child: Row(
      children: [
        Icon(Icons.facebook),
        SizedBox(width: 7),
        Text('Facebok'),
        Spacer(),
        Icon(Icons.arrow_forward_ios),
      ],
    ),
  ),
),

SizedBox(height: 5),

 GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ContactSection()),
    );
  },
  child: ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ContactSection()),
      );
    },
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 30),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
       fixedSize: Size(250, 40),
    ),
    child: Row(
      children: [
        Icon(Icons.phone),
        SizedBox(width: 7),
        Text('Call'),
        Spacer(),
        Icon(Icons.arrow_forward_ios),
      ],
    ),
  ),
),


SizedBox(height: 5),

 GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ContactSection()),
    );
  },
  child: ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ContactSection()),
      );
    },
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 30),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
       fixedSize: Size(250, 40),
    ),
    child: Row(
      children: [
        Icon(Icons.mail),
        SizedBox(width: 7),
        Text('Email'),
        Spacer(),
        Icon(Icons.arrow_forward_ios),
      ],
    ),
  ),
),

SizedBox(
  height: 10,
),

 GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ContactSection()),
    );
  },
  child: ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ContactSection()),
      );
    },
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 30),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
       fixedSize: Size(350, 100),
    ),
    child: Row(
      children: [
        Icon(Icons.web),
        SizedBox(width: 7),
        Text('Visit our website\n\n'),
        Text('About US ?'),
        Spacer(),
        Icon(Icons.arrow_forward_ios),
      ],
    ),

    
  ),
),


            ]
          )
        )
        )
    );

    
  }
}

  