import '/screens/bottomBarScreens/Home.dart';
import '/screens/login.dart';
import '/utils/collections.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class welcome extends StatefulWidget {
  welcome({super.key});

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  int active_index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: CarouselSlider.builder(
              itemCount: 3,
              itemBuilder: (context, index, realIndex) {
                return Sbuilder(
                  index: index,
                );
              },
              options: CarouselOptions(
                enlargeCenterPage: true,
                viewportFraction: 1.0,
                autoPlayAnimationDuration: Duration(microseconds: 50),
                autoPlay: true,
                aspectRatio: 130 / 120,
                onPageChanged: (index, reason) {
                  setState(() {
                    active_index = index;
                  });
                },
              ),
            ),
          ),
          indicator(
            index: active_index,
          ),
          const Text(
            'Welcome to Our Shop !',
            style: TextStyle(
              fontSize: 30,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
         const SizedBox(
            height: 30,
          ),
          MaterialButton(
            height: 60,
            minWidth: 400,
            color:const  Color.fromARGB(255, 128, 140, 220),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const signin(),
                ),
              );
            },
            child: const SizedBox(
              width: 400,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios_outlined)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Sbuilder extends StatelessWidget {
  final int index;
  const Sbuilder({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          collection().welcomeim[index],
        ),
        fit: BoxFit.fill,
      )),
    );
  }
}
