import 'package:cloud_firestore/cloud_firestore.dart';

getStatusList() async {
  return await Firestore.instance.collection('reports').getDocuments();
}
