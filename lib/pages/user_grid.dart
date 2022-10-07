import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/data/model/gallery.dart';
import '../data/dataSorce/firestore.dart';
import './user_details.dart';

class UserGrid extends StatelessWidget {
  const UserGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final UserData = Provider.of<UserGallery>(context);

    return SafeArea(
      child: GestureDetector(
        child: StreamBuilder<List<UserGallery>>(
          stream: FirestoreData.read(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text('some error occured'),
              );
            }
            if (snapshot.hasData) {
              List<UserGallery> galleryRecordList = snapshot.data!;
              return GridView.builder(
                //padding: EdgeInsets.all(1),
                itemBuilder: (context, index) {
                  final gridviewGallery = galleryRecordList[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(1, 1, 1, 5),
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.of(context).pushNamed(
                            //     UserDetails.routeName,
                            //     arguments: gridviewGallery.img);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) => UserDetails(
                                  '${gridviewGallery.img}',
                                ),
                              ),
                            );
                          },
                          child: gridviewGallery.img != null
                              ? Image.network(gridviewGallery.img!,
                                  width: 120, height: 150, fit: BoxFit.cover)
                              : Text('no image'),
                        ),
                      ),
                      gridviewGallery.username != null
                          ? Text(
                              gridviewGallery.username!,
                              overflow: TextOverflow.ellipsis,
                            )
                          : Text('no Data'),
                      gridviewGallery.country != null
                          ? Text(
                              gridviewGallery.country!,
                              overflow: TextOverflow.ellipsis,
                            )
                          : Text('No Data'),
                    ],
                  );
                },
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 2 / 4,
                  mainAxisExtent: 210.0,
                ),
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
