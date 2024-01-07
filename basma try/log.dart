
import 'package:flutter/material.dart';


class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  late String email;
  late String password;
  TextEditingController emailController=TextEditingController();
  TextEditingController passwoedController=TextEditingController();
  late GlobalKey<FormState>formKey;
  void initState(){
    emailController=TextEditingController();
    passwoedController=TextEditingController();
    formKey=GlobalKey<FormState>();
    super.initState();
  }
  @override


  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child:Form(
    key: formKey,

          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("login",style: TextStyle(fontSize:30,fontWeight:FontWeight.bold,)),
                SizedBox(height: 20),
                TextFormField(
                  controller:   emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "enter your email",
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),),),

                SizedBox(height: 20),
                TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  controller:   passwoedController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "enter your password",
                    labelText: "password",
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: Icon(Icons.remove_red_eye),
                    border: OutlineInputBorder(),


                  ),
                ),
                SizedBox(height: 20),
                Container(
                  child: MaterialButton(
                    color: Colors.white,
                    onPressed: (){
                     // Navigator.push(context, MaterialPageRoute(builder:(builder)=>sec(data)));
                    },
                    child: Text("login",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 20),),),
                ),

                Row(children: [
                  Text("dont have account"),
                  TextButton(onPressed: (){}, child: Text("register now"))

                ],),

           ])
                )
        )
    );
  }
}
