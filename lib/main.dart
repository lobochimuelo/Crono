import 'package:flutter/material.dart';

void main(){
final Color c = const Color.fromARGB(0xFF, 0x42, 0xA5, 0xF5);
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[100],
          title: Text(
            "CRONO",
            
            style: TextStyle(color: Colors.black45),
          ),
          centerTitle: true,
          ),
          body: CardRoom()
        ),
      )
  );

}

class CardRoom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {




    return Container(
      
    );
  }
}