import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';


void main() => runApp(MyApp());

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
  List data;
  final textInput = TextEditingController();
  File jsonFile;
  Map<String, String> fileContent;

   
  
void writeToFile(String act){
  
    
    Map<String, String> content = {"activity": act,"hours":"0"};
      
      Map<String, String> jsonFileContent = json.decode(jsonFile.readAsStringSync());
      jsonFileContent.addAll(content);
      jsonFile.writeAsStringSync(json.encode(jsonFileContent));  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        title: Align(
            alignment: Alignment.centerRight,
            child: Text(
              'CRONO',
              style: TextStyle(color: Colors.black45),
            )),
        elevation: 0.5,
      ),
      body: Container(
          decoration: BoxDecoration(color: Colors.blue[100]),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Text(
              " March",
              style: TextStyle(
                  color: Colors.blue[400],
                  fontSize: 34.0,
                  fontWeight: FontWeight.w600),
            ),
            Text("  Tus Actividades (horas)",
                style: TextStyle(
                    color: Colors.blue[400],
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600)),
            Expanded(
                child: Container(
              // Use future builder and DefaultAssetBundle to load the local JSON file
              child: new FutureBuilder(
                  future: DefaultAssetBundle.of(context)
                      .loadString('data_repo/data.json'),
                  builder: (context, snapshot) {
                    // Decode the JSON
                    var new_data = json.decode(snapshot.data.toString());

                    return new ListView.builder(
                      // Build the ListView
                      itemBuilder: (BuildContext context, int index) {
                        return new Card(
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              new Text("Name: " + new_data[index]['activity']),
                              new Text("Height: " + new_data[index]['hours']),
                            ],
                          ),
                        );
                      },
                      itemCount: new_data == null ? 0 : new_data.length,
                    );
                  }),
            ))
          ])),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[500],
        elevation: 0.0,
        child: Icon(Icons.add, color: Colors.white, size: 50.0),
        onPressed: () {
          return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                  content: Container(
                      height: 140.0,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                                labelText: "What is your new activity?"),
                                controller: textInput

                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15.0),
                            child: FloatingActionButton(
                              backgroundColor: Colors.blue,
                              child: Icon(
                                Icons.save,
                                color: Colors.white,
                                size: 45.0,
                              ),
                              onPressed: ()=>writeToFile(this.textInput.text)
   
                            ),
                          )
                        ],
                      )));
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}




