// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_options.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../main.dart';

class admin_pg_manage extends StatefulWidget {
  const admin_pg_manage({super.key});

  @override
  State<admin_pg_manage> createState() => _admin_pg_manageState();
}

class _admin_pg_manageState extends State<admin_pg_manage> {
  var pgname = TextEditingController();

  var contact = TextEditingController();
  var rent = TextEditingController();

// fetch pg det
  get_userdet() async {
    final data = await supabase
        .from('pg_det')
        .select('pg_name, rent,contact')
        .eq('id', "data");
    setState(() {
      // u_email.text = user.email.toString();
      // u_name.text = user.userMetadata!["username"];
    });
  }

  var formkey = GlobalKey<FormState>();
  // String value = 'ko';
  dynamic pgdata = '';
  List<dynamic> newVariable = [];
  List<Map<String, String>> item = [];

  search_pg(String value) async {
    var data = await supabase
        .from('yachtdetails')
        .select('*')
        .ilike('yacht_type', '$value%');
    print("DTYPE:${data.runtimeType.toString()}");

    setState(() {
      newVariable = data;
    });

    print("matched yacht:$newVariable");

    print("String:$value");
    // print("matched Pg:$pgdata");
  }

  delete_pg() async {
    await supabase.from('yachtdetails').delete();
  }

  final _notes = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Manage',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 253, 253, 253),
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(30),
                          child: SearchBar(
                            hintText: "Enter yacht name",
                            leading: Icon(Icons.search),
                            onChanged: (value) {
                              search_pg(value);
                            },
                          )),
                    ],
                  ),
                ),
              ),
              Container(
                child: Text(
                  'Search Results',
                ),
              ),
              Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                      itemCount: newVariable.length,
                      itemBuilder: (context, index) {
                        var data = newVariable[index];
                        return Padding(
                          padding: const EdgeInsets.all(20),
                          child: InkWell(
                            onTap: () {
                              showDialog<void>(
                                context: context,
                                barrierDismissible:
                                    true, // user must tap button!
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    // <-- SEE HERE
                                    title: Text(data['yacht_type']),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: <Widget>[],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text('Update'),
                                        onPressed: () async {
                                          // Update Function
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  scrollable: true,
                                                  title:
                                                      Text(data['yacht_type']),
                                                  content: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Form(
                                                      child: Column(
                                                        children: <Widget>[
                                                          TextFormField(
                                                            controller: pgname,
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  'Yacht Type',
                                                              icon: Icon(Icons
                                                                  .account_box),
                                                            ),
                                                          ),
                                                          TextFormField(
                                                            controller: contact,
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  'Contact',
                                                              icon: Icon(
                                                                  Icons.phone),
                                                            ),
                                                          ),
                                                          TextFormField(
                                                            controller: rent,
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  'Price',
                                                              icon: Icon(Icons
                                                                  .payment_rounded),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  actions: [
                                                    ElevatedButton(
                                                        onPressed: () async {
                                                          await supabase
                                                              .from(
                                                                  'yachtdetails')
                                                              .update({
                                                            'pg_name':
                                                                'Middle Earth'
                                                          }).match({
                                                            'name': 'Auckland'
                                                          });
                                                        },
                                                        child: Text('Update'))
                                                  ],
                                                );
                                              });
                                        },
                                      ),
                                      TextButton(
                                        child: const Text('Delete'),
                                        onPressed: () async {
                                          // Delete;
                                          await supabase
                                              .from('yachtdetails')
                                              .delete()
                                              .match({'id': data['id']});
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                                backgroundColor:
                                                    Colors.greenAccent,
                                                content: Text(
                                                    'Deleted Succesfully')),
                                          );
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Container(
                              height: 200,
                              width: 250,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(data['image']))),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 120, left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data['yacht_type'],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.cabin,
                                          size: 30,
                                          color:
                                              Color.fromARGB(255, 39, 114, 231),
                                        ),
                                        Text(
                                          'Cabin'+'${data['cabin']}' ,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        SizedBox(width: 20,),
                                        Icon(
                                          Icons.people,
                                          size: 30,
                                          color:
                                              Color.fromARGB(255, 39, 114, 231),
                                        ),
                                        Text(
                                          'Guest'+'${data['guest']}',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }))
            ],
          ),
        ));
  }
}
