import 'package:app/utils/textfield.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

int active_index = 0;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final images = [
    'assets/im1.jpg',
    'assets/im2.jpg',
    'assets/im3.jpg',
    'assets/prof.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/prof.jpg'),
                ),
                title: Text(
                  'Hello!',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                subtitle: Text(
                  'John William',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(
                    right: 20,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notification_add_outlined,
                    ),
                  ),
                ),
              ),
              textFields(),
              CarouselSlider.builder(
                itemCount: images.length,
                itemBuilder: (context, index, realIndex) {
                  return BuildImages(imagee: images[index]);
                },
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  viewportFraction: 1.0,
                  autoPlayAnimationDuration: Duration(microseconds: 50),
                  autoPlay: true,
                  reverse: true,
                  height: 200,
                  onPageChanged: (index, reason) {
                    setState(() {
                      active_index = index;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 12,
              ),
              indicator(index: images.length),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Featured',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'see all',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return buildAdvertise(
                      image: images[index],
                      title: 'Watch',
                      price: '12',
                      index: index,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Most Popular',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'see all',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return buildAdvertise(
                      image: images[index],
                      title: 'Watch',
                      price: '12',
                      index: index,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class buildAdvertise extends StatelessWidget {
  final int index;
  final String title;
  final String price;
  final String image;
  const buildAdvertise({
    super.key,
    required this.index,
    required this.price,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        height: 100,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Container(
              height: 90,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(
                    image,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            Text(
              ' ${price}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BuildImages extends StatelessWidget {
  final String imagee;
  const BuildImages({super.key, required this.imagee});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: Image(
        image: AssetImage(imagee),
        fit: BoxFit.fill,
      ),
    );
  }
}

class indicator extends StatelessWidget {
  final int index;
  const indicator({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
        activeIndex: active_index,
        count: index,
        effect: JumpingDotEffect(activeDotColor: Colors.blue));
  }
}
