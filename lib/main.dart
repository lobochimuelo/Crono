import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:crono/activity.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  final textInput = TextEditingController();
  List<Activity> list = new List<Activity>();
  SharedPreferences sharedPreferences;
 @override
  void initState() {
    loadSharedPreferencesAndData();
    super.initState();
  }

  void loadSharedPreferencesAndData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    loadData();
  }

  

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
        
                  Expanded(child:  list.isEmpty ? emptyList() : buildListView())
            
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
                             onPressed: () {addItem(Activity(title: textInput.text));
                             setState(() {
                               
                             });
                             Navigator.pop(context);
                             
                             }
   
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
Widget emptyList(){
    return Center(
    child:  Text('No items')
    );
  }

  Widget buildListView() {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context,int index){
        return buildItem(list[index], index);
      },
    );
  }

  Widget buildItem(Activity item, index){
    return Dismissible(
      key: Key('${item.hashCode}'),
      background: Container(color: Colors.red[700]),
      onDismissed: (direction) => removeItem(item),
      direction: DismissDirection.startToEnd,
      child: buildListTile(item, index),
    );
  }

  Widget buildListTile(Activity item, int index){
    return ListTile(
      onTap: () => changeItemCompleteness(item),
      title: Text(
        item.title,
        key: Key('item-$index'),
        
      ),
      trailing: Text(
        item.hours.toString(),
        key: Key('item-$index'),
      ),
      
    );
  }

  

  void addItem(Activity item){
    // Insert an item into the top of our list, on index zero
    list.insert(0, item);
    saveData();
  }

  void changeItemCompleteness(Activity item){
    setState(() {
      item.hours ++;
    });
    saveData();
  }

  void editItem(Activity item ,String title){
    item.title = title;
    saveData();
  }

  void removeItem(Activity item){
    list.remove(item);
    saveData();
  }

  void loadData() {
    List<String> listString = sharedPreferences.getStringList('list');
    if(listString != null){
      list = listString.map(
        (item) => Activity.fromMap(json.decode(item))
      ).toList();
      setState((){});
    }
  }

  void saveData(){
    List<String> stringList = list.map(
      (item) => json.encode(item.toMap()
    )).toList();
    sharedPreferences.setStringList('list', stringList);
  }



}
