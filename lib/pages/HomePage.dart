import 'package:flutter/material.dart';
import 'package:flutter_application_2/data/dataSorce/firestore.dart';
import 'package:flutter_application_2/data/model/gallery.dart';
import 'package:flutter_application_2/pages/user_grid.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("People's Choice Photo Contest 2022"),
      ),
      body: UserGrid(),
      // body: Padding(
      //   padding: EdgeInsets.all(8),
      //   child: Column(children: [
      //     StreamBuilder<List<UserGallery>>(
      //       stream: FirestoreData.read(),
      //       builder: (context, AsyncSnapshot snapshot) {
      //         if (snapshot.connectionState == ConnectionState.waiting) {
      //           return Center(
      //             child: CircularProgressIndicator(),
      //           );
      //         }
      //         if (snapshot.hasError) {
      //           return Center(
      //             child: Text('some error occured'),
      //           );
      //         }
      //         if (snapshot.hasData) {
      //           final userData = snapshot.data;
      //           return Expanded(
      //             child: ListView.builder(
      //               itemCount: userData!.length,
      //               itemBuilder: (context, index) {
      //                 final singleUser = userData[index];
      //                 return Container(
      //                   margin: EdgeInsets.symmetric(vertical: 5),
      //                   child: ListTile(
      //                     title: Text('${singleUser.username}'),
      //                     subtitle: Text('${singleUser.country}'),
      //                   ),
      //                 );
      //               },
      //             ),
      //           );
      //         }
      //         return Center(
      //           child: CircularProgressIndicator(),
      //         );
      //       },
      //     )
      //   ]),
      // ),
    );
  }
}
