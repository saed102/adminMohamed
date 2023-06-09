

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({super.key});

  Widget vendorData( int? flex, Widget widget){
    return Expanded(
      flex: flex!,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey)
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: widget,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _vendorsStream =
    FirebaseFirestore.instance.collection('orders').snapshots();
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    return StreamBuilder<QuerySnapshot>(
      stream: _vendorsStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }


        return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final vendorUserData = snapshot.data!.docs[index];
              return Container(
                  child: Row(
                    children: [
                      vendorData(
                        2,
                        Text(
                          vendorUserData['fullName'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      vendorData(
                        1,
                        Text(
                          vendorUserData['phone'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      vendorData(
                        3,
                        Text(vendorUserData['address']??"",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      vendorData(
                        2,
                        Text(vendorUserData['productPrice'].toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                  vendorData( 1,
                      Text(vendorUserData['quantity'].toString(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      vendorData(
                          1,
                          vendorUserData['accepted'] == false
                              ? ElevatedButton(

                              onPressed: ()async{
                                await _firestore
                                    .collection('orders').
                                doc(vendorUserData['orderId'])
                                    .update({
                                  'accepted': true,
                                });
                              }, child: Text('accepted'))
                              : ElevatedButton(
                              onPressed: ()async{
                                await _firestore
                                    .collection('orders').
                                doc(vendorUserData['orderId'])
                                    .update({
                                  'accepted': false,
                                });
                              }, child: Text('Reject'))),


                    ],
                  ));
            });
      },
    );

  }
}