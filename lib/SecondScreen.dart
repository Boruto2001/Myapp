

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

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