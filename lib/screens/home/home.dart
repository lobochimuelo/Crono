import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final boardTitle = Container(
       padding: EdgeInsets.only(left: 10.0,top: 5.0, bottom: 10.0,right: 15.0),        
        child: Align(
          alignment: Alignment.topLeft,
          child:  Text(
            "Marzo",
            textDirection: TextDirection.ltr,
            style: TextStyle(
                color: Colors.blue[400],
                fontSize: 34.0,
                fontWeight: FontWeight.w600
            ),
          ),
        )
    );
    
    final boardsubTitle = Container(
          padding: EdgeInsets.only(left: 10.0,top: 40.0, bottom: 10.0,right: 15.0),        child: Align(
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
    );
     final addFab = Positioned(
      width: 75.0,
      height: 75.0,  
    
     bottom: 10.0,
     right: 10.0,
      child: FloatingActionButton(
       
        backgroundColor: Colors.blue[100],
        child: Icon(
          Icons.add_circle_outline,
          color: Colors.red[600],
          size: 75.0,
          
        ),
        onPressed: null,
      ),
    );
    return Container(
      margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: Stack(
        children: <Widget>[
          boardTitle,
          boardsubTitle,
          addFab
      
        ],
    )
    );
  }

}