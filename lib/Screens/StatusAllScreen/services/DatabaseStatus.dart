import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

getStatusList() async {
  return await Firestore.instance.collection('reports').getDocuments();
}

navigateme(String lat, String long) async {
  String url = "https://www.google.com/maps?q=" + lat + "," + long;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

seepothole(String downloadurl) async {
  String url = downloadurl;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
