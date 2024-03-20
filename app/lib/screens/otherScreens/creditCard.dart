import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';
import 'package:shega_cloth_store_app/utils/snackBar.dart';

class credit_card extends StatefulWidget {
  credit_card({super.key});

  @override
  State<credit_card> createState() => _credit_cardState();
}

class _credit_cardState extends State<credit_card> {
  TextEditingController cardNumber = TextEditingController();

  TextEditingController cardpassword = TextEditingController();

  TextEditingController name = TextEditingController();

  TextEditingController day = TextEditingController();
  String cardnumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String Cvv = '';
  bool IsCvvFocus = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: Center(
          child: Text(
            'Credit Card Payment',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                CreditCardWidget(
                  cardNumber: cardnumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: Cvv,
                  showBackView: IsCvvFocus,
                  onCreditCardWidgetChange: (CreditCardBrand brand) {},
                  bankName: 'Name of the Bank',
                  cardBgColor: Colors.black87,
                  glassmorphismConfig: Glassmorphism.defaultConfig(),
                  enableFloatingCard: true,
                  floatingConfig: FloatingConfig(
                    isGlareEnabled: true,
                    isShadowEnabled: true,
                    shadowConfig: FloatingShadowConfig(),
                  ),
                  backgroundNetworkImage:
                      'data:image/jpeg;base64,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',
                  labelValidThru: 'VALID\nTHRU',
                  obscureCardNumber: true,
                  obscureInitialCardNumber: false,
                  obscureCardCvv: true,
                  labelCardHolder: 'CARD HOLDER',
                  cardType: CardType.mastercard,
                  isHolderNameVisible: true,
                  height: 175,
                  textStyle: TextStyle(color: Colors.yellowAccent),
                  width: MediaQuery.of(context).size.width,
                  isChipVisible: true,
                  isSwipeGestureEnabled: true,
                  animationDuration: Duration(milliseconds: 1000),
                  frontCardBorder: Border.all(color: Colors.grey),
                  backCardBorder: Border.all(color: Colors.grey),
                  chipColor: Colors.red,
                  padding: 16,
                  customCardTypeIcons: <CustomCardTypeIcon>[
                    CustomCardTypeIcon(
                      cardType: CardType.mastercard,
                      cardImage: Image.asset(
                        'assets/masterycard.png',
                        height: 48,
                        width: 48,
                      ),
                    ),
                  ],
                ),
                CreditCardForm(
                  formKey: _formKey, // Required
                  cardNumber: cardnumber, // Required
                  expiryDate: expiryDate, // Required
                  cardHolderName: cardHolderName, // Required
                  cvvCode: Cvv, // Required

                  onCreditCardModelChange: onCreditCardChange,
                  obscureCvv: true,
                  obscureNumber: true,
                  isHolderNameVisible: true,
                  isCardNumberVisible: true,
                  isExpiryDateVisible: true,
                  enableCvv: true,
                  cvvValidationMessage: 'Please input a valid CVV',
                  dateValidationMessage: 'Please input a valid date',
                  numberValidationMessage: 'Please input a valid number',
                  cardNumberValidator: (String? cardNumber) {},
                  expiryDateValidator: (String? expiryDate) {},
                  cvvValidator: (String? cvv) {},
                  cardHolderValidator: (String? cardHolderName) {},
                  onFormComplete: () {
                    // callback to execute at the end of filling card data
                  },
                  autovalidateMode: AutovalidateMode.always,
                  disableCardNumberAutoFillHints: false,
                  inputConfiguration: const InputConfiguration(
                    cardNumberDecoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Number',
                      hintText: 'XXXX XXXX XXXX XXXX',
                    ),
                    expiryDateDecoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Expired Date',
                      hintText: 'XX/XX',
                    ),
                    cvvCodeDecoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'CVV',
                      hintText: 'XXX',
                    ),
                    cardHolderDecoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Card Holder',
                    ),
                    cardNumberTextStyle: TextStyle(
                      fontSize: 10,
                      color: Colors.black,
                    ),
                    cardHolderTextStyle: TextStyle(
                      fontSize: 10,
                      color: Colors.black,
                    ),
                    expiryDateTextStyle: TextStyle(
                      fontSize: 10,
                      color: Colors.black,
                    ),
                    cvvCodeTextStyle: TextStyle(
                      fontSize: 10,
                      color: Colors.black,
                    ),
                  ),
                ),
                MaterialButton(
                  height: 50,
                  minWidth: 300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Color.fromARGB(255, 126, 118, 165),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showSnack(
                          'The Transaction Is Successfull.ThankYou For Choosing Us! We Are On The Way.',
                          context);
                    } else {
                      showSnack(
                          'Please Enter The Correct Information', context);
                    }
                  },
                  child: Text(
                    'Add Card',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void onCreditCardChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardnumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      Cvv = creditCardModel.cvvCode;
      IsCvvFocus = creditCardModel.isCvvFocused;
    });
  }
}














// Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 controller: cardNumber,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   fillColor: Colors.grey[200],
//                   prefixIcon: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Icon(
//                       Icons.payment_outlined,
//                     ),
//                   ),
//                   hintText: 'Card Number',
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 controller: name,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   fillColor: Colors.grey[200],
//                   prefixIcon: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Icon(
//                       Icons.person_2_outlined,
//                     ),
//                   ),
//                   hintText: 'Full Name',
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 SizedBox(
//                   width: 150,
//                   child: TextField(
//                     controller: day,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Colors.white,
//                         ),
//                       ),
//                       fillColor: Colors.grey,
//                       prefixIcon: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Icon(
//                           Icons.calendar_month_outlined,
//                         ),
//                       ),
//                       hintText: 'MM/YY',
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 150,
//                   child: TextField(
//                     controller: cardpassword,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(
//                           color: Colors.grey,
//                         ),
//                       ),
//                       fillColor: Colors.grey[200],
//                       prefixIcon: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Icon(
//                           Icons.password_sharp,
//                         ),
//                       ),
//                       hintText: 'CVV',
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             MaterialButton(
//               height: 50,
//               minWidth: 300,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               color: Color.fromARGB(255, 126, 118, 165),
//               onPressed: () {},
//               child: Text(
//                 'Add Card',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
