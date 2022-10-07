import 'package:cloud_firestore/cloud_firestore.dart';

class UserGallery {
  final String? username;
  final String? tel;
  final String? email;
  final String? country;
  final String? img;

  UserGallery({this.username, this.tel, this.email, this.country, this.img});

  factory UserGallery.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserGallery(
      username: snapshot['username'],
      tel: snapshot['tel'],
      email: snapshot['email'],
      country: snapshot['country'],
      img: snapshot['img'],
    );
  }

  // Map<String, dynamic> toJson() => {
  //       'username': username,
  //       'tel': tel,
  //       'email': email,
  //       'country': country,
  //       'img': img,
  //     };
}
