import 'package:dsc_shop/screens/homescreen.dart';
import 'package:dsc_shop/screens/login.dart';
//import 'package:dsc_shop/widgets/widgetemail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
 //String email = "mia";
 //String pass = "123";
  final  email = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();
  final phone = TextEditingController();

   final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Container(
    width: MediaQuery.of(context).size.width,
    child:SingleChildScrollView(
      child: Column(
        children: <Widget>[
              SizedBox(height: 30,),

        Text("Weclome  ",style:TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.blue[800]),),
        SizedBox(height:30),
  namefield("Name",false,Icon(Icons.person)),
      SizedBox(height:30),
  phonefield("Phone",false,Icon(Icons.phone)),
      SizedBox(height:30),
  customTextEmail("email",false,Icon(Icons.email)),
  SizedBox(height:30),
  customTextPassword("password",true,Icon(Icons.lock)),
        
      SizedBox(height: 5,),
       
        SizedBox(height:30),
        ElevatedButton(onPressed: (){
       print(name.text);
       print(phone.text);
  auth.createUserWithEmailAndPassword(email: email.text, password: password.text).then((_) => 
   Navigator.push(context, MaterialPageRoute(builder: (context)=>
      LogIn(),
      
      )),
  );

        }, 
   
        child: Text("Sign Up "),
        style: ElevatedButton.styleFrom(
primary: Colors.blue[800],
        ),
        ),
        ],

      ),
    ),
  
  
  ),
    );
     
      
    
  }
Widget namefield(hint,obsecure,icon){
return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: TextFormField(
          controller: name,
          obscureText: obsecure,
          decoration: InputDecoration(
            hintText: '$hint',
            prefixIcon: icon,
            
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)
            ),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)
            ),
            

          ),
       
      validator: (value){
        if (value.isEmpty){
          return "phone is Empty";
        }
        
      }
      

    ),
  );

}

Widget phonefield(hint,obsecure,icon){
return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: TextFormField(
          controller: phone,
          obscureText: obsecure,
          decoration: InputDecoration(
            hintText: '$hint',
            prefixIcon: icon,
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)
            ),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)
            ),
            

          ),
       
      validator: (value){
        if (value.isEmpty){
          return "name is Empty";
        }
        
      }
      

    ),
  );

}
Widget customTextEmail(hint,obsecure,icon){
return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: TextFormField(
          controller: email,
          obscureText: obsecure,
          decoration: InputDecoration(
            hintText: '$hint',
            prefixIcon: icon,
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)
            ),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)
            ),
            

          ),
       
      validator: (value){
        if (value.isEmpty){
          return "Email is Empty";
        }
        
      }
      

    ),
  );

}

Widget customTextPassword(hint,obsecure,icon){
return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: TextFormField(
          controller: password,
          obscureText: obsecure,
          
          decoration: InputDecoration(
            hintText: '$hint',
            prefixIcon: icon,
            suffixIcon: IconButton(
              icon: Icon(
                obsecure?Icons.visibility_off:Icons.visibility
              ), 
            onPressed: (){
setState(() {
  obsecure=!obsecure;
});
            }),
            //suffixIcon: icon(Icons.visibility),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)
            ),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)
            ),
            

          ),
       
      validator: (value){
        if (value.isEmpty){
          return "password is Empty";
        }
        
      }
      

    ),
  );

}
}


