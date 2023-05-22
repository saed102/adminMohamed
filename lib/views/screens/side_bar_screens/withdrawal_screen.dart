


import 'package:flutter/material.dart';

class WithdrawalScreen extends StatelessWidget {
  static const String routeName = '\WithdrawalScreen';


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
                'Withdrawal',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                ),
              ),
            ),

            Row(children: [
              _rowHeader('Name', 1),
              _rowHeader('Amount', 3),
              _rowHeader('Bank Name', 2),
              _rowHeader('Bank Account', 2),
              _rowHeader('Email', 1),
              _rowHeader('Phone', 1),
            ],)
          ],
        ),
      ) ;
  }
}