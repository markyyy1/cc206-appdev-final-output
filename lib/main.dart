import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'login',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(38,50,56,1),
        body: LoginScreen()
      )
    );
  }
}


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  String pass = "toor";
  String username = "cictapps@wvsu.edu.ph";

  String animationType = "idle";

  final passwordController = TextEditingController();
  final passwordFocusNode = FocusNode();
  final userController = TextEditingController();
  final userFocusNode = FocusNode();


  @override
  void initState() {

    passwordFocusNode.addListener((){
      if(passwordFocusNode.hasFocus){
        setState(() {
          animationType="test";
        });
      }else{
        setState(() {
          animationType="idle";
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[


        SizedBox(
          height: 60,
          width: 200,
        )    ,



        Center(
          child: Container(
            height: 300,
            width: 300,

            child: CircleAvatar(
              child: ClipOval(
                child: new FlareActor("assets/teddy_test.flr", alignment: Alignment.center, fit: BoxFit.contain, animation: animationType,),
              ),
              backgroundColor: Colors.white,
            )

          ),
        ),



        SizedBox(
          height: 80,
          width: 10,
        )    ,



        Container(
          height: 140,
          width: 350,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white
          ),

          child: Column(
            children: <Widget>[

              TextFormField(
                decoration: InputDecoration(border: InputBorder.none, hintText: "User name", contentPadding: EdgeInsets.all(20)),
              ),

              Divider(),

              TextFormField(
                obscureText: true,
                decoration: InputDecoration(border: InputBorder.none, hintText: "Password", contentPadding: EdgeInsets.all(20)),
                controller: passwordController,
                focusNode: passwordFocusNode,
              ),

            ],
          ),
        ),


        Container(
          width: 350,
          height: 70,
          padding: EdgeInsets.only(top: 20),
          child: RaisedButton(
              color: Colors.pink,
              child: Text("Submit", style: TextStyle(color: Colors.white),),

              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30),
              ),
              onPressed: () {
                if(userController.text == "cictapps@wvsu.edu.ph" &&
                   passwordController.text == "toor"){
                    animationType = "success";
                  });

                }else{
                  setState(() {
                    animationType = "fail";
                  });

                }

              }
          ),
        )


      ],
    );
  }
}


