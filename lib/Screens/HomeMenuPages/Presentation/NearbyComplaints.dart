import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:location/location.dart';

class NearbyComplaint extends StatefulWidget {
  @override
  _NearbyComplaintState createState() => _NearbyComplaintState();
}

class _NearbyComplaintState extends State<NearbyComplaint> {
  final _firestore = Firestore.instance;
  Geoflutterfire geo = Geoflutterfire();
  Location location = new Location();

  String _username,
      _email,
      _potholetype,
      _department,
      _address,
      _landmark,
      _comment;
  int _phonenum;

  void uploadform() async {
    var pos = await location.getLocation();
    GeoFirePoint point =
        geo.point(latitude: pos.latitude, longitude: pos.longitude);
    _firestore.collection('reports').add({
      'username': _username,
      'position': point.data,
      'email': _email,
      'potholetype': _potholetype,
      'department': _department,
      'address': _address,
      'landmark': _landmark,
      'comment': _comment,
      'phonenum': _phonenum,
    });
  }

  final _formKey = GlobalKey<FormState>();

  FocusNode _usernameFocusNode = FocusNode();
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _potholetypeFocusNode = FocusNode();
  FocusNode _departmentFocusNode = FocusNode();
  FocusNode _addressFocusNode = FocusNode();
  FocusNode _landmarkFocusNode = FocusNode();
  FocusNode _commentFocusNode = FocusNode();
  FocusNode _phonenumFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input Validation"),
      ),
      body: ListView(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                PotholeType(),
                SizedBox(
                  height: 10,
                ),
                Department(),
                SizedBox(
                  height: 10,
                ),
                Address(),
                SizedBox(
                  height: 10,
                ),
                Landmark(),
                SizedBox(
                  height: 10,
                ),
                Comment(),
                SizedBox(
                  height: 10,
                ),
                NameInput(),
                SizedBox(
                  height: 10,
                ),
                EmailInput(),
                SizedBox(
                  height: 10,
                ),
                Phonenum(),
                SizedBox(
                  height: 10,
                ),
                SubmitButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget PotholeType() {
    return TextFormField(
      focusNode: _potholetypeFocusNode,
      autofocus: true,
      textCapitalization: TextCapitalization.words,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Pothole Type",
        hintText: "e.g pothole,cracks,deformation,deep etc",
      ),
      textInputAction: TextInputAction.next,
      validator: (name) {
        if (name.isEmpty) {
          return 'PotholeType is Required';
        }
        return null;
      },
      onSaved: (name) => _potholetype = name,
      onFieldSubmitted: (_) {
        fieldFocusChange(context, _potholetypeFocusNode, _departmentFocusNode);
      },
    );
  }

  Widget Department() {
    return TextFormField(
      focusNode: _departmentFocusNode,
      autofocus: true,
      textCapitalization: TextCapitalization.words,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Department",
        hintText: "e.g Nagarpalika",
      ),
      textInputAction: TextInputAction.next,
      validator: (name) {
        if (name.isEmpty) {
          return 'Department is Required';
        }
        return null;
      },
      onSaved: (name) => _department = name,
      onFieldSubmitted: (_) {
        fieldFocusChange(context, _departmentFocusNode, _addressFocusNode);
      },
    );
  }

  Widget Address() {
    return TextFormField(
      focusNode: _addressFocusNode,
      autofocus: true,
      textCapitalization: TextCapitalization.words,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Address",
        hintText: "Address of pothole",
      ),
      textInputAction: TextInputAction.next,
      validator: (name) {
        if (name.isEmpty) {
          return 'Address is Required';
        }
        return null;
      },
      onSaved: (name) => _address = name,
      onFieldSubmitted: (_) {
        fieldFocusChange(context, _addressFocusNode, _landmarkFocusNode);
      },
    );
  }

  Widget Landmark() {
    return TextFormField(
      focusNode: _landmarkFocusNode,
      autofocus: true,
      textCapitalization: TextCapitalization.words,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Landmark",
        hintText: "Nearby Landmark",
      ),
      textInputAction: TextInputAction.next,
      validator: (name) {
        if (name.isEmpty) {
          return 'Landmark is Required';
        }
        return null;
      },
      onSaved: (name) => _landmark = name,
      onFieldSubmitted: (_) {
        fieldFocusChange(context, _landmarkFocusNode, _commentFocusNode);
      },
    );
  }

  Widget Comment() {
    return TextFormField(
      focusNode: _commentFocusNode,
      autofocus: true,
      textCapitalization: TextCapitalization.words,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Comment",
        hintText: "Comment about pothole",
      ),
      textInputAction: TextInputAction.next,
      validator: (name) {
        if (name.isEmpty) {
          return 'Comment is Required';
        }
        return null;
      },
      onSaved: (name) => _comment = name,
      onFieldSubmitted: (_) {
        fieldFocusChange(context, _commentFocusNode, _usernameFocusNode);
      },
    );
  }

  Widget NameInput() {
    return TextFormField(
      focusNode: _usernameFocusNode,
      autofocus: true,
      textCapitalization: TextCapitalization.words,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Username",
        hintText: "e.g Yash",
      ),
      textInputAction: TextInputAction.next,
      validator: (name) {
        Pattern pattern = r'^[A-Za-z0-9]+(?:[ _-][A-Za-z0-9]+)*$';
        RegExp regex = new RegExp(pattern);
        if (!regex.hasMatch(name))
          return 'Invalid username';
        else
          return null;
      },
      onSaved: (name) => _username = name,
      onFieldSubmitted: (_) {
        fieldFocusChange(context, _usernameFocusNode, _emailFocusNode);
      },
    );
  }

  Widget EmailInput() {
    return TextFormField(
      focusNode: _emailFocusNode,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "e.g abc@gmail.com",
      ),
      textInputAction: TextInputAction.next,
      validator: (email) =>
          EmailValidator.validate(email) ? null : "Invalid email address",
      onSaved: (email) => _email = email,
      onFieldSubmitted: (_) {
        fieldFocusChange(context, _emailFocusNode, _phonenumFocusNode);
      },
    );
  }

  Widget Phonenum() {
    return TextFormField(
      decoration: new InputDecoration(labelText: "Enter your number"),
      keyboardType: TextInputType.number,
      onChanged: (value) {
        _phonenum = int.parse(value);
      },
      inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly
      ], // Only numbers can be entered
    );
  }

  RaisedButton SubmitButton() {
    return RaisedButton(
      color: Theme.of(context).primaryColor,
      onPressed: () {
        if (_formKey.currentState.validate()) {
          _formKey.currentState.save();
          toastMessage(
              "Username: $_username\nEmail: $_email\nPotholetype:$_potholetype\nDepartment:$_department\nAddress:$_address\nLandmark:$_landmark\nComment:$_comment\nPhoneno:$_phonenum");
        }
        uploadform();
        print("Yash");
      },
      child: Text(
        "Submit",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

void toastMessage(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIos: 1,
      fontSize: 16.0);
}

void fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
