import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:flutter/cupertino.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  @override
  Widget build(BuildContext context) {
      Size size=MediaQuery.of(context).size;
    return Scaffold(
      body:Center(
        child: ListView(
          children:  [Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: [
            Container(
              padding: EdgeInsets.only(top: 20.0),
             child: Image.asset("assests/go.jpg")
            ),
               SizedBox(
                  height: 45,
                ),
              Container(
               width:size.width*0.8,
               padding: EdgeInsets.only(top: 30.0),
               child: ClipRRect(
                 borderRadius:BorderRadius.circular(30) ,
                 child: ElevatedButton(onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder:(context)=> SecondScreen()
                 ));
                 },
                   child: Text("LOGIN",style: TextStyle(color: Colors.white),),),
                 ),
              
              ),
              
              Container(
                 padding: EdgeInsets.only(top: 30.0),
                width:size.width*0.8,
               
               child: ClipRRect(
                 borderRadius:BorderRadius.circular(30) ,
                 child: ElevatedButton(onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder:(context)=> ThirdScreen()
                 ));
                 },
                   child: Text("REGISTER",style: TextStyle(color: Colors.white),),),
                 ),
              )
             
            ],),
          ]),
      )
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
//------------------------------------------------------------------//
class SecondScreen extends StatefulWidget {
  const SecondScreen({ Key? key }) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  
   
    GlobalKey <FormState> formkey=GlobalKey<FormState>();
  
   

    String validatepass(value)
    {
        if(value.isEmpty)
        {
          return "Required*";
        }
        else if(value.length<6 && value.length>15)
        {
                return "ERROR";         
        }
        else{
          return "Correct";
        }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900]
        ,),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Center(
          child: Form(
            autovalidate: true,
            key: formkey,
            child:ListView(
              children: [ Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    CircleAvatar(
                      radius: 70,
                      child: Image.asset("assests/login.jpg"),
                    ),
                  TextFormField(
                      decoration: InputDecoration(
                   hintText:"EMAIL ID",
                   hintStyle: TextStyle(color: Colors.black,fontSize: 20),
                   border: OutlineInputBorder(),
                   labelText: "Email",
                   prefixIcon: Icon(Icons.message)
                 ),
                 
                 validator: MultiValidator(
                    [
                      RequiredValidator(errorText: "Required*"),
                      EmailValidator(errorText: "Not a Valid Email"),
                    ]
                 ),
               
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: TextFormField(
                           decoration: InputDecoration(
                   hintText:"Password",
                   hintStyle: TextStyle(color: Colors.black,fontSize: 20),
                   border: OutlineInputBorder(),
                   labelText: "PASSWORD",
                   prefixIcon: Icon(Icons.security)
                 ),
                 validator: validatepass,
                    ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                         onPressed: (){
                           if(formkey.currentState!.validate()){
                              
                           }
                           Navigator.push(context, MaterialPageRoute(builder:(context)=> FourthScreen()));
                          },
                         child: Text("Login"),
                    ),
                    ),
                ],
              ),
              ]) 
            ),
        ),
      
      ),

    );
  }
}
//----------------------------------------------------------------------------------------//
class ThirdScreen extends StatefulWidget {
  const ThirdScreen({ Key? key }) : super(key: key);

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {

    GlobalKey <FormState> formkey=GlobalKey<FormState>();

   

    String validatepass(value)
    {
        if(value.isEmpty)
        {
          return "Required*";
        }
        else if(value.length<6 && value.length>15)
        {
                return "ERROR";         
        }
        else{
          return "Correct";
        }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900]
        ,),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Center(
          child: Form(
            autovalidate: true,
            key: formkey,
            child:ListView(
              children: [ Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Positioned(
                      top: 20,
                      child: Image.asset("assests/Register.png"),
                    ),
                  TextFormField(
                   decoration: InputDecoration(
                   hintText:"DISPLAY NAME",
                   hintStyle: TextStyle(color: Colors.black,fontSize: 20),
                   border: OutlineInputBorder(),
                   prefixIcon: Icon(Icons.person)
                 ),
                 
                 validator: validatepass,
                  ),
                 
                  Padding(
                    padding:  EdgeInsets.only(top: 20),
                    child: TextFormField(
                        decoration: InputDecoration(
                     hintText:"EMAIL ID",
                     hintStyle: TextStyle(color: Colors.black,fontSize: 20),
                     border: OutlineInputBorder(),
                   
                     prefixIcon: Icon(Icons.message)
                 ),
                 
                 validator: MultiValidator(
                      [
                        RequiredValidator(errorText: "Required*"),
                        EmailValidator(errorText: "Not a Valid Email"),
                      ]
                 ),
                    ),
                  ),
                 
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: TextFormField(
                           decoration: InputDecoration(
                   hintText:"Password",
                   hintStyle: TextStyle(color: Colors.black,fontSize: 20),
                   border: OutlineInputBorder(),
                 
                   prefixIcon: Icon(Icons.security)
                 ),
                 validator: validatepass,
                    ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                         onPressed: (){
                           if(formkey.currentState!.validate()){
                             
                           }
                        Navigator.push(context, MaterialPageRoute(builder:(context)=> FifthScreen()
                 ));
                          },
                         child: Text("Create Account"),
                    ),
                    ),
                ],
              ),
              ]) 
            ),
        ),
      
      ),

    );
  }
}
//-----------------------------------------------------------------------//
class FourthScreen extends StatefulWidget {
  const FourthScreen({ Key? key }) : super(key: key);

  @override
  _FourthScreenState createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title:Text("Welcome Customer,Logged In"),
      backgroundColor: Colors.deepOrange,
       actions: [
         Icon(Icons.arrow_forward_sharp)
       ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors:<Color>[
                  Colors.deepOrange,
                  Colors.orangeAccent,
                  
                  ]
                 
                  )

              ),
              child: Column(
                children: [
                  Center(child: 
                  
                  Text("9876543210",style: TextStyle(color: Colors.green,fontSize: 30),)),
                  
                ],
              ),
              
             // currentAccountPicture: CircleAvatar(
               // child: ClipOval(child: Icon(Icons.contact_mail),),
              
              
              ),
            ListTile(
              leading: Icon(Icons.menu),
              title: Text("Order History"),
               trailing: Icon(Icons.arrow_forward_ios_outlined),
              onTap: (){

              },
             
            ),
            Divider(thickness: 2,color: Colors.red,),
            ListTile(
              leading: Icon(Icons.call),
              title: Text("Help & Support"),
               trailing: Icon(Icons.arrow_forward_ios_outlined),
               onTap: (){
                
              },
              
            ),
            Divider(thickness: 2,color: Colors.red,),
            ListTile(
              leading: Icon(Icons.update),
              title: Text("Updates"),
              
               onTap: (){
                
              },
               trailing: ClipOval(
                child: Container(
                  color: Colors.red,
                  width: 20,
                  height: 20,
                  child: Center(child: Text(
                    "9",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white
                    ),
                  ),
                  
                  ),
                ),
              ),
              
            ),
            Divider(thickness: 2,color: Colors.red,),
            ListTile(
             leading: Icon(Icons.logout),
              title: Text("Logout"),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
               onTap: (){
                 showDialog(context: context, builder: (context){
                 return AlertDialog(
                   
                   content: Text("Are You Sure you want to Logout ?"),
                   actions: [
                     ElevatedButton(onPressed: (){

                     },
                       child: Text("No"),),
                       ElevatedButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder:(context)=> MyHomePage(title: "Logged Out",)));
                       },
                       child: Text("Yes,Logout"),
                       )
                   ],
                 );
               });
              },
              
            ),
            

             Divider(thickness: 2,color: Colors.red,),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
               trailing: Icon(Icons.arrow_forward_ios_outlined),
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder:(context)=> SeventhScreen()
               ));
              },
              
            ),
             Divider(thickness: 2,color: Colors.red,),
          ],
        ),
      ),
    );
  }
}
//-------------------------------------------------------------------------------------------//

class FifthScreen extends StatefulWidget {
  const FifthScreen({ Key? key }) : super(key: key);

  @override
  _FifthScreenState createState() => _FifthScreenState();
}

class _FifthScreenState extends State<FifthScreen> {

    GlobalKey <FormState> formkey=GlobalKey<FormState>();

   

    String validatepass(value)
    {
        if(value.isEmpty)
        {
          return "Required*";
        }
        else if(value.length<6 && value.length>15)
        {
                return "ERROR";         
        }
        else{
          return "Correct";
        }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text("Account"),
        backgroundColor: Colors.green[900],
        ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Center(
          child: Form(
            autovalidate: true,
            key: formkey,
            child:ListView(
              children: [ Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    CircleAvatar(
                      radius: 70,
                      child:Icon(Icons.person),
                    ),
                     Container(
               child: Text("9988776655",style: TextStyle(fontSize: 15),),
             ),
                  TextFormField(
                      decoration: InputDecoration(
                   hintText:"Your Name",
                   hintStyle: TextStyle(color: Colors.black,fontSize: 20),
                   border: OutlineInputBorder(),
                   
                   prefixIcon: Icon(Icons.person)
                 ),
                   validator: validatepass,
                
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: TextFormField(
                           decoration: InputDecoration(
                   hintText:"Email ID",
                   hintStyle: TextStyle(color: Colors.black,fontSize: 20),
                   border: OutlineInputBorder(),
                   
                   prefixIcon: Icon(Icons.email_rounded),
                 ),
                 validator: MultiValidator(
                      [
                        RequiredValidator(errorText: "Required*"),
                        EmailValidator(errorText: "Not a Valid Email"),
                      ]
                 ),
                    ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                         onPressed: (){
                           if(formkey.currentState!.validate()){
                              
                           }
                              Navigator.push(context, MaterialPageRoute(builder:(context)=> SixthScreen()
               ));
                          },
                         child: Text("ADD ADDRESS"),
                    ),
                    ),
                ],
              ),
              ]) 
            ),
        ),
      
      ),

    );
  }
}
//-------------------------------------------------------------------------//
class SixthScreen extends StatefulWidget {
  const SixthScreen({ Key? key }) : super(key: key);

  @override
  _SixthScreenState createState() => _SixthScreenState();
}

class _SixthScreenState extends State<SixthScreen> {

    GlobalKey <FormState> formkey=GlobalKey<FormState>();

   

    String validatepass(value)
    {
        if(value.isEmpty)
        {
          return "Required*";
        }
        else if(value.length<6 && value.length>15)
        {
                return "ERROR";         
        }
        else{
          return "Correct";
        }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: Text("Add Address"),
        backgroundColor: Colors.green[800],
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Center(
          child: Form(
            autovalidate: true,
            key: formkey,
            child:ListView(
              children: [ Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    
                   
                  TextFormField(
                      decoration: InputDecoration(
                   hintText:"FULL Name",
                   hintStyle: TextStyle(color: Colors.black,fontSize: 20),
                   border: OutlineInputBorder(),
                   
                   prefixIcon: Icon(Icons.person)
                 ),
                   validator: validatepass,
                
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: TextFormField(
                           decoration: InputDecoration(
                   hintText:"HOUSE NO/BUILDING NAME",
                   hintStyle: TextStyle(color: Colors.black,fontSize: 20),
                   border: OutlineInputBorder(),
                   
                   prefixIcon: Icon(Icons.home_filled),
                   

                 ),
                 validator: validatepass,
                    ),
                    ),

                     Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: TextFormField(
                           decoration: InputDecoration(
                   hintText:"Locality",
                   hintStyle: TextStyle(color: Colors.black,fontSize: 20),
                   border: OutlineInputBorder(),
                   
                   prefixIcon: Icon(Icons.streetview_sharp),
                   

                 ),
                 validator: validatepass,
                    ),
                    ),
                     Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: TextFormField(
                           decoration: InputDecoration(
                   hintText:"City",
                   hintStyle: TextStyle(color: Colors.black,fontSize: 20),
                   border: OutlineInputBorder(),
                   
                   prefixIcon: Icon(Icons.location_city,),
                   

                 ),
                 maxLines: 3,
                 validator: validatepass,
                    ),
                    ),
                     Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: TextFormField(
                           decoration: InputDecoration(
                   hintText:"Pincode",
                   hintStyle: TextStyle(color: Colors.black,fontSize: 20),
                   border: OutlineInputBorder(),
                   
                   prefixIcon: Icon(Icons.home_filled),
                   

                 ),
                          keyboardType: TextInputType.number,
                 validator: validatepass,
                    ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                         onPressed: (){
                           if(formkey.currentState!.validate()){
                              
                           }
                           
               
                          },
                         child: Text("ADD ADDRESS"),
                    ),
                    ),
                ],
              ),
              ]) 
            ),
        ),
      
      ),

    );
  }
}

//---------------------------------------------------------------------------//
class SeventhScreen extends StatefulWidget {
  const SeventhScreen({ Key? key }) : super(key: key);

  @override
  _SeventhScreenState createState() => _SeventhScreenState();
}

class _SeventhScreenState extends State<SeventhScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        
        
      backgroundColor: Colors.deepOrange,
      
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors:<Color>[
                  Colors.deepOrange,
                  Colors.orangeAccent,
                  
                  ]
                 
                  )

              ),
              child: Column(
                children: [
                  Center(child: 
                  
                  Text("9876543210",style: TextStyle(color: Colors.green,fontSize: 30),)),
                  
                ],
              ),
              
             // currentAccountPicture: CircleAvatar(
               // child: ClipOval(child: Icon(Icons.contact_mail),),
              
              
              ),
            ListTile(
              leading: Icon(Icons.people,),
              title: Text("Refer a Friend"),
               trailing: Icon(Icons.arrow_forward_ios_outlined),
              onTap: (){

              },
             
            ),
            Divider(thickness: 2,color: Colors.red,),
            ListTile(
              leading: Icon(Icons.menu_book_outlined),
              title: Text("Purchase History"),
               trailing: Icon(Icons.arrow_forward_ios_outlined),
               onTap: (){
                
              },
              
            ),
           
            
            Divider(thickness: 2,color: Colors.red,),
            ListTile(
             leading: Icon(Icons.logout),
              title: Text("Logout"),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
               onTap: (){
               showDialog(context: context, builder: (context){
                 return AlertDialog(
                 
                   content: Text("Are You sure you Want to Logout"),
                   actions: [
                     ElevatedButton(onPressed: (){},
                       child: Text("No"),),
                       ElevatedButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder:(context)=> MyHomePage(title: "Logged Out",)));
                       },
                       child: Text("Yes,Logout"),
                       )
                   ],
                 );
               });
              },
              
            ),
            

             Divider(thickness: 2,color: Colors.red,),
            ListTile(
              leading: Icon(Icons.info),
              title: Text("Tutorial"),
               trailing: Icon(Icons.arrow_forward_ios_outlined),
               onTap: (){
                
              },
              
            ),
             Divider(thickness: 2,color: Colors.red,),
          ],
        ),
      ),
      
    );
  }
}
