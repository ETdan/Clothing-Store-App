import 'package:flutter/material.dart';

class showDetails extends StatelessWidget {
  final int indexs;
  final price;
  final title;
  final images;
  final discription;
  const showDetails({
    super.key,
    required this.indexs,
    required this.title,
    required this.price,
    required this.images,
    required this.discription,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(images),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipOval(
                      child: Material(
                        color: Colors.grey,
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(
                            Icons.arrow_back,
                          ),
                        ),
                      ),
                    ),
                    ClipOval(
                      child: Material(
                        color: Colors.grey,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 5),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star_border_outlined,
                          size: 30,
                          color: Colors.yellow,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '4.5 ( 20 reviews ) ',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  right: 20,
                ),
                child: Text(
                  '\$ ${price}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.purple[200],
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Description',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.purple[200],
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              discription,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 20, bottom: 20),
            child: Text(
              'Size',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              children: [
                MaterialButton(
                  shape: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black54,
                    ),
                  ),
                  onPressed: () {},
                  height: 50,
                  minWidth: 50,
                  child: Text(
                    '8',
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                MaterialButton(
                  shape: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black54,
                    ),
                  ),
                  onPressed: () {},
                  height: 50,
                  minWidth: 50,
                  child: Text(
                    '10',
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                MaterialButton(
                  shape: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black54,
                    ),
                  ),
                  onPressed: () {},
                  height: 50,
                  minWidth: 50,
                  child: Text(
                    '38',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                height: 50,
                minWidth: 300,
                color: const Color.fromARGB(255, 200, 104, 187),
                shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                onPressed: () {},
                child: Center(
                  child: Text(
                    'Buy Now',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: MaterialButton(
                  height: 50,
                  minWidth: 50,
                  color: Colors.grey[100],
                  onPressed: () {},
                  child: Center(
                    child: Icon(
                      Icons.shopping_bag_rounded,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
