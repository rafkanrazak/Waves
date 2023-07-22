// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:yatch_booking/adminpage.dart';
import '../main.dart';

class addyacht extends StatefulWidget {
  const addyacht({super.key});

  @override
  State<addyacht> createState() => _addyachtState();
}

class _addyachtState extends State<addyacht> {
  String? _selectedOption;

  // States
  List<String> _dropdownOptions = ['Luxury', 'Super Yacht', 'Budget Friendly'];
  File? _selectedImage;
  bool _isChecked = false;
  // String f_wifi = '';
  String imgurl = '';

  var formkey = GlobalKey<FormState>();
  var cabin = TextEditingController();
  var contact = TextEditingController();
  var guest = TextEditingController();
  var price = TextEditingController();

  Future<void> upload_img() async {
    final avatarFile = File(_selectedImage!.path);
    String path = await supabase.storage.from('yacht').upload(
          _selectedImage!.path,
          avatarFile,
          fileOptions: FileOptions(cacheControl: '3600', upsert: false),
        );
    final String publicUrl =
        supabase.storage.from('yacht').getPublicUrl(_selectedImage!.path);
    print('url is: $publicUrl');
    setState(() {
      imgurl = publicUrl.toString();
    });
    print('Got Url:$imgurl');
  }

  Future<void> inserttotable() async {
    await supabase.from('yachtdetails').insert({
      'price': price.text,
      'yacht_type': _selectedOption.toString(),
      'guest': guest.text,
      'cabin': cabin.text,
      'image': imgurl,
      'contact': contact.text,
    });
  }

  Future<void> _pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/yatch1.jpg'))),
          child: Center(
            child: Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromARGB(196, 228, 231, 238)),
                    width: 350,
                    height: 700,
                    child: Form(
                      key: formkey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Add Yacht',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Color.fromARGB(255, 37, 79, 133),
                                  fontSize: 32),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: SizedBox(
                              width: 300,
                              height: 50,
                              child: DropdownButtonFormField<String>(
                                value: _selectedOption,
                                items: _dropdownOptions.map((String option) {
                                  return DropdownMenuItem<String>(
                                    value: option,
                                    child: Text(option),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedOption = newValue;
                                  });
                                },
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 10.0),
                                  labelText: 'Yacht Type',
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: SizedBox(
                                width: 300,
                                height: 50,
                                child: TextFormField(
                                  controller: guest,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      filled: true,
                                      hintText: 'Guest',
                                      hintStyle: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                      fillColor:
                                          Color.fromARGB(78, 39, 113, 231)),
                                )),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: SizedBox(
                                width: 300,
                                height: 50,
                                child: TextFormField(
                                  controller: cabin,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      filled: true,
                                      hintText: 'Cabin',
                                      hintStyle: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                      fillColor:
                                          Color.fromARGB(78, 39, 113, 231)),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: SizedBox(
                                width: 300,
                                height: 50,
                                child: TextFormField(
                                  controller: price,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      filled: true,
                                      hintText: 'Price',
                                      hintStyle: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                      fillColor:
                                          Color.fromARGB(78, 39, 113, 231)),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: SizedBox(
                                width: 300,
                                height: 50,
                                child: TextFormField(
                                  controller: contact,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      filled: true,
                                      hintText: 'Contact',
                                      hintStyle: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                      fillColor:
                                          Color.fromARGB(78, 39, 113, 231)),
                                )),
                          ),
                  

                          GestureDetector(
                            onTap: () {
                              _pickImage();
                            },
                            child: SizedBox(
                                width: 250,
                                height: 30,
                                child: ListTile(
                                  title: Text('Upload Image'),
                                  leading: Icon(Icons.photo_library),
                                )),
                          ),
                          // Upload Now
                          ElevatedButton(
                              onPressed: () {
                                upload_img();
                              },
                              child: Text('Upload')),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: SizedBox(
                              width: 300,
                              height: 50,
                              child: ElevatedButton(
                                  onPressed: () async {
                                    final valid =
                                        formkey.currentState!.validate();
                                    if (valid) {
                                      inserttotable();

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            backgroundColor: Colors.greenAccent,
                                            content: Text('Added Succesfully')),
                                      );
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const admin_pg()),
                                      );
                                    }
                                  },
                                  child: Text('Submit',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20))),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
