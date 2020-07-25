import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pothole/Screens/StatusAllScreen/services/DatabaseStatus.dart';

class StatusList extends StatefulWidget {
  @override
  _StatusListState createState() => _StatusListState();
}

class _StatusListState extends State<StatusList> {
  @override
  void initState() {
    getStatusList().then((res) {
      setState(() {
        querySnapshot = res;
      });
    });
    super.initState();
  }

  QuerySnapshot querySnapshot;
  @override
  Widget build(BuildContext context) {
    if (querySnapshot != null) {
      return ListView.builder(
        primary: false,
        itemCount: querySnapshot.documents.length,
        padding: EdgeInsets.all(12),
        itemBuilder: (context, i) {
          String lat = querySnapshot
              .documents[i].data['position']['geopoint'].latitude
              .toString();
          String lon = querySnapshot
              .documents[i].data['position']['geopoint'].longitude
              .toString();
          String downloadurl = querySnapshot.documents[i].data['imageurl'];
          return Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0),
            child: Column(
              children: <Widget>[
                ExpansionTileCard(
                  baseColor: Colors.amberAccent,
                  leading: Builder(builder: (context) {
                    if (querySnapshot.documents[i].data['work'] == false) {
                      return CircleAvatar(
                          backgroundColor: Colors.red, radius: 20);
                    } else {
                      return CircleAvatar(
                          backgroundColor: Colors.greenAccent, radius: 20);
                    }
                  }),
                  title: Text(
                      "Type :${querySnapshot.documents[i].data['potholetype']}"),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("${querySnapshot.documents[i].data['department']}"),
                    ],
                  ),
                  children: <Widget>[
                    Divider(
                      thickness: 1.0,
                      height: 1.0,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "Comment :${querySnapshot.documents[i].data['comment']}"),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                  "Address :${querySnapshot.documents[i].data['address']}"),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                  "Landmark :${querySnapshot.documents[i].data['landmark']}"),
                              SizedBox(
                                height: 5.0,
                              ),
                              // Text(
                              //     "Landmark :${querySnapshot.documents[i].data['position']['geopoint'].latitude.runtimeType}"),
                            ],
                          )),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceAround,
                      buttonHeight: 52.0,
                      buttonMinWidth: 90.0,
                      children: <Widget>[
                        FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0)),
                          onPressed: () {
                            navigateme(lat, lon);
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.navigate_before),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2.0),
                              ),
                              Text('Navigate me'),
                            ],
                          ),
                        ),
                        FlatButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0)),
                          onPressed: () {
                            seepothole(downloadurl);
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.open_in_browser),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2.0),
                              ),
                              Text('See Pothole'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitCubeGrid(
              color: Colors.amber,
              size: 80.0,
            ),
            SizedBox(height: 20.0),
            Text(
              'Loading...',
              style: TextStyle(color: Colors.amber),
            ),
          ],
        ),
      );
    }
  }
}
