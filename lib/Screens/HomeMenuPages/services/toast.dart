import 'package:fluttertoast/fluttertoast.dart';

void toastMessage(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      fontSize: 16.0);
}
