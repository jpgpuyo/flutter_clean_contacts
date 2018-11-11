import 'package:flutter/material.dart';
import 'package:flutter_clean_contacts/core/injection/Injector.dart';
import 'package:flutter_clean_contacts/ui/contactlist/contact_list_screen.dart';

void main() {
  Injector.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Clean Contacts',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ContactListScreen(),
    );
  }
}
