import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class summery extends StatefulWidget {
  const summery({super.key});

  @override
  State<summery> createState() => _summeryState();
}

class _summeryState extends State<summery> {
  List<Map<String, dynamic>> userdata = [];
  var count = 0;
  var price = 0;

  @override
  Future<List<Map<String, dynamic>>> getDataFromFirestore() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    List<Map<String, dynamic>> dataList = [];

    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('cart')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('cart')
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        for (DocumentSnapshot document in querySnapshot.docs) {
          Map<String, dynamic> data = document.data() as Map<String, dynamic>;
          dataList.add(data);
        }
      } else {
        print('No documents found in the collection.');
      }
    } catch (e) {
      print('Error retrieving data from Firestore: $e');
    }

    return dataList;
  }

  Future<void> fetchDataFromFirestore() async {
    List<Map<String, dynamic>> dataList = await getDataFromFirestore();
    setState(() {
      price = 0;
      count = 0;
    });
    // Use the dataList variable to access the retrieved data
    for (var data in dataList) {
      int prico = int.parse(data["price"]);
      setState(() {
        price += prico;
        count += 1;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchDataFromFirestore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Order summary',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 15,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Items',
              ),
              Text('${count}'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Subtotal',
              ),
              Text(
                '\$${price}',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Discount',
              ),
              Text(
                '\$5',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Delivery Charges',
              ),
              Text(
                '\$2',
              ),
            ],
          ),
          Divider(
            thickness: 1,
            height: 4,
            color: Colors.black54,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ' Total',
              ),
              Text(
                '\$${price + 2 - 5}',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
