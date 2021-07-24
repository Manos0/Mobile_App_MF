import 'dart:convert';
import 'package:path/path.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../../bin/colors.dart';
import '../../providers/new_fundraiser.dart';
import '../../screens/add_fundraiser/add_contacts_screen.dart';

class ImagePickerScreen extends StatefulWidget {
  static const routeName = '/image-picker';

  @override
  _ImagePickerScreenState createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  File imageFile;
  final picker = ImagePicker();

  chooseImage(ImageSource source, data) async {
    final pickedFile = await picker.getImage(source: source);
    setState(() {
      imageFile = File(pickedFile.path);
      data.galleryImage = imageFile;
      final bytes = File(pickedFile.path).readAsBytesSync();
      final fileName = basename(imageFile.path);
      data.clientAvatar = fileName.toString();
      data.clientAvatar64 = base64Encode(bytes);
    });
  }

  @override
  Widget build(BuildContext context) {
    final locationData =
        ModalRoute.of(context).settings.arguments as NewFundraiser;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 4,
        iconTheme: IconThemeData(color: mfLightGrey),
        title: Text(
          'Upload Image',
          style: TextStyle(
            color: mfLettersColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
              child: Text(
                'One photo is required. You can take one with your camera or select from your gallery.',
                style: TextStyle(
                  color: mfSecondaryLetterColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Column(
              children: [
                Container(
                  width: 300,
                  height: 250,
                  child: locationData.galleryImage != null
                      ? Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            image: DecorationImage(
                              image: FileImage(locationData.galleryImage),
                              fit: BoxFit.fill,
                            ),
                          ),
                        )
                      : Container(
                          width: 300,
                          height: 250,
                          decoration: BoxDecoration(
                            color: mfLightlightGrey,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.add_a_photo,
                                  size: 100,
                                  color: mfLightGrey,
                                ),
                                Text(
                                  'Select an image',
                                  style: TextStyle(
                                    color: mfLightGrey,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            chooseImage(ImageSource.camera, locationData);
                          },
                          child: Text(
                            'Camera',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: mfLightlightGrey,
                            // shadowColor: mfLightGrey,
                            elevation: 1,
                            padding: EdgeInsets.symmetric(
                                horizontal: 35, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            chooseImage(ImageSource.gallery, locationData);
                          },
                          child: Text(
                            'Gallery',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            elevation: 1,
                            padding: EdgeInsets.symmetric(
                                horizontal: 35, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 46),
              child: ElevatedButton(
                child: Text(
                  'Next: Add Contacts',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: mfPrimaryColor,
                  shadowColor: mfPrimaryColor,
                  elevation: 5,
                  padding: EdgeInsets.symmetric(horizontal: 35, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                onPressed: () {
                  if (locationData.clientAvatar != null) {
                    Navigator.pushNamed(context, AddContactsScreen.routeName,
                        arguments: locationData);
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
