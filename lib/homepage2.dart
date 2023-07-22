import 'dart:math';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yatch_booking/login.dart';
import 'package:yatch_booking/paymentpage.dart';
import 'package:yatch_booking/profile_update.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homeyt2 extends StatefulWidget {
  const homeyt2({super.key});

  @override
  State<homeyt2> createState() => _homeyt2State();
}

class _homeyt2State extends State<homeyt2> {
  final _notes =
      Supabase.instance.client.from('yachtdetails').stream(primaryKey: ['id']);
// Clear sharefpref data logout
  Future<void> clearUserDataInSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.remove('email');

    print('User data cleared from shared preferences');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => login_nha()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Yacht Life',style: TextStyle(color: Colors.black),),
            actions: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: () {
                        clearUserDataInSharedPrefs();
                      },
                      icon: Icon(
                        Icons.logout_rounded,
                        color: Color.fromARGB(255, 39, 114, 231),
                      )))
            ],
            backgroundColor: Colors.greenAccent,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => myprof()),
                  );
                },
                child: Image(
                  image: AssetImage('assets/images/pf.png'),
                  height: 8,
                ),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              height: 80,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Yachts For You...",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
                height: 920,
                child: StreamBuilder<List<Map<String, dynamic>>>(
                  stream: _notes,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final notes = snapshot.data!;
                    return MediaQuery.removePadding(
                      removeTop: true,
                      context: context,
                      child: ListView.builder(
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Scaffold(
                                          appBar: AppBar(
                                              backgroundColor:
                                                  Colors.greenAccent,
                                              leading: IconButton(
                                                icon:
                                                    Icon(Icons.arrow_back_ios),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              )),
                                          body: Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    notes[index]['yacht_type'],
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 30),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      15.0),
                                                  child: Row(
                                                    children: [
                                                      // Row(
                                                      //   children: [Icon(Icons.directions_boat), Text('134 ft')],
                                                      // ),
                                                      // SizedBox(
                                                      //   width: 35,
                                                      // ),
                                                      Row(
                                                        children: [
                                                          Icon(Icons.speed),
                                                          Text('15.5 km')
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      20.0),
                                                  child: Image.network(
                                                      notes[index]['image']),
                                                ),
                                                SizedBox(
                                                  height: 50,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      20.0),
                                                  child: Column(
                                                    children: [
                                                      Text('Price'),
                                                      Text('\$ 2000/Day')
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      20.0),
                                                  child: Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Icon(Icons.cabin),
                                                          Text('6 cabins')
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: 30,
                                                      ),
                                                      Column(
                                                        children: [
                                                          Icon(Icons.people),
                                                          Text('8 guests')
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: 60,
                                                      ),
                                                      ElevatedButton(
                                                          onPressed: () {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          payment_pg()),
                                                            );
                                                            // var ph = notes[
                                                            //             index]
                                                            //         ['contact']
                                                            //     .toString();
                                                            // print(ph);
                                                            // var url = Uri.parse(
                                                            //     'tel:${ph}');
                                                            // launchUrl(url);
                                                          },
                                                          child:
                                                              Text('Book Now'),
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                                  onPrimary: Colors
                                                                      .black)),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                                child: Container(
                                  height: 250,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color.fromARGB(67, 0, 0, 0),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Image.network(
                                          notes[index]['image'],
                                          height: 120,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Text(
                                              notes[index]['yacht_type'],
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Text(
                                                notes[index]['price'] +
                                                    '\$ /Day',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    );
                  },
                ))
          ]))
        ],
      ),
    );
  }
}
