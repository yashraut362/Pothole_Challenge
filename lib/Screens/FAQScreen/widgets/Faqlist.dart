import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/DatabaseFaq.dart';
import 'package:flutter/material.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

class Faqlist extends StatefulWidget {
  @override
  _FaqlistState createState() => _FaqlistState();
}

class _FaqlistState extends State<Faqlist> {
  @override
  void initState() {
    super.initState();
    getFaqList().then((results) {
      setState(() {
        querySnapshot = results;
      });
    });
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
          return Column(
            children: <Widget>[
              ExpansionTileCard(
                leading: CircleAvatar(
                  child: Image.asset("assets/FAQ/question.png"),
                ),
                title: Text("${querySnapshot.documents[i].data['question']}"),
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
                      child:
                          Text("${querySnapshot.documents[i].data['answer']}"),
                    ),
                  ),
                ],
              ),
            ],
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
      ));
    }
  }
}
