
import 'package:dsc_shop/screens/homescreen.dart';
import 'package:dsc_shop/screens/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:dsc_shop/widgets/widgetemail.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(LogIn());
 
	
 
class LogIn extends StatefulWidget {
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
   final  email = TextEditingController();
  final password = TextEditingController();


   final auth = FirebaseAuth.instance;
class _MyHomePageState extends State<LogIn> {
     bool checkBoxVal  = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            resizeToAvoidBottomInset: false,

      appBar: AppBar(
        
    backgroundColor: Colors.blue[800],
    elevation: 20,
    
        title: Text("Buy ",style: 
        TextStyle(fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white),),
        
        leading: Icon(Icons.backup_outlined),
        centerTitle: true,
        actions: [
          Icon(Icons.add_shopping_cart)
        ],
  
        //SizedBox(width: 10.0,), 

      ),
  body: Container(
    width: MediaQuery.of(context).size.width,
    child:SingleChildScrollView(
     // scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          Image.network("https://www.crushpixel.com/big-static16/preview4/shopping-cart-blue-rgb-color-2238956.jpg",width:MediaQuery.of(context).size.width*.5,height: MediaQuery.of(context).size.height*.3,),
        Text("Weclome Back ",style:TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.blue[800]),),
        SizedBox(height:30),
  customTextEmail("email",false,Icon(Icons.email)),
  SizedBox(height:30),
  customTextPassword("password",true,Icon(Icons.lock)),
        
      SizedBox(height: 5,),
        Padding(
          padding: const EdgeInsets.only(left:25),
          child: Row(
children: [
Text("Do not have am account? ",style:TextStyle(fontSize: 17)),
GestureDetector(
  onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>
      SignUp(),
      
      ));
  },
  child: Text("Sign Up",style:TextStyle(fontSize: 20,fontWeight:FontWeight.bold,color :Colors.blue[800])))

],
          ),
        ),
        SizedBox(height:30),
        ElevatedButton(onPressed: (){
          auth.signInWithEmailAndPassword(email: email.text, password: password.text).then((_) =>   
          Navigator.push(context, MaterialPageRoute(builder: (context)=>
      HomeScreen(),
      
      )),);
         
        }, 
  
        child: Text("Login "),
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
Widget customTextEmail(hint,obsecure,icon){
return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: TextFormField(
          controller: email,
          obscureText: obsecure,
          decoration: InputDecoration(
            hintText: '$hint',
            //prefixIcon: icon,
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
                obsecure?Icons.visibility:Icons.visibility_off
              ), 
            onPressed: (){
setState(() {
  obsecure=!obsecure;
});
            }),
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
