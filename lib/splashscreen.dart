import 'package:flutter/material.dart';
import 'package:yatch_booking/homepage2.dart';
import 'package:yatch_booking/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }

  Future<void> navigateToNextScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');

    // Delay the navigation for a certain duration (e.g., 2 seconds)
    await Future.delayed(Duration(seconds: 3));

    if (email != null && email.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => homeyt2()),
      ); // Navigate to home page
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => login_nha()),
      ); // Navigate to login page
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // child: Column(
        //   children: [
        //     Image.network(
        //         "https://www.chubb.com/content/dam/chubb-sites/chubb/global/images/things/speed-boat-1280x528.jpg/jcr:content/renditions/cq5dam.web.1280.1280.jpeg")
        //   ],
        // ),

        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/back.jpeg'),
                fit: BoxFit.fill)),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.only(bottom: 250),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 2),
                child: Text(
                  'Rent ',
                  style: TextStyle(fontFamily: 'gilroyheavy', fontSize: 39),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60),
                child: Text(
                  'Yacht ',
                  style: TextStyle(fontFamily: 'gilroyheavy', fontSize: 39),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 120),
                child: Text(
                  'Easily ',
                  style: TextStyle(fontFamily: 'gilroyheavy', fontSize: 39),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
