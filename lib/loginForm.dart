
import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'recoverpage.dart';
import 'registerForm.dart';
import 'package:flutter_responsive/flutter_responsive.dart';


class Form1 extends StatefulWidget {
  @override
  _ComingSoonPageState createState() => _ComingSoonPageState();
}

class _ComingSoonPageState extends State<Form1> {
  TextEditingController _textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Container(

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
          if (constraints.maxWidth > 1000) {
               return LoginPage();
          } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1000) {
                return LoginPage();
          } else {
                     return LoginPageMobile();
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

class LoginPage extends StatefulWidget {


  @override
  _LandingPageState createState() => _LandingPageState();

}

class _LandingPageState extends State<LoginPage > {
  final emailTextControler = TextEditingController();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  int state = 0;
  String emailText;
  String _password;

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
      setState(() {

      });
      CircularProgressIndicator(
        value: 90,
      );
      AlertDialog(
        title:  Text("Email Save Successfully"),
      );
      var result = print('Email saved');
    }
    else{
      var result = print('Email not Save');
    }


    final form = formKey.currentState;
    emailTextControler.clear();


    setState(() {
      _isAddingEmail = false;
    });

    if (form.validate()) {
      form.save();


    }


    //print('Email Save');
  }

  List<Widget> pageChildren(double width) {
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
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
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
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Sign into your account",
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

                            //   onSaved: (val) => _email = val,               it is an other way
                          ),

                          SizedBox(height: 20,),
                          new TextFormField(

                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter Pasword';
                              }

                              return null;
                            },
                            onChanged: (value) {
                              emailText = value;
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

                            //   onSaved: (val) => _email = val,               it is an other way
                          ),

                 SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              MaterialButton(
                                color: Colors.green[900],
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                                onPressed: (){
                                 _submit();
                                },


                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 30.0),

                                      child: Text(
                                    "Login",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),

                              FlatButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context){
                                    return Recover();
                                  }));

                                },
                                child: Text("Forgot Password",style: TextStyle(color: Colors.grey,fontWeight:FontWeight.normal,),
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
                          Container(

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[

                                Column(
                                  children: <Widget>[
                                    Stack(
                                      alignment: Alignment.topLeft,

                                      children: <Widget>[

                                        MaterialButton(
                                          minWidth: 10,
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

                                          )
                                        ),


                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(width: 3,),
                                Column(
                                  children: <Widget>[
                                    Stack(
                                      children: <Widget>[

                                        MaterialButton(
                                          minWidth: 25,
                                          color: Colors.blueAccent,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(20.0))),
                                          onPressed: (){

                                          },
                                          child: ClipOval(

                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  vertical: 12.0, horizontal: 8.0),

                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 20,right: 10),
                                                child: Text(
                                                  "Twitter",
                                                  style: TextStyle(color: Colors.white,fontSize: 12),
                                                ),
                                              ),
                                            ),

                                          ),

                                        ),
                                        Positioned(
                                          top: 5,
                                          child: CircleAvatar(
                                            radius: 19,

                                            backgroundColor: Colors.blue,
                                            child: ClipOval(
                                              child: Container(

                                                child:
                                              IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  CommunityMaterialIcons.twitter, color: Colors.white,), iconSize: 20,
                                                tooltip: 'Twitter',
                                              ),),

                                            ),

                                          ),
                                        ),



                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(width: 3,),
                                Column(
                                  children: <Widget>[
                                    Stack(
                                      children: <Widget>[

                                        MaterialButton(

                                          color: Colors.redAccent,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.all(Radius.circular(20.0))),
                                          onPressed: (){

                                          },
                                          child: ClipOval(


                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  vertical: 12.0, horizontal: 25.0),

                                              child: Text(
                                                "Google",
                                                style: TextStyle(color: Colors.white,fontSize: 12),
                                              ),
                                            ),

                                          ),

                                        ),
                                        Positioned(
                                          top: 5,
                                          child: CircleAvatar(
radius: 19,
                                            backgroundColor: Colors.red,
                                            child: ClipOval(
                                              child: Container(
                                                child:
                                                IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    CommunityMaterialIcons.google, color: Colors.white,), iconSize: 15,
                                                  tooltip: 'Google',
                                                ),
                                              ),

                                            ),

                                          ),
                                        ),

                                      ],
                                    ),
                                  ],
                                ),
                              ],),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,

                            children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Don't have an account?  ",
                                    style: TextStyle(fontSize: 15.0, color: Colors.grey),
                                  ),
                                  FlatButton(onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context){
                                        return RegisterForm();
                                      }));

                                    },
                                    child: Text("Register here",style: TextStyle(fontSize: 15.0, color:Colors.grey),),
                                    ),
                                  ],
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



// for Mobile


class LoginPageMobile extends StatefulWidget {


  @override
  _LandingPageState1 createState() => _LandingPageState1();

}

class _LandingPageState1 extends State<LoginPageMobile > {
  final emailTextControler = TextEditingController();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  int state = 0;
  String emailText;
  String _password;

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
      setState(() {

      });
      CircularProgressIndicator(
        value: 90,
      );
      AlertDialog(
        title:  Text("Email Save Successfully"),
      );
      var result = print('Email saved');
    }
    else{
      var result = print('Email not Save');
    }


    final form = formKey.currentState;
    emailTextControler.clear();


    setState(() {
      _isAddingEmail = false;
    });

    if (form.validate()) {
      form.save();


    }


    //print('Email Save');
  }

  List<Widget> pageChildren(double width) {
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
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Sign into your account",
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

                                //   onSaved: (val) => _email = val,               it is an other way
                            ),
                             ),

                            SizedBox(height: 20,),
                             Padding(
                               padding: const EdgeInsets.symmetric(
                                   vertical: 0.0, horizontal: 10.0),
                               child: TextFormField(

                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter Pasword';
                                  }

                                  return null;
                                },
                                onChanged: (value) {
                                  emailText = value;
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

                                //   onSaved: (val) => _email = val,               it is an other way
                            ),
                             ),

                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                MaterialButton(
                                  color: Colors.green[900],
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(20.0))),
                                  onPressed: (){
                                    _submit();
                                  },


                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 30.0),

                                    child: Text(
                                      "Login",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),

                                FlatButton(
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context){
                                      return Recover();
                                    }));

                                  },
                                  child: Text("Forgot Password",style: TextStyle(color: Colors.grey,fontWeight:FontWeight.normal,fontSize: 11),
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
                            Container(

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[

                                  Column(
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
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Stack(
                                        children: <Widget>[

                                          MaterialButton(
                                            color: Colors.blueAccent,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.all(Radius.circular(20.0))),
                                            onPressed: (){

                                            },
                                            child: ClipOval(

                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(
                                                    vertical: 12.0, horizontal: 8.0),

                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 20),
                                                  child: Text(
                                                    "Twitter",
                                                    style: TextStyle(color: Colors.white),
                                                  ),
                                                ),
                                              ),

                                            ),

                                          ),
                                          Positioned(
                                            top: 5,
                                            child: CircleAvatar(
                                              radius: 19,

                                              backgroundColor: Colors.blue,
                                              child: ClipOval(
                                                child: Container(

                                                  child:
                                                  IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      CommunityMaterialIcons.twitter, color: Colors.white,), iconSize: 20,
                                                    tooltip: 'Twitter',
                                                  ),),

                                              ),

                                            ),
                                          ),



                                        ],
                                      ),
                                    ],
                                  ),

                                ],),

                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[

                                Stack(
                                  children: <Widget>[

                                    MaterialButton(
                                      color: Colors.redAccent,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(20.0))),
                                      onPressed: (){

                                      },
                                      child: ClipOval(


                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12.0, horizontal: 25.0),

                                          child: Text(
                                            "Google",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        ),

                                      ),

                                    ),
                                    Positioned(
                                      top: 5,
                                      child: CircleAvatar(
                                        radius: 19,
                                        backgroundColor: Colors.red,
                                        child: ClipOval(
                                          child: Container(
                                            child:
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                CommunityMaterialIcons.google, color: Colors.white,), iconSize: 15,
                                              tooltip: 'Google',
                                            ),
                                          ),

                                        ),

                                      ),
                                    ),

                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,

                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "Don't have an account?  ",
                                        style: TextStyle(fontSize: 12.0, color: Colors.grey),
                                      ),
                                      FlatButton(onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context){
                                          return RegisterForm();
                                        }));

                                      },
                                        child: Text("Register here",style: TextStyle(fontSize: 12.0, color:Colors.grey),),
                                      ),
                                    ],
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
