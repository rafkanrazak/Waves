import 'package:flutter/material.dart';

class yachtdt extends StatefulWidget {
  const yachtdt({super.key});

  @override
  State<yachtdt> createState() => _yachtdtState();
}

class _yachtdtState extends State<yachtdt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Luxury',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  // Row(
                  //   children: [Icon(Icons.directions_boat), Text('134 ft')],
                  // ),
                  // SizedBox(
                  //   width: 35,
                  // ),
                  Row(
                    children: [Icon(Icons.speed), Text('15.5 km')],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset('assets/images/luxury.png'),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [Text('Price'), Text('\$ 2000/Day')],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Column(
                    children: [Icon(Icons.cabin), Text('6 cabins')],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [Icon(Icons.people), Text('8 guests')],
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Proceed'),
                    style: ElevatedButton.styleFrom(onPrimary: Colors.black26),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
