
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'loginForm.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'service.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _textEditingController = new TextEditingController();
  int state = 0;
  signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Order details Page'),
          actions: <Widget>[
            new FlatButton(
                child: new Text('Logout',
                    style: new TextStyle(fontSize: 17.0, color: Colors.white)),
                onPressed: signOut)
          ],
        ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.white70,
                  Colors.white70,
//                  Color.fromRGBO(195, 20, 50, 1.0),
//                  Color.fromRGBO(36, 11, 54, 1.0)
                ]),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  // Navbar(  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 10.0),
                      child:  LayoutBuilder(
                        builder: (context, constraints) {
                          if (constraints.maxWidth > 1100) {
                            return hompage();
                          }
                          return hompage();
//                          else if (constraints.maxWidth > 800 && constraints.maxWidth < 1100) {
//                            return hompage();
//                          } else {
//                            return hompageMobile1();
//                          }
                        },

                      )

                    //TopicVideoPage(),
                  )
                ],
              ),
            ),
          ),
          height: 900,
        ),
      ),
      );
  }
}

final _firestore = Firestore.instance;
ProgressDialog pr;
class hompage extends StatefulWidget {


  @override
  _LandingPageState createState() => _LandingPageState();

}

class _LandingPageState extends State<hompage > {
  final emailTextControler = TextEditingController();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();




  int state = 0;
  String  platform;
  String amount;
  String screenshot;

  var result;

  bool _isAddingEmail = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void _submit() {

    setState(() {

      _isAddingEmail = true;
    });

    if (_isAddingEmail == true){
      emailTextControler.clear();
      setState(() {

        showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Registration Successful'),
              content: const Text('Congratulations, your order detais are saved'),
              actions: <Widget>[
                FlatButton(
                  child: Text('ok'),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return HomePage();
                    }));

                    //  Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );

//    Alert(
//      context: context,
//      title: 'Email Saved!',
//      desc: 'Thank you. We will inform you once our training Platform is available on web.',
//
//    ).show();
      });
      CircularProgressIndicator(
        value: 90,
      );
      AlertDialog(
        title:  Text("Email Save Successfully"),
      );

      popup();
      var result = print('Email saved');
    }
    else{
      var result = print('Email not Save');
    }



    final form = formKey.currentState;
    emailTextControler.clear();
    _firestore.collection(' Orders Details').add({
      'Amount': amount,
      'Platform': platform,
      'Screenshot': screenshot,

    }


    );

    setState(() {
      _isAddingEmail = false;
    });

    if (form.validate()) {
      form.save();


    }


    //print('Email Save');
  }

  void popup(){
    Future<String> CreatAllertDaulog(BuildContext context){
      TextEditingController customcontroller = TextEditingController();
      return showDialog(context: context,builder: (context){
        return AlertDialog(
          title:  Text("Email Save Successfully"),
        );
      });
    }
  }
  List<Widget> pageChildren(double width) {

    pr =  ProgressDialog(context);
    pr.style(
        message: 'Please Waiting...',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(strokeWidth: 0.5,),
        elevation: 10.0,

        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600)
    );
    return <Widget>[
      Card(
        color: Colors.white,
        child: Container(
          color: Colors.white,

          width: 400,

          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child:

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Appsol360",
                            style: TextStyle(fontSize: 40.0, color: Colors.black,fontWeight:FontWeight.bold,),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            " Enter Order",
                            style: TextStyle(fontSize: 22.0, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      child: new Form(
                        key: formKey,
                        child: new Column(
                          children: <Widget>[
//                      new TextFormField(
//                        controller: emailTextControler,
//                        decoration:
//                        kTextFieldDecoration.copyWith(
//                          hintText: 'Enter Valid Email',
//                          filled: true,
//                          fillColor: Colors.grey[200],
//                        ),
//                        keyboardType: TextInputType.emailAddress,
//                        textAlign: TextAlign.center,
//                        onChanged: (value) {
//                          //Do something with the user input
//                          emailText = value;
//                        },
//                        validator: (val) =>
//                        !val.contains('@') ? 'Invalid Email' : null,
//
//                      ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text("Amount"),
                            ],
                          ),
                            SizedBox(height: 10,),
                            new TextFormField(
                              //  controller: emailTextControler,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter Amount of order';
                                }

                                return null;
                              },
                              onChanged: (value) {
                                amount = value;
                              },
                              // validator: (val) =>
                              //  !val.contains('@') ? 'Invalid Email' : Text("Email Saved"),
                              decoration: new InputDecoration(
                                labelText: "",
                                hintText: "Amount of order",
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white70),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                                prefixIcon: Icon(Icons.monetization_on),

                                filled: true,
                                fillColor: Colors.grey[200],
                              ),
                              keyboardType: TextInputType.text,
                              //   onSaved: (val) => _email = val,               it is an other way
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text(" Platform"),
                              ],
                            ),
                            SizedBox(height: 10,),
                            new TextFormField(
                              //  controller: emailTextControler,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter  Platform';
                                }

                                return null;
                              },
                              onChanged: (value) {
                                platform = value;
                              },
                              // validator: (val) =>
                              //  !val.contains('@') ? 'Invalid Email' : Text("Email Saved"),
                              decoration: new InputDecoration(
                                labelText: "",
                                hintText: ("( from which user gets an order)"),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white70),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                                prefixIcon: Icon(Icons.add_to_queue),

                                filled: true,
                                fillColor: Colors.grey[200],
                              ),
                              keyboardType: TextInputType.text,
                              //   onSaved: (val) => _email = val,               it is an other way
                            ),

                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text("Screenshot"),
                              ],
                            ),
                            SizedBox(height: 10,),
                            new TextFormField(
                              //  controller: emailTextControler,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter Screenshot';
                                }

                                return null;
                              },
                              onChanged: (value) {
                                screenshot = value;
                              },
                              // validator: (val) =>
                              //  !val.contains('@') ? 'Invalid Email' : Text("Email Saved"),
                              decoration: new InputDecoration(
                                labelText: "",
                                hintText: ("(google drive uploaded URL of the image)"),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white70),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                                prefixIcon: Icon(Icons.image),

                                filled: true,
                                fillColor: Colors.grey[200],
                              ),
                              keyboardType: TextInputType.text,
                              //   onSaved: (val) => _email = val,               it is an other way
                            ),





                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                MaterialButton(
                                  color: Colors.green[900],
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                                  onPressed: (){
                                    pr.show();
                                    Future.delayed(Duration(seconds: 3)).then((value) {
                                      pr.hide().whenComplete(_submit);
                                    });

                                  },


                                  //_submit,

                                  //() =>CourseDetailScreen,
                                  //    _submit,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20.0, horizontal: 40.0),
                                    child: _isAddingEmail


                                        ? CircularProgressIndicator(
                                      value: 900,

                                    )
                                        : Text(
                                      "Save",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
SizedBox(height: 20,)


                              ],
                            ),

                            SizedBox(height: 20,)


                          ],
                        ),
                      ),

                    ),
                    SizedBox(height: 20,)

                  ],
                ),
              ),
            ],
          ),
        ),
      ),



    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: pageChildren(constraints.biggest.width / 1),
          );
        } else {
          return Column(
            children: pageChildren(constraints.biggest.width),
          );
        }
      },
    );
  }
}




//mobile mode

class hompageMobile1 extends StatefulWidget {


  @override
  _LandingPageState1 createState() => _LandingPageState1();

}

class _LandingPageState1 extends State<hompageMobile1 > {
  final emailTextControler = TextEditingController();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();




  int state = 0;
  String amount;
  String platform;
  String screenshot;

  var result;

  bool _isAddingEmail = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void _submit() {

    setState(() {

      _isAddingEmail = true;
    });

    if (_isAddingEmail == true){
      emailTextControler.clear();
      setState(() {

        showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Registration Successful'),
              content: const Text('Congratulations, your order is saved'),
              actions: <Widget>[
                FlatButton(
                  child: Text('ok'),
                  onPressed: () {
                    //Navigator.of(context).pop();
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return HomePage();
                    }));
                  },
                ),
              ],
            );
          },
        );

//    Alert(
//      context: context,
//      title: 'Email Saved!',
//      desc: 'Thank you. We will inform you once our training Platform is available on web.',
//
//    ).show();
      });
      CircularProgressIndicator(
        value: 90,
      );
      AlertDialog(
        title:  Text("Email Save Successfully"),
      );

      popup();
      var result = print('Email saved');
    }
    else{
      var result = print('Email not Save');
    }



    final form = formKey.currentState;
    emailTextControler.clear();
    _firestore.collection(' Registerd Students').add({
      'Amount': amount,
      'Platform': platform,
      'Screenshot': screenshot,

    });

    setState(() {
      _isAddingEmail = false;
    });

    if (form.validate()) {
      form.save();


    }


    //print('Email Save');
  }

  void popup(){
    Future<String> CreatAllertDaulog(BuildContext context){
      TextEditingController customcontroller = TextEditingController();
      return showDialog(context: context,builder: (context){
        return AlertDialog(
          title:  Text("Email Save Successfully"),
        );
      });
    }
  }

  List<Widget> pageChildren(double width) {
    pr = new ProgressDialog(context);
    pr.style(
        message: 'Please Waiting...',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600)
    );
    return <Widget>[
      Card(
        color: Colors.white,
        child: Container(
          color: Colors.white,

          width: 410,

          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child:

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Appsol360",
                            style: TextStyle(fontSize: 40.0, color: Colors.black,fontWeight:FontWeight.bold,),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            " Enter Order Details",
                            style: TextStyle(fontSize: 22.0, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      child: new Form(
                        key: formKey,
                        child: new Column(
                          children: <Widget>[
//                      new TextFormField(
//                        controller: emailTextControler,
//                        decoration:
//                        kTextFieldDecoration.copyWith(
//                          hintText: 'Enter Valid Email',
//                          filled: true,
//                          fillColor: Colors.grey[200],
//                        ),
//                        keyboardType: TextInputType.emailAddress,
//                        textAlign: TextAlign.center,
//                        onChanged: (value) {
//                          //Do something with the user input
//                          emailText = value;
//                        },
//                        validator: (val) =>
//                        !val.contains('@') ? 'Invalid Email' : null,
//
//                      ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 10.0),
                              child: Row(
                                children: <Widget>[
                                  Text("Amount"),
                                  SizedBox(height: 10,),
                                  TextFormField(
                                    //  controller: emailTextControler,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter Amount';
                                      }

                                      return null;
                                    },
                                    onChanged: (value) {
                                      amount = value;
                                    },
                                    // validator: (val) =>
                                    //  !val.contains('@') ? 'Invalid Email' : Text("Email Saved"),
                                    decoration: new InputDecoration(
                                      labelText: "",
                                      hintText: (" Enter Amount"),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.white),
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(30))),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.white70),
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(30))),
                                      prefixIcon: Icon(Icons.monetization_on),

                                      filled: true,
                                      fillColor: Colors.grey[200],
                                    ),
                                    keyboardType: TextInputType.text,
                                    //   onSaved: (val) => _email = val,               it is an other way
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text("Platform"),
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 10.0),
                              child: TextFormField(
                                //  controller: emailTextControler,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter Platform';
                                  }

                                  return null;
                                },
                                onChanged: (value) {
                                  platform = value;
                                },
                                // validator: (val) =>
                                //  !val.contains('@') ? 'Invalid Email' : Text("Email Saved"),
                                decoration: new InputDecoration(
                                  labelText: "",
                                  hintText: "( from which user gets an order)",
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white70),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                                  prefixIcon: Icon(Icons.add_to_queue),

                                  filled: true,
                                  fillColor: Colors.grey[200],
                                ),
                                keyboardType: TextInputType.text,
                                //   onSaved: (val) => _email = val,               it is an other way
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text("Screenshot"),
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 10.0),
                              child: TextFormField(
                                //  controller: emailTextControler,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter Screenshot';
                                  }

                                  return null;
                                },
                                onChanged: (value) {
                                  screenshot = value;
                                },
                                // validator: (val) =>
                                //  !val.contains('@') ? 'Invalid Email' : Text("Email Saved"),
                                decoration: new InputDecoration(
                                  labelText: "",
                                  hintText: " (google drive uploaded URL of the image)",
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white70),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                                  prefixIcon: Icon(Icons.image),

                                  filled: true,
                                  fillColor: Colors.grey[200],
                                ),
                                keyboardType: TextInputType.text,
                                //   onSaved: (val) => _email = val,               it is an other way
                              ),
                            ),
                            SizedBox(height: 10,),




                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 0.0, horizontal: 10.0),
                                  child: MaterialButton(
                                    color: Colors.green[900],
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(20.0))),
                                    onPressed: (){
                                      pr.show();
                                      Future.delayed(Duration(seconds: 3)).then((value) {
                                        pr.hide().whenComplete(_submit);
                                      });

                                    },


                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 30.0),
                                      child: _isAddingEmail


                                          ? CircularProgressIndicator(
                                        value: 90,
                                      )
                                          : Text(
                                        "save",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),


                              ],
                            ),


                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),



    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: pageChildren(constraints.biggest.width / 1),
          );
        } else {
          return Column(
            children: pageChildren(constraints.biggest.width),
          );
        }
      },
    );
  }
}

