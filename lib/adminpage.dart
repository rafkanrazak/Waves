import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yatch_booking/add_yacht.dart';

import 'admin_manage.dart';
import 'main.dart';

class admin_pg extends StatefulWidget {
  const admin_pg({super.key});

  @override
  State<admin_pg> createState() => _admin_pgState();
}

class _admin_pgState extends State<admin_pg> {
  dynamic getcount = '';

  @override
  void initState() {
    super.initState();
    get_pgcount();
  }

  get_pgcount() async {
    final res = await supabase.from('yachtdetails').select(
          'yacht_type',
          const FetchOptions(
            count: CountOption.exact,
          ),
        );

    final count = res.count;
    setState(() {
      getcount = count;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Admin Home',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 253, 253, 253),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            Center(
              child: Text(
                'Actions',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const addyacht()),
                      );
                    },
                    child: Text(
                      'Add New Yacht',
                      style: TextStyle(fontSize: 20),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const admin_pg_manage()),
                      );
                    },
                    child: Text(
                      'Manage',
                      style: TextStyle(fontSize: 20),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
