import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../screens/doctor_details.dart';

class DoctorsList extends StatefulWidget {
  // from connect_page.dart

  // List<Doctor> get _physicianDoctors {
  //   return _allDoctorsList.where((doctor) {
  //     if (doctor.specialization.compareTo('physician') == 0) return true;
  //   }).toList();
  // }
  @override
  _DoctorsListState createState() => _DoctorsListState();
}

class _DoctorsListState extends State<DoctorsList> {
  String documentid;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      margin: EdgeInsets.only(top: 16),
      child: StreamBuilder(
          stream: Firestore.instance.collection('doctors').snapshots(),
          builder: (ctx, docSnapshot) {
            if (docSnapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final docList = docSnapshot.data.documents;
            return ListView.builder(
                itemCount: docList.length,
                itemBuilder: (ctx, index) {
                  return Card(
                    margin: EdgeInsets.only(top: 16),
                    elevation: 5,
                    child: GestureDetector(
                      onTap: () {
                        print(docList[index].documentID);
                        print("....           ........");

                        setState(() {
                          documentid = docList[index].documentID;
                        });
                        print(Firestore.instance
                            .collection('doctors')
                            .document(documentid)
                            .get());

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoctorDetails(documentid),
                          ),
                        );
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          child: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          backgroundColor: Theme.of(context).accentColor,
                        ),
                        title: Text(
                          docList[index]['docname'],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(docList[index]['doccategory']),
                        trailing: Container(
                          width: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(docList[index]['docrating']),
                              Icon(
                                Icons.star,
                                color: Colors.yellow[600],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
