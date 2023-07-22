import 'package:flutter/material.dart';
import 'package:yatch_booking/add_yacht.dart';
import 'package:yatch_booking/adminpage.dart';
import 'package:yatch_booking/homepage2.dart';
import 'package:yatch_booking/login.dart';
import 'package:yatch_booking/payment_pg2.dart';
import 'package:yatch_booking/paymentpage.dart';
import 'package:yatch_booking/signup.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yatch_booking/splashscreen.dart';
import 'package:yatch_booking/yachtdetails.dart';

final supabase = Supabase.instance.client;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://riuiplrhthjgmzwcvlmv.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJpdWlwbHJodGhqZ216d2N2bG12Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODg3MTM0NzIsImV4cCI6MjAwNDI4OTQ3Mn0.Jd2P2W4-qcO84XYcoD3-PZ62co_LUWZBTrTCgg9WCx4',
  );

  runApp(MaterialApp(
    theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(primary: Colors.greenAccent))),
    debugShowCheckedModeBanner: false,
    home: splashscreen(),
  ));
}
