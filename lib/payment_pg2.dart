import 'package:flutter/material.dart';


class pay_submit extends StatefulWidget {
  const pay_submit({super.key});

  @override
  State<pay_submit> createState() => _pay_submitState();
}

class _pay_submitState extends State<pay_submit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Proceed to payment'),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 39, 114, 231),
          ),
        ),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/images/qr.jpeg')),
            TextButton(onPressed:(){},
             child: Text( 'Submit',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            ),
          ],
        ),
      ),
    );
  }
}
