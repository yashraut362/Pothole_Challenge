import 'package:cloud_firestore/cloud_firestore.dart';

getDriversList() async {
  return await Firestore.instance.collection('FAQ').getDocuments();
}
