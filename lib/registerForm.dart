import 'dart:async';
import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'loginForm.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_auth/firebase_auth.dart';
class RegisterForm extends StatefulWidget {
  @override
  _ComingSoonPageState createState() => _ComingSoonPageState();
}

class _ComingSoonPageState extends State<RegisterForm > {
  int state = 0;

  TextEditingController _textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
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
                            return RePage();
                          } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1100) {
                            return RePage();
                          } else {
                            return RePageMobile1();
                          }
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
class RePage extends StatefulWidget {


  @override
  _LandingPageState createState() => _LandingPageState();

}

class _LandingPageState extends State<RePage > {
  final emailTextControler = TextEditingController();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();




  int state = 0;
  String emailText;
  String _password;
  String username;
  String _cnic;
  String _cname;
  String _bno;
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
              content: const Text('Congratulations, your account is created, now you are ready to login'),
              actions: <Widget>[
                FlatButton(
                  child: Text('Login'),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return Form1();
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
    _firestore.collection(' Registerd Students').add({
      'email': emailText,
      'password': _password,
      'user_name': username,
      'user_cnic':_cnic,
      'user_center_name':_cname,
      'user_batch_no':_bno,

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
                            "Create an account",
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
                            new TextFormField(
                              //  controller: emailTextControler,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter Full Name';
                                }

                                return null;
                              },
                              onChanged: (value) {
                                username = value;
                              },
                              // validator: (val) =>
                              //  !val.contains('@') ? 'Invalid Email' : Text("Email Saved"),
                              decoration: new InputDecoration(
                                labelText: "Full Name",
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white70),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                                prefixIcon: Icon(Icons.perm_identity),

                                filled: true,
                                fillColor: Colors.grey[200],
                              ),
 keyboardType: TextInputType.text,
                              //   onSaved: (val) => _email = val,               it is an other way
                            ),
                            SizedBox(height: 10,),
                            new TextFormField(
                              //  controller: emailTextControler,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter Valid Email';
                                }

                                return null;
                              },
                              onChanged: (value) {
                                emailText = value;
                              },
                              // validator: (val) =>
                              //  !val.contains('@') ? 'Invalid Email' : Text("Email Saved"),
                              decoration: new InputDecoration(
                                labelText: "Email",
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white70),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                                prefixIcon: Icon(Icons.mail),

                                filled: true,
                                fillColor: Colors.grey[200],
                              ),
                              keyboardType: TextInputType.emailAddress,
                              //   onSaved: (val) => _email = val,               it is an other way
                            ),

                            SizedBox(height: 10,),
                            new TextFormField(
                              //  controller: emailTextControler,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter Valid Cnic';
                                }

                                return null;
                              },
                              onChanged: (value) {
                                _cnic = value;
                              },
                              // validator: (val) =>
                              //  !val.contains('@') ? 'Invalid Email' : Text("Email Saved"),
                              decoration: new InputDecoration(
                                labelText: "CNIC",
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white70),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                                prefixIcon: Icon(Icons.featured_play_list),

                                filled: true,
                                fillColor: Colors.grey[200],
                              ),
                              keyboardType: TextInputType.numberWithOptions(),
                              //   onSaved: (val) => _email = val,               it is an other way
                            ),

                            SizedBox(height: 10,),
                            new TextFormField(
                              //  controller: emailTextControler,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter Valid Center Name';
                                }

                                return null;
                              },
                              onChanged: (value) {
                                _cname = value;
                              },
                              // validator: (val) =>
                              //  !val.contains('@') ? 'Invalid Email' : Text("Email Saved"),
                              decoration: new InputDecoration(
                                labelText: "Center Name",
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white70),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                                prefixIcon: Icon(Icons.home),

                                filled: true,
                                fillColor: Colors.grey[200],
                              ),
                              keyboardType: TextInputType.text,
                              //   onSaved: (val) => _email = val,               it is an other way
                            ),


                            SizedBox(height: 10,),
                            new TextFormField(
                              //  controller: emailTextControler,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter Center name';
                                }

                                return null;
                              },
                              onChanged: (value) {
                                _bno = value;
                              },
                              // validator: (val) =>
                              //  !val.contains('@') ? 'Invalid Email' : Text("Email Saved"),
                              decoration: new InputDecoration(
                                labelText: "Batch No",
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white70),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                                prefixIcon: Icon(Icons.add_circle_outline),

                                filled: true,
                                fillColor: Colors.grey[200],
                              ),
                              keyboardType: TextInputType.number,
                              //   onSaved: (val) => _email = val,               it is an other way
                            ),
                            SizedBox(height: 10,),
                            new TextFormField(
                              obscureText: true,
                              autofocus: false,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter Pasword';
                                }
 else if(value.length <8){
   return 'Password must be more than 8 characters';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                _password = value;
                              },
                              // validator: (val) =>
                              //  !val.contains('@') ? 'Invalid Email' : Text("Email Saved"),
                              decoration: new InputDecoration(
                                labelText: "Password",
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white70),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                                prefixIcon: Icon(Icons.lock),

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
    "Register",
    style: TextStyle(color: Colors.white),
    ),
                                  ),
                                )



                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  // color: Colors.red,
                                  child: SizedBox(
                                    height: 40,
                                    width: 80,
                                    child: Divider(
                                      color: Colors.grey,
                                      thickness: 0.5,

                                    ),
                                  ),
                                  //   color: Colors.blue,
                                ),

                                Container(

                                  child: SizedBox(
                                      height: 30.0,


                                      child: Text("or Login With",style: TextStyle(color: Colors.grey),)
                                  ),
                                  //   color: Colors.blue,
                                ),
                                Container(
                                  height: 20,

                                  child: SizedBox(
                                    height: 50.0,
                                    width: 80,
                                    child: Divider(
                                      color: Colors.grey,
                                      thickness: 0.5,
                                    ),
                                  ),
                                  //   color: Colors.blue,
                                ),

                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[

                                Stack(
                                  alignment: Alignment.topLeft,

                                  children: <Widget>[

                                    MaterialButton(
                                      color: Colors.blue[900],
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(20.0))),
                                      onPressed: (){

                                      },
                                      child: ClipOval(

                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12.0, horizontal: .0),

                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 25),
                                            child: Text(
                                              "Facebook",
                                              style: TextStyle(color: Colors.white,fontSize: 12),
                                            ),
                                          ),
                                        ),

                                      ),

                                    ),
                                    Positioned(
                                      top: 5,
                                      left: 2,
                                      child: CircleAvatar(

                                        backgroundColor: Colors.blue[900],
                                        radius: 19,


                                        child: ClipOval(

                                          child: Align(
                                            //  alignment: Alignment.,
                                            widthFactor: 5,
                                            child: Container(
                                              child:
                                              IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  CommunityMaterialIcons.facebook, color: Colors.white,), iconSize: 15,
                                                tooltip: 'Facebook',
                                              ),

                                            ),
                                          ),

                                        ),

                                      ),
                                    ),


                                  ],
                                ),
//                                SizedBox(width: 3,),
//                                Stack(
//                                  children: <Widget>[
//
//                                    MaterialButton(
//                                      color: Colors.blueAccent,
//                                      shape: RoundedRectangleBorder(
//                                          borderRadius:
//                                          BorderRadius.all(Radius.circular(20.0))),
//                                      onPressed: (){
//
//                                      },
//                                      child: ClipOval(
//
//                                        child: Padding(
//                                          padding: const EdgeInsets.symmetric(
//                                              vertical: 12.0, horizontal: 8.0),
//
//                                          child: Padding(
//                                            padding: const EdgeInsets.only(left: 20),
//                                            child: Text(
//                                              "Twitter",
//                                              style: TextStyle(color: Colors.white,fontSize: 12),
//                                            ),
//                                          ),
//                                        ),
//
//                                      ),
//
//                                    ),
//                                    Positioned(
//                                      top: 5,
//                                      child: CircleAvatar(
//                                        radius: 19,
//
//                                        backgroundColor: Colors.blue,
//                                        child: ClipOval(
//                                          child: Container(
//
//                                            child:
//                                            IconButton(
//                                              onPressed: () {},
//                                              icon: Icon(
//                                                CommunityMaterialIcons.twitter, color: Colors.white,), iconSize: 20,
//                                              tooltip: 'Twitter',
//                                            ),),
//
//                                        ),
//
//                                      ),
//                                    ),
//
//
//
//                                  ],
//                                ),
//                                SizedBox(width: 3,),
//                                Stack(
//                                  children: <Widget>[
//
//                                    MaterialButton(
//                                      color: Colors.redAccent,
//                                      shape: RoundedRectangleBorder(
//                                          borderRadius:
//                                          BorderRadius.all(Radius.circular(20.0))),
//                                      onPressed: (){
//
//                                      },
//                                      child: ClipOval(
//
//
//                                        child: Padding(
//                                          padding: const EdgeInsets.symmetric(
//                                              vertical: 12.0, horizontal: 22.0),
//
//                                          child: Text(
//                                            "Google",
//                                            style: TextStyle(color: Colors.white,fontSize: 12),
//                                          ),
//                                        ),
//
//                                      ),
//
//                                    ),
//                                    Positioned(
//                                      top: 5,
//                                      child: CircleAvatar(
//                                        radius: 19,
//                                        backgroundColor: Colors.red,
//                                        child: ClipOval(
//                                          child: Container(
//                                            child:
//                                            IconButton(
//                                              onPressed: () {},
//                                              icon: Icon(
//                                                CommunityMaterialIcons.google, color: Colors.white,), iconSize: 15,
//                                              tooltip: 'Google',
//                                            ),
//                                          ),
//
//                                        ),
//
//                                      ),
//                                    ),
//
//                                  ],
//                                ),
                              ],),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,

                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        " Already a member? ",
                                        style: TextStyle(fontSize: 15.0, color: Colors.grey),
                                      ),
                                      FlatButton(onPressed: (){
 Navigator.push(context, MaterialPageRoute(builder: (context){
   return Form1();
 }));
                                      },
                                        child: Text("Login here",style: TextStyle(fontSize: 15.0, color:Colors.grey),),
                                      )],
                                  ),
                                ),
                              ],)
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




//mobile mode

class RePageMobile1 extends StatefulWidget {


  @override
  _LandingPageState1 createState() => _LandingPageState1();

}

class _LandingPageState1 extends State<RePageMobile1 > {
  final emailTextControler = TextEditingController();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();




  int state = 0;
  String emailText;
  String _password;
  String username;
  String _cnic;
  String _cname;
  String _bno;
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
              content: const Text('Congratulations, your account is created, now you are ready to login'),
              actions: <Widget>[
                FlatButton(
                  child: Text('Login'),
                  onPressed: () {
                    //Navigator.of(context).pop();
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return Form1();
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
      'user_email': emailText,
      'user_password': _password,
      'user_name': username,
      'user_cnic':_cnic,
      'user_center_name':_cname,
      'user_batch_no':_bno,

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
                            "Create an account",
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
                               child: TextFormField(
                                //  controller: emailTextControler,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter Full Name';
                                  }

                                  return null;
                                },
                                onChanged: (value) {
                                  username = value;
                                },
                                // validator: (val) =>
                                //  !val.contains('@') ? 'Invalid Email' : Text("Email Saved"),
                                decoration: new InputDecoration(
                                  labelText: "Full Name",
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white70),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                                  prefixIcon: Icon(Icons.perm_identity),

                                  filled: true,
                                  fillColor: Colors.grey[200],
                                ),
                                 keyboardType: TextInputType.text,
                                //   onSaved: (val) => _email = val,               it is an other way
                            ),
                             ),
                            SizedBox(height: 10,),
                             Padding(
                               padding: const EdgeInsets.symmetric(
                                   vertical: 0.0, horizontal: 10.0),
                               child: TextFormField(
                                //  controller: emailTextControler,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter Valid Email';
                                  }

                                  return null;
                                },
                                onChanged: (value) {
                                  emailText = value;
                                },
                                // validator: (val) =>
                                //  !val.contains('@') ? 'Invalid Email' : Text("Email Saved"),
                                decoration: new InputDecoration(
                                  labelText: "Email",
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white70),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                                  prefixIcon: Icon(Icons.mail),

                                  filled: true,
                                  fillColor: Colors.grey[200],
                                ),
                                 keyboardType: TextInputType.emailAddress,
                                //   onSaved: (val) => _email = val,               it is an other way
                            ),
                             ),
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 10.0),
                              child: TextFormField(
                                //  controller: emailTextControler,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter CNIC';
                                  }

                                  return null;
                                },
                                onChanged: (value) {
                                  _cnic = value;
                                },
                                // validator: (val) =>
                                //  !val.contains('@') ? 'Invalid Email' : Text("Email Saved"),
                                decoration: new InputDecoration(
                                  labelText: "CNIC",
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white70),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                                  prefixIcon: Icon(Icons.featured_play_list),

                                  filled: true,
                                  fillColor: Colors.grey[200],
                                ),
                                keyboardType: TextInputType.numberWithOptions(),
                                //   onSaved: (val) => _email = val,               it is an other way
                              ),
                            ),
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 10.0),
                              child: TextFormField(
                                //  controller: emailTextControler,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter Center NAme';
                                  }

                                  return null;
                                },
                                onChanged: (value) {
                                  _cname = value;
                                },
                                // validator: (val) =>
                                //  !val.contains('@') ? 'Invalid Email' : Text("Email Saved"),
                                decoration: new InputDecoration(
                                  labelText: "Center Name",
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white70),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                                  prefixIcon: Icon(Icons.home),

                                  filled: true,
                                  fillColor: Colors.grey[200],
                                ),
                                keyboardType: TextInputType.text,
                                //   onSaved: (val) => _email = val,               it is an other way
                              ),
                            ),
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 10.0),
                              child: TextFormField(
                                //  controller: emailTextControler,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter Batch';
                                  }

                                  return null;
                                },
                                onChanged: (value) {
                                  _bno = value;
                                },
                                // validator: (val) =>
                                //  !val.contains('@') ? 'Invalid Email' : Text("Email Saved"),
                                decoration: new InputDecoration(
                                  labelText: "Batch No",
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white70),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                                  prefixIcon: Icon(Icons.add_circle_outline),

                                  filled: true,
                                  fillColor: Colors.grey[200],
                                ),
                                keyboardType: TextInputType.number,
                                //   onSaved: (val) => _email = val,               it is an other way
                              ),
                            ),
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 10.0),
                              child: new TextFormField(
                                obscureText: true,
                                autofocus: false,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter Pasword';
                                  }
                                  else if(value.length <8){
                                    return 'Password must be more than 8 characters';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  _password = value;
                                },
                                // validator: (val) =>
                                //  !val.contains('@') ? 'Invalid Email' : Text("Email Saved"),
                                decoration: new InputDecoration(

                                  labelText: "Password",
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white70),
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                                  prefixIcon: Icon(Icons.lock),

                                  filled: true,
                                  fillColor: Colors.grey[200],
                                ),
                                keyboardType: TextInputType.numberWithOptions(),
                                //   onSaved: (val) => _email = val,               it is an other way
                              ),
                            ),

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
                                        "Register",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),


                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  // color: Colors.red,
                                  child: SizedBox(
                                    height: 40,
                                    width: 80,
                                    child: Divider(
                                      color: Colors.grey,
                                      thickness: 0.5,

                                    ),
                                  ),
                                  //   color: Colors.blue,
                                ),

                                Container(

                                  child: SizedBox(
                                      height: 30.0,


                                      child: Text("or Login With",style: TextStyle(color: Colors.grey),)
                                  ),
                                  //   color: Colors.blue,
                                ),
                                Container(
                                  height: 20,

                                  child: SizedBox(
                                    height: 50.0,
                                    width: 80,
                                    child: Divider(
                                      color: Colors.grey,
                                      thickness: 0.5,
                                    ),
                                  ),
                                  //   color: Colors.blue,
                                ),

                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[

                                Stack(
                                  alignment: Alignment.topLeft,

                                  children: <Widget>[

                                    MaterialButton(
                                      color: Colors.blue[900],
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(20.0))),
                                      onPressed: (){

                                      },
                                      child: ClipOval(

                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12.0, horizontal: .0),

                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 25),
                                            child: Text(
                                              "Facebook",
                                              style: TextStyle(color: Colors.white),
                                            ),
                                          ),
                                        ),

                                      ),

                                    ),
                                    Positioned(
                                      top: 5,
                                      left: 2,
                                      child: CircleAvatar(

                                        backgroundColor: Colors.blue[900],
                                        radius: 19,


                                        child: ClipOval(

                                          child: Align(
                                            //  alignment: Alignment.,
                                            widthFactor: 5,
                                            child: Container(
                                              child:
                                              IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  CommunityMaterialIcons.facebook, color: Colors.white,), iconSize: 15,
                                                tooltip: 'Facebook',
                                              ),

                                            ),
                                          ),

                                        ),

                                      ),
                                    ),


                                  ],
                                ),
//                                Stack(
//                                  children: <Widget>[
//
//                                    MaterialButton(
//                                      color: Colors.blueAccent,
//                                      shape: RoundedRectangleBorder(
//                                          borderRadius:
//                                          BorderRadius.all(Radius.circular(20.0))),
//                                      onPressed: (){
//
//                                      },
//                                      child: ClipOval(
//
//                                        child: Padding(
//                                          padding: const EdgeInsets.symmetric(
//                                              vertical: 12.0, horizontal: 8.0),
//
//                                          child: Padding(
//                                            padding: const EdgeInsets.only(left: 20),
//                                            child: Text(
//                                              "Twitter",
//                                              style: TextStyle(color: Colors.white),
//                                            ),
//                                          ),
//                                        ),
//
//                                      ),
//
//                                    ),
//                                    Positioned(
//                                      top: 5,
//                                      child: CircleAvatar(
//                                        radius: 19,
//
//                                        backgroundColor: Colors.blue,
//                                        child: ClipOval(
//                                          child: Container(
//
//                                            child:
//                                            IconButton(
//                                              onPressed: () {},
//                                              icon: Icon(
//                                                CommunityMaterialIcons.twitter, color: Colors.white,), iconSize: 20,
//                                              tooltip: 'Twitter',
//                                            ),),
//
//                                        ),
//
//                                      ),
//                                    ),
//
//
//
//                                  ],
//                                ),

                              ],),
//                            Row(
//                              mainAxisAlignment: MainAxisAlignment.center,
//                              children: <Widget>[
//                              Stack(
//                                children: <Widget>[
//
//                                  MaterialButton(
//                                    color: Colors.redAccent,
//                                    shape: RoundedRectangleBorder(
//                                        borderRadius:
//                                        BorderRadius.all(Radius.circular(20.0))),
//                                    onPressed: (){
//
//                                    },
//                                    child: ClipOval(
//
//
//                                      child: Padding(
//                                        padding: const EdgeInsets.symmetric(
//                                            vertical: 12.0, horizontal: 25.0),
//
//                                        child: Text(
//                                          "Google",
//                                          style: TextStyle(color: Colors.white),
//                                        ),
//                                      ),
//
//                                    ),
//
//                                  ),
//                                  Positioned(
//                                    top: 5,
//                                    child: CircleAvatar(
//                                      radius: 19,
//                                      backgroundColor: Colors.red,
//                                      child: ClipOval(
//                                        child: Container(
//                                          child:
//                                          IconButton(
//                                            onPressed: () {},
//                                            icon: Icon(
//                                              CommunityMaterialIcons.google, color: Colors.white,), iconSize: 15,
//                                            tooltip: 'Google',
//                                          ),
//                                        ),
//
//                                      ),
//
//                                    ),
//                                  ),
//
//                                ],
//                              ),
//                            ],),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,

                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        " Already a member? ",
                                        style: TextStyle(fontSize: 12.0, color: Colors.grey),
                                      ),
                                      FlatButton(
                                        onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context){
                                          return Form1();
                                        }));
                                      },
                                        child: Text("Login here",style: TextStyle(fontSize: 12.0, color:Colors.grey),),
                                      )],
                                  ),
                                ),
                              ],)
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
