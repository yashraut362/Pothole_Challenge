import 'package:cloud_firestore/cloud_firestore.dart';

getFaqList() async {
  return await Firestore.instance.collection('FAQ').getDocuments();
}
