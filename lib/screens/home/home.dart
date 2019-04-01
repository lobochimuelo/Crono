import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final boardTitle = Container(
        padding: EdgeInsets.all(15.0),
        child: Align(
          alignment: Alignment.topLeft,
          child:  Text(
            "Titulo",
            textDirection: TextDirection.ltr,
            style: TextStyle(
                color: Colors.blue[400],
                fontSize: 24.0,
                fontWeight: FontWeight.w600
            ),
          ),
        )
    );
    
  
    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
      child: Stack(
        children: <Widget>[
          boardTitle,
      
        ],
    )
    );
  }

}