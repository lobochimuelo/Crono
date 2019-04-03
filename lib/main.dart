import 'package:flutter/material.dart';
void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRONO',
      home: crono(),
    );
  }
}

class crono extends StatefulWidget {
  @override
  _cronoState createState() => _cronoState();
}

class _cronoState extends State<crono> {
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: Align(alignment: Alignment.centerRight,
          child:Text('CRONO',
        style: TextStyle(color: Colors.black45),
      )
      ),
       elevation: 0.0,
      ),
      body: Container(decoration: BoxDecoration(color: Colors.blue[100]),
         child:Stack(
        
        children: <Widget>[
          Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            
  children: [
    Text(
            " March",
            style: TextStyle(
                color: Colors.blue[400],
                fontSize: 34.0,
                fontWeight: FontWeight.w600
            ),
          ),
           Text(
            "  Tus Actividades (horas)",
            style: TextStyle(
                color: Colors.blue[400],
                fontSize: 18.0,
                fontWeight: FontWeight.w600
            )
          )
  ]
)

        ],
      )
      ),
       floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
         
         return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
               
                content: Container(
            width: 300.0,
color: Colors.white70,          
            child: TextFormField(
  decoration: InputDecoration(
    labelText: "What is your new activity?"
  ),
)
          ),
              );
            },
          );
        },
          ),
          bottomNavigationBar: BottomAppBar(
            color: Colors.yellow,
            child: Container(height: 50.0,),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
     
    );
  }
  
}