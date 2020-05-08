
import 'package:flutter/material.dart';

import 'loginForm.dart';
import 'registerForm.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter_forms',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Montserrat"),
      home:Form1(),
    );
  }
}


class FrontPage extends StatefulWidget {
  @override
  _ComingSoonPageState createState() => _ComingSoonPageState();
}

class _ComingSoonPageState extends State<FrontPage> {
  TextEditingController _textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Container(
          height: 900,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              //    begin: Alignment.centerLeft,
              //    end: Alignment.centerRight,
                colors: [
                  //  Colors.white70,
                  //  Colors.white70,
                  Color.fromRGBO(195, 20, 50, 1.0),
                  Color.fromRGBO(36, 11, 54, 1.0)
                ]),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  // Navbar(  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 0.0),
                      child:  LayoutBuilder(
                        builder: (context, constraints) {
                          if (constraints.maxWidth > 1200) {
                            return main1 ();
                          } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
                            return main1 ();
                          } else {
                            return main2();
                          }
                        },

                      )




                    //TopicVideoPage(),
                  )
                ],
              ),
            ),
          ),
          //  height: 900,
        ),
      ),
    );
  }
}

class main1 extends StatefulWidget {


  @override
  _LandingPageState createState() => _LandingPageState();

}

class _LandingPageState extends State<main1  > {
  final emailTextControler = TextEditingController();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();
  bool checkbox = false;
  int state = 0;
  String emailText;
  String password;
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
      Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child:
            Column(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.all(20.0),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            // Navbar(  ),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image(image: AssetImage('image/appsol.png'),width: 150,)

                                  ],
                                )

                              //TopicVideoPage(),
                            ),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 40.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text("Appsol360",style: TextStyle(fontSize: 50, color: Colors.white, fontWeight: FontWeight.bold),),

                                  ],
                                )

                              //TopicVideoPage(),
                            ),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text("Student Data Collection",style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),),

                                  ],
                                )

                              //TopicVideoPage(),
                            ),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 40.0),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[

                                            Container(
                                              width: 265,



                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: <Widget>[
                                                  MaterialButton(
                                                    minWidth: 265,
                                                    color: Colors.black,
                                                    onPressed: (){
                                                      Navigator.push(context, MaterialPageRoute(builder: (context){
                                                        return Form1();
                                                      }));

                                                    },
                                                    child: Text("Login",style: TextStyle(fontSize: 20,color: Colors.white),),),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),





                                      ],
                                    ),

SizedBox(height: 20,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[

                                            Container(
                                              width: 265,



                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: <Widget>[
                                                  MaterialButton(
                                                    minWidth: 265,
                                                    color: Colors.black,
                                                    onPressed: (){
                                                      Navigator.push(context, MaterialPageRoute(builder: (context){
                                                        return RegisterForm();
                                                      }));

                                                    },
                                                    child: Text("Register",style: TextStyle(fontSize: 20,color: Colors.white),),),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),





                                      ],
                                    ),
                                  ],
                                )

                              //TopicVideoPage(),
                            ),






                            //                ),
                          ],
                        ),
                      ),
                    ],
                  ),


                ),
              ],
            ),
          ),
        ],
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

// mobile

class main2 extends StatefulWidget {


  @override
  _LandingPageState1 createState() => _LandingPageState1();

}

class _LandingPageState1 extends State<main2  > {
  final emailTextControler = TextEditingController();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();
  bool checkbox = false;
  int state = 0;
  String emailText;
  String password;
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
      Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child:
            Column(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 0.0, horizontal: 10.0),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            // Navbar(  ),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image(image: AssetImage('image/appsol.png'),width: 80,)

                                  ],
                                )

                              //TopicVideoPage(),
                            ),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 20.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text("Appsol360",style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),),

                                  ],
                                )

                              //TopicVideoPage(),
                            ),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20.0, horizontal: 20.0),
                                      child: Text("Student Data Collection",style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),),
                                    ),

                                  ],
                                )

                              //TopicVideoPage(),
                            ),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Column(
                                      children: <Widget>[
                                        Container(
                                        //  width: 280,
                                       //   height: 160,
//                                          decoration: BoxDecoration(
//                                              image: DecorationImage(
//                                                image: AssetImage("image/Form1.png"),
//                                                fit: BoxFit.cover,
//                                              )
//                                          ),


                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[

                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: 280,



                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              MaterialButton(
                                                minWidth: 280,
                                                color: Colors.black,
                                                onPressed: (){
                                                  Navigator.push(context, MaterialPageRoute(builder: (context){
                                                    return Form1();
                                                  }));

                                                },
                                                child: Text("Login",style: TextStyle(fontSize: 20,color: Colors.white),),),

                                              SizedBox(height: 20,),
                                              MaterialButton(
                                                minWidth: 280,
                                                color: Colors.black,
                                                onPressed: (){
                                                  Navigator.push(context, MaterialPageRoute(builder: (context){
                                                    return RegisterForm();
                                                  }));

                                                },
                                                child: Text("Register",style: TextStyle(fontSize: 20,color: Colors.white),),),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),


                                  ],
                                )

                              //TopicVideoPage(),
                            ),











                            //                ),
                          ],
                        ),
                      ),
                    ],
                  ),


                ),
              ],
            ),
          ),
        ],
      ),



    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 00) {
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

