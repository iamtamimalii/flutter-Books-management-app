import 'package:books_management_system/datadisplay.dart';
import 'package:books_management_system/dataenter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Books Management System"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text("Books Management System",
                  style: TextStyle(fontSize: 21)),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const DataEnter()));
                },
                child: const Text("Enter Books Data"),


              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DataDisplay()));
                },
                child: const Text("Display Books Data"),
              ),
            ],
          ),
        )
      ),
    );
  }
}
