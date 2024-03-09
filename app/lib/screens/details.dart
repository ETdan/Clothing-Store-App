import 'package:app/model/Item/item.dart';
import 'package:app/utils/widgets.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required this.item});

  final Item item;
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          CircleAvatar(
            child: InkWell(
              onTap: () {},
              child: const Icon(Icons.favorite),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: screenHeight * 0.4,
              width: screenWidth,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(widget.item.imagePath))),
            ),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.06),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    styledText(
                        title: widget.item.name,
                        color: Colors.black,
                        size: 25,
                        isBold: true),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        styledText(
                            title: '\$${widget.item.price}',
                            color: Theme.of(context).primaryColor,
                            size: 16,
                            isBold: false),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.orange,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        styledText(
                            title: '\$${widget.item.rating}',
                            color: Colors.black,
                            size: 16,
                            isBold: true),
                        const SizedBox(
                          width: 10,
                        ),
                        styledText(
                            title: '(${widget.item.review} Review)',
                            color: Colors.grey,
                            size: 16,
                            isBold: false),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    styledText(
                        title: 'Description',
                        color: Colors.black,
                        size: 20,
                        isBold: true),
                    const SizedBox(
                      height: 10,
                    ),
                    styledText(
                        title: widget.item.description,
                        color: Colors.grey,
                        size: 16,
                        isBold: false),
                    const SizedBox(
                      height: 10,
                    ),
                    styledText(
                        title: 'Size',
                        color: Colors.black,
                        size: 20,
                        isBold: true),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.item.sizes.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(5),
                            child: Container(
                              width: 50,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 2,
                                      color: Colors.grey,
                                      spreadRadius: 0,
                                      offset: Offset(1, 1))
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                              child: Center(
                                child: Text(
                                  widget.item.sizes[index].toString(),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        styledButton(
                            name: 'Buy Now',
                            width: screenWidth * 0.6,
                            color: Theme.of(context).primaryColor),
                        SizedBox(
                          width: screenWidth * 0.17,
                        ),
                        const Icon(
                          Icons.shop,
                          color: Colors.grey,
                        )
                      ],
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
