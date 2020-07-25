import 'dart:io';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import '../services/toast.dart';
import '../services/focuschanger.dart';

class ComplaintForm extends StatefulWidget {
  @override
  _ComplaintFormState createState() => _ComplaintFormState();
}

class _ComplaintFormState extends State<ComplaintForm> {
  final _formKey = GlobalKey<FormState>();

  FocusNode _usernameFocusNode = FocusNode();
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _potholetypeFocusNode = FocusNode();
  FocusNode _departmentFocusNode = FocusNode();
  FocusNode _addressFocusNode = FocusNode();
  FocusNode _landmarkFocusNode = FocusNode();
  FocusNode _commentFocusNode = FocusNode();
  FocusNode _phonenumFocusNode = FocusNode();

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
  bool _work = false;
  String imageurl;
  File image;
  String filename;
  final picker = ImagePicker();

  Future _getImage() async {
    var selectedImage =
        await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = selectedImage;
      filename = basename(image.path);
    });
    uploadImage();
  }

  Future<String> uploadImage() async {
    StorageReference ref = FirebaseStorage.instance.ref().child(filename);
    StorageUploadTask uploadTask = ref.putFile(image);

    var downUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
    var url = downUrl.toString();
    setState(() {
      imageurl = url;
    });
    print('url is $imageurl');
  }

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
      'work': _work,
      'imageurl': imageurl,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.amber,
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Complaint Form",
          style: TextStyle(color: Colors.amber),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 20.0),
                RaisedButton.icon(
                    onPressed: _getImage,
                    icon: Icon(Icons.add_a_photo),
                    label: Text('Add Image')),
                SizedBox(height: 20.0),
                TextFormField(
                  focusNode: _potholetypeFocusNode,
                  autofocus: true,
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Pothole Type",
                    hintText: "e.g pothole,cracks,deformation,deep etc",
                    focusColor: Colors.amber,
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(8.0),
                      ),
                      borderSide: new BorderSide(
                        color: Colors.amber,
                        width: 1.0,
                      ),
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onSaved: (value) => _potholetype = value,
                  onFieldSubmitted: (_) {
                    fieldFocusChange(
                        context, _potholetypeFocusNode, _departmentFocusNode);
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  focusNode: _departmentFocusNode,
                  autofocus: true,
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Department",
                    hintText: "e.g Nagarpalika",
                    focusColor: Colors.amber,
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(8.0),
                      ),
                      borderSide: new BorderSide(
                        color: Colors.amber,
                        width: 1.0,
                      ),
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (department) {
                    if (department.isEmpty) {
                      return 'Department is Required';
                    }
                    return null;
                  },
                  onSaved: (department) => _department = department,
                  onFieldSubmitted: (_) {
                    fieldFocusChange(
                        context, _departmentFocusNode, _addressFocusNode);
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  focusNode: _addressFocusNode,
                  autofocus: true,
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Address",
                    hintText: "Address of pothole",
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(8.0),
                      ),
                      borderSide: new BorderSide(
                        color: Colors.amber,
                        width: 1.0,
                      ),
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (address) {
                    if (address.isEmpty) {
                      return 'Address is Required';
                    }
                    return null;
                  },
                  onSaved: (address) => _address = address,
                  onFieldSubmitted: (_) {
                    fieldFocusChange(
                        context, _addressFocusNode, _landmarkFocusNode);
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  focusNode: _landmarkFocusNode,
                  autofocus: true,
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Landmark",
                    hintText: "Nearby Landmark",
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(8.0),
                      ),
                      borderSide: new BorderSide(
                        color: Colors.amber,
                        width: 1.0,
                      ),
                    ),
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
                    fieldFocusChange(
                        context, _landmarkFocusNode, _commentFocusNode);
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  focusNode: _commentFocusNode,
                  autofocus: true,
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Comment",
                    hintText: "Comment about pothole",
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(8.0),
                      ),
                      borderSide: new BorderSide(
                        color: Colors.amber,
                        width: 1.0,
                      ),
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (comment) {
                    if (comment.isEmpty) {
                      return 'Comment is Required';
                    }
                    return null;
                  },
                  onSaved: (comment) => _comment = comment,
                  onFieldSubmitted: (_) {
                    fieldFocusChange(
                        context, _commentFocusNode, _usernameFocusNode);
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  focusNode: _usernameFocusNode,
                  autofocus: true,
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(8.0),
                      ),
                      borderSide: new BorderSide(
                        color: Colors.amber,
                        width: 1.0,
                      ),
                    ),
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
                    fieldFocusChange(
                        context, _usernameFocusNode, _emailFocusNode);
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  focusNode: _emailFocusNode,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(8.0),
                      ),
                      borderSide: new BorderSide(
                        color: Colors.amber,
                        width: 1.0,
                      ),
                    ),
                    labelText: "Email",
                    hintText: "e.g abc@gmail.com",
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (email) => EmailValidator.validate(email)
                      ? null
                      : "Invalid email address",
                  onSaved: (email) => _email = email,
                  onFieldSubmitted: (_) {
                    fieldFocusChange(
                        context, _emailFocusNode, _phonenumFocusNode);
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: new InputDecoration(
                    labelText: "Enter your number",
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(8.0),
                      ),
                      borderSide: new BorderSide(
                        color: Colors.amber,
                        width: 1.0,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    _phonenum = int.parse(value);
                  },
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly
                  ], // Only numbers can be entered
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
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
                ),
              ],
            )),
      ),
    );
  }
}
