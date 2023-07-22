// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:yatch_booking/payment_pg2.dart';

class payment_pg extends StatefulWidget {
  const payment_pg({super.key});

  @override
  State<payment_pg> createState() => _pg2_mainState();
}

class _pg2_mainState extends State<payment_pg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pg2(),
      bottomNavigationBar: Container(
        height: 144,
        child: Padding(
          padding: const EdgeInsets.all(25),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('SUBTOTAL'),
                    Text(
                      '\$ 3500',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.monetization_on_sharp,
                      color: Colors.yellow,
                    ),
                    Text(
                      'You Will Get 1250 Points',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            MediaQuery.removePadding(
              context: context,
              removeBottom: true,
              removeTop: true,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => pay_submit()),
                  );
                },
                child: Text('Pay Now'),
                style: ElevatedButton.styleFrom(
                    onPrimary: Colors.black,
                    minimumSize: Size.fromHeight(50),
                    shape: StadiumBorder()),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class pg2 extends StatefulWidget {
  const pg2({super.key});

  @override
  State<pg2> createState() => _pg2State();
}

class _pg2State extends State<pg2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 247, 247),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
              ),
            ),
            title: Text(
              'Complete Your Payment',
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            // Timeline
            Container(
                width: 150,
                height: 100,
                // color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 15,
                          child: Icon(Icons.check),
                        ),
                        Text('Booking')
                      ],
                    ),
                    Container(
                      width: 100,
                      height: 10,
                      color: Colors.blue,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 15,
                          child: Icon(
                            Icons.circle,
                            color: Colors.white,
                          ),
                        ),
                        Text('Payment')
                      ],
                    ),
                    Container(
                      width: 100,
                      height: 10,
                      color: Color.fromARGB(100, 33, 149, 243),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor:
                              const Color.fromARGB(100, 33, 149, 243),
                          radius: 15,
                          child: Icon(Icons.circle),
                        ),
                        Text('Complete')
                      ],
                    ),
                  ],
                )),

            // Payment Method
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                child: Text(
                  'Payment Method',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(15)),
                child: ListTile(
                  leading: Icon(
                    Icons.payment,
                    color: Colors.blue,
                  ),
                  title: Text(
                    'UPI',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Text(
                    'Change',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                child: Text(
                  'Add Discount',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(15)),
                child: ListTile(
                  leading: Icon(
                    Icons.shopify_sharp,
                    color: Colors.blue,
                  ),
                  title: Text(
                    '50% Off',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Text(
                    'Add',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
            ),
          ]))
        ],
      ),
    );
  }
}
