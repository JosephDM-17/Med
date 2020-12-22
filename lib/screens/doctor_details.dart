import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DoctorDetails extends StatefulWidget {
  String documentid;

  DoctorDetails(this.documentid);

  @override
  _DoctorDetailsState createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  var variable, flag, docname, doccategory, docqualification, docdescription;

  getDoctorDetails() async {
    //print(uemail);
    variable = await Firestore.instance
        .collection('doctors')
        .document(widget.documentid)
        .snapshots();

    Firestore.instance
        .collection('doctors')
        .document(widget.documentid)
        .get()
        .then((value) {
      setState(() {
        docname = value.data["docname"];
        doccategory = value.data["doccategory"];
        docqualification = value.data["docqualification"];
        docdescription = value.data["docdescription"];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    getDoctorDetails();
    print(widget.documentid);

    return Scaffold(
      appBar: AppBar(
        title: Text('Connect'),
        backgroundColor: Theme.of(context).accentColor,
      ),
      body: docname == null ||
              doccategory == null ||
              docqualification == null ||
              docdescription == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 20,
                        bottom: 20,
                      ),
                      child: Icon(
                        Icons.account_circle,
                        size: 100,
                        color: Color.fromRGBO(67, 67, 67, 1),
                      ),
                    ),
                    Text(
                      docname,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                        //Specialization and qualification
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                            child: Container(
                          child: Text(
                            doccategory + ' , ' + docqualification,
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ))),
                    Container(
                      // Call, message and video
                      margin: EdgeInsets.only(top: 20),
                      padding: EdgeInsets.symmetric(horizontal: 20),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.green[600],
                            radius: 20,
                            child: IconButton(
                              icon: Icon(Icons.call),
                              onPressed: () {},
                              color: Colors.white,
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 20,
                            child: IconButton(
                              icon: Icon(
                                Icons.message,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                              color: Colors.white,
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.orange,
                            radius: 20,
                            child: IconButton(
                              icon: Icon(
                                Icons.video_call,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height / 10,
                      ),
                      width: MediaQuery.of(context).size.width * 3 / 4,
                      child: Card(
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 32,
                            horizontal: 16,
                          ),
                          child: Text(
                            docdescription,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      //Pay
                      height: 50,
                      width: 100,
                      child: RaisedButton(
                        onPressed: () {},
                        child: Text(
                          'Pay',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
