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
   bool _visible = true;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: Text('CRONO',
        style: TextStyle(color: Colors.black45),
      ),
       centerTitle: true,
       elevation: 0.0,
      ),
      body: Container(decoration: BoxDecoration(color: Colors.blue[100]),
         child:Stack(
        
        children: <Widget>[
          Container(
       padding: EdgeInsets.only(left: 10.0, bottom: 10.0,right: 15.0),        
        child: Align(
          alignment: Alignment.topLeft,
          child:  Text(
            "March",
            textDirection: TextDirection.ltr,
            style: TextStyle(
                color: Colors.blue[400],
                fontSize: 34.0,
                fontWeight: FontWeight.w600
            ),
          ),
        )
    ),
    Container(
          padding: EdgeInsets.only(left: 10.0,top: 30.0, bottom: 10.0,right: 15.0),        
          child: Align(
          alignment: Alignment.topLeft,
          child:  Text(
            "Tus Actividades (horas)",
            textDirection: TextDirection.ltr,
            style: TextStyle(
                color: Colors.blue[400],
                fontSize: 18.0,
                fontWeight: FontWeight.w600
            ),
          ),
        )
    ),
    Center(
        child: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 500),
          child: Container(
            width: 200.0,
            height: 200.0,
            color: Colors.green,
          ),
        )),
        ],
      )
      ),
       floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
         
          setState(() {
            _visible = !_visible;
          });
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

