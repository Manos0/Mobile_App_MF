import 'package:flutter/material.dart';

import '../../bin/colors.dart';
import '../../providers/new_fundraiser.dart';
import '../../widgets/add_fundraiser/add_contact_form_widget.dart';
import '../../widgets/add_fundraiser/edit_contact_form_widget.dart';
import './obituary_screen.dart';

class AddContactsScreen extends StatefulWidget {
  static const routeName = '/add-contact';
  @override
  _AddContactsScreenState createState() => _AddContactsScreenState();
}

class _AddContactsScreenState extends State<AddContactsScreen> {
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
          'Contacts',
          style: TextStyle(
            color: mfLettersColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (locationData.contacts == null ||
                  locationData.contacts.isEmpty)
                Column(
                  children: [
                    Text(
                      'Add contacts, relatives and/or next-of-kin. You must enter at least one contact. If you do not have contact information at this point you can enter yourself or the Funeral Director as a contact.',
                      style: TextStyle(
                        color: mfLettersColor,
                        fontWeight: FontWeight.w200,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              if (locationData.contacts != null)
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      locationData.contacts.length,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Dismissible(
                              key: ValueKey(locationData.contacts[index]),
                              direction: DismissDirection.endToStart,
                              onDismissed: (direction) {
                                locationData.contacts.removeAt(index);
                                setState(() {});
                              },
                              background: Container(
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                  size: 40,
                                ),
                                alignment: Alignment.centerRight,
                                padding: EdgeInsets.only(right: 20),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(13),
                                ),
                              ),
                              child: Card(
                                elevation: 8,
                                shadowColor: Color.fromRGBO(247, 247, 247, 100),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      if (locationData
                                              .contacts[index].contactImage ==
                                          null)
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 13),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(60),
                                            child: Image(
                                              width: 50,
                                              height: 50,
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                'assets/images/helperImage.png',
                                              ),
                                            ),
                                          ),
                                        )
                                      else
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 13),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(60),
                                            child: Image(
                                              width: 55,
                                              height: 55,
                                              fit: BoxFit.fill,
                                              image: FileImage(
                                                locationData.contacts[index]
                                                    .contactImage,
                                                scale: 5,
                                              ),
                                            ),
                                          ),
                                        ),
                                      Expanded(
                                        child: Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                locationData.contacts[index]
                                                        .firstName +
                                                    ' ' +
                                                    locationData.contacts[index]
                                                        .lastName,
                                                style: TextStyle(
                                                  color: mfLettersColor,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 19,
                                                ),
                                              ),
                                              if (locationData
                                                      .contacts[index].email !=
                                                  null)
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 5),
                                                      child: Icon(
                                                        Icons
                                                            .alternate_email_rounded,
                                                        color:
                                                            mfThrirdLetterColor,
                                                        size: 20,
                                                      ),
                                                    ),
                                                    Text(
                                                      locationData
                                                          .contacts[index]
                                                          .email,
                                                      style: TextStyle(
                                                        color:
                                                            mfThrirdLetterColor,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              if (locationData.contacts[index]
                                                      .phoneNumber !=
                                                  null)
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 5),
                                                      child: Icon(
                                                        Icons.phone,
                                                        color:
                                                            mfThrirdLetterColor,
                                                        size: 20,
                                                      ),
                                                    ),
                                                    Text(
                                                      locationData
                                                          .contacts[index]
                                                          .phoneNumber,
                                                      style: TextStyle(
                                                        color:
                                                            mfThrirdLetterColor,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        alignment: Alignment.topRight,
                                        padding: EdgeInsets.all(0),
                                        icon: Icon(
                                          Icons.edit,
                                          size: 15,
                                          color: mfLightGrey,
                                        ),
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return EditContactFormWidget(
                                                contact: locationData
                                                    .contacts[index],
                                              );
                                            },
                                          ).then((_) => setState(() {}));
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              if (locationData.contacts == null ||
                  locationData.contacts.isEmpty)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: ElevatedButton(
                      child: Text(
                        'Add New',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 65, vertical: 12),
                        primary: mfPrimaryColor,
                        shadowColor: mfPrimaryColor,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AddContactFormWidget(
                              locationData: locationData,
                            );
                          },
                        ).then((_) => setState(() {}));
                      },
                    ),
                  ),
                )
              else
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width,
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AddContactFormWidget(
                            locationData: locationData,
                          );
                        },
                      ).then((_) => setState(() {}));
                    },
                    child: Card(
                      elevation: 8,
                      shadowColor: Color.fromRGBO(247, 247, 247, 100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: CircleBorder(),
                                shadowColor: Colors.black12,
                                padding: EdgeInsets.all(7),
                                primary: mfPrimaryColor40,
                                elevation: 5,
                                side: BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: null,
                              child: Icon(
                                Icons.add_sharp,
                                color: mfPrimaryColor,
                                size: 35,
                              ),
                            ),
                            Center(
                              child: Text(
                                'Add Additional Contacts',
                                style: TextStyle(
                                  color: mfLettersColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              if (locationData.contacts != null &&
                  locationData.contacts.isNotEmpty)
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(top: 40, bottom: 40),
                  child: ElevatedButton(
                    child: Text(
                      'Next: Obituary',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: mfPrimaryColor,
                      shadowColor: mfPrimaryColor,
                      elevation: 5,
                      padding:
                          EdgeInsets.symmetric(horizontal: 35, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(ObituaryScreen.routeName,
                          arguments: locationData);
                    },
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
