import 'package:app/utils/textfield.dart';
import 'package:flutter/material.dart';

class editProduct extends StatefulWidget {
  const editProduct({super.key});

  @override
  State<editProduct> createState() => _editProductState();
}

class _editProductState extends State<editProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black87,
          ),
        ),
        title: Center(
          child: Text(
            'Editing Product',
            style: TextStyle(
              color: Colors.black87,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textFields(
            hint: 'Title',
          ),
          textFields(
            hint: 'Price',
          ),
          textFields(
            hint: 'Description',
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Stack(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Text(
                      'you can put Retrived image here',
                    ),
                  ),
                ),
                Positioned(
                  bottom: -3,
                  right: -3,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add_a_photo_outlined,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: MaterialButton(
              color: Color.fromARGB(255, 112, 101, 185),
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              onPressed: () {},
              height: 60,
              minWidth: 300,
              child: Center(
                child: Text(
                  'Update Product',
                  style: TextStyle(color: Colors.black87),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
