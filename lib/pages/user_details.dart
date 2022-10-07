import 'package:flutter/material.dart';
import 'package:flutter_application_2/data/dataSorce/firestore.dart';
import 'package:flutter_application_2/data/model/gallery.dart';
import 'package:provider/provider.dart';

class UserDetails extends StatelessWidget {
  static const routeName = '/user_details';
  final String img;
  // final String username;
  // final String tel;

  UserDetails(this.img);

  @override
  Widget build(BuildContext context) {
    //final UserImg = ModalRoute.of(context)!.settings.arguments as String;
    // final userData = Provider.of<FirestoreData>(context)
    //     .items
    //     .firstWhere((prod) => prod.img == img);
    return Scaffold(
      appBar: AppBar(
        title: Text('username!'),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              img.toString(),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(img),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: Text('hi'),
          )
        ],
      )),
    );
  }
}
