import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class DataDisplay extends StatefulWidget {
  const DataDisplay({Key? key}) : super(key: key);

  @override
  State<DataDisplay> createState() => _DataDisplayState();
}

class _DataDisplayState extends State<DataDisplay> {
  Query dbRef = FirebaseDatabase.instance.ref().child('Books');
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('Books');

  Widget listItem({required Map book}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      height: 110,
      color: Colors.blue,
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                book['Book Title'],
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                book['Book IBN'],
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                book['Book Author'],
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                book['Book Pages'],
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                book['Book Price'],
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Books data'),
          ),
          body: Container(
            height: double.infinity,
            child: FirebaseAnimatedList(
              query: dbRef,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                Map book = snapshot.value as Map;
                book['key'] = snapshot.key;

                return listItem(book: book);
              },
            ),
          )),
    );
  }
}
// book name
//     auth name
//     book number
//     book pages
//     book year
