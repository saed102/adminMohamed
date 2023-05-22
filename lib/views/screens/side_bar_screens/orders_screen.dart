
import 'package:flutter/material.dart';

import 'widgets/orderWidget.dart';

class OrderScreen extends StatelessWidget {
  static const String routeName = '\OrderScreen';
 Widget _rowHeader(String text, int flex){
    return Expanded(
      flex: flex,
      child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade700),
        color: Colors.yellow.shade900,
        ),

        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              ),
              ),
        ),
    ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Order',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                ),
              ),
            ),
            Row(children: [
              _rowHeader('Full Name', 2),
              _rowHeader('Phone', 1),
              _rowHeader('Address', 3),
              _rowHeader('Price', 2),
              _rowHeader('ProductsNum', 1),
              _rowHeader('Action', 1),

            ],),

            OrderWidget(),

          ],
        ),
      ) ;
  }
}