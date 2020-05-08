
import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';

//import 'constants.dart';


class Recover extends StatefulWidget {
  @override
  _ComingSoonPageState createState() => _ComingSoonPageState();
}

class _ComingSoonPageState extends State<Recover> {
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
                    child: LoginPage(),

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
        color:Colors.white,
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
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Appsol360",
                            style: TextStyle(fontSize: 30.0, color: Colors.black,fontWeight:FontWeight.bold,),
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
                            "Recover your password",
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
                                    return '';
                                  }

                                  return null;
                                },
                                onChanged: (value) {
                                  emailText = value;
                                },
                                // validator: (val) =>
                                //  !val.contains('@') ? 'Invalid Email' : Text("Email Saved"),
                                decoration: new InputDecoration(
                                  labelText: "Email Address",
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
                            Container(

                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0.0, horizontal: 10.0),
                                child: MaterialButton(


                                  color: Colors.green[900],
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(30.0))),
                                  onPressed: (){
                                    _submit();
                                  },

                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 0.0, horizontal: 5.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[

                                                 Text(
                                                  "Send Me Email",
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),

SizedBox(height: 20,)

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
