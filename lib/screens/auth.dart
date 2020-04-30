import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  AuthPage({Key key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
 TextEditingController _emailController = TextEditingController();
 TextEditingController _passwordController = TextEditingController();


@override
Widget build(BuildContext context) {

  Widget _logo(){
   return Padding(
    padding: EdgeInsets.only(top:100),
    child: Container(
      child: Align(
        child: Text('TESTtext', style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: Colors.white)
        )
      )
      )
   );
  }

Widget _input(Icon icon, String hint, TextEditingController controller, bool obscure){
  return Container(
    padding: EdgeInsets.only(bottom: 20, top:10),
    child: TextField(
      controller: controller,
      style: TextStyle(fontSize:20, color: Colors.white),
      decoration: InputDecoration(
        hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white30),
        hintText: hint,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 3)
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white54, width: 1)
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: IconTheme(
            data: IconThemeData(color: Colors.white),
            child: icon
          )
        )
      ),
    ),
  );
}

  @override
  Widget _form(String label, void func()) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 20, top:10),
            child: _input(Icon(Icons.email), "EMAIL", _emailController, false)
          ),
           Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: _input(Icon(Icons.lock), "PASSWORD", _passwordController, true)
          ),
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Text(label)
            )
          )
        ],
      ),
    );
  }

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: <Widget>[
          _logo(),
          _form('LOGIN', (){}),
        ],
      )
    );
  
 }
}