import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../model/gallery.dart';

class FirestoreData with ChangeNotifier {
  final CollectionReference<Map<String, dynamic>> _item =
      FirebaseFirestore.instance.collection('people2022_3');

  List<UserGallery> get items {
    return [...items];
  }

  static Stream<List<UserGallery>> read() {
    final galleryCollectiion =
        FirebaseFirestore.instance.collection('people2022_3');

    return galleryCollectiion.snapshots().map(
          (event) =>
              event.docs.map((e) => UserGallery.fromSnapshot(e)).toList(),
        );
  }
}
