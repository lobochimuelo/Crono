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
      theme: ThemeData.dark(
   ),
      home: crono(),
    );
  }
}

class crono extends StatefulWidget {
  @override
  _cronoState createState() => _cronoState();
}

class _cronoState extends State<crono> {
  final newAct = TextEditingController();
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
        title: Text('crono'),
        leading: IconButton(
icon:Icon(Icons.add_box),
iconSize: 40.0,
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
                                controller: newAct

                          ),
                          Container(
                            child: IconButton(
                               icon:Icon(
                                Icons.save,
                                color: Colors.teal,
                                size: 45.0,
                              ),
                             onPressed: () {addItem(Activity(title: newAct.text));
                             setState(() {
                               
                             });
                             Navigator.pop(context);
                             newAct.clear();
                             
                             }
   
                            )
                          )
                        ]
                      )));
            },
          );
        },
      




        ),//
        centerTitle: true),
      body: 
              Column(
                
                children: [
                Text(' '),
                
            Text(
              " Where do you spend more time?",
              
              style: TextStyle(
                 
                  fontSize: 20.0)
                  
                  
            ),
                            Text(' '),

        
                  Expanded(child: buildListView())
            
          ]),
     
     
        
      
    );
  }


   Widget buildListView() {
    list.sort((a,b)=>b.hours.compareTo(a.hours));

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
      onDismissed: (direction) => removeItem(item),
      direction: DismissDirection.startToEnd,
      
      child: buildListTile(item, index),
    );
  }

  Widget buildListTile(Activity item, int index){
    return Card(
      color: index%3 == 0 ? (Color(0xFF3a9679)) : (index%2==0 ? Color(0xFFfabc60) : Color(0xFFe16262)),
      margin: EdgeInsets.all(9.0),
      shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
      child:ListTile(
     
      subtitle: Container(
        color: Colors.black,
        
        child:Text(
        "hrs"+item.hours.toString(),
      )),
      title: Text(
        item.title
      ),
      trailing: 
      IconButton(
                
                             icon:Icon(
                                Icons.add_circle,
                              ),
                              color: Colors.white,
                              iconSize: 50.0,
                             onPressed: () => 
                             plusHour(item)
                             
   
                            ),
    )
      
    );
    
  }

  

  void addItem(Activity item){
    list.insert(0, item);
    saveData();
  }

  void plusHour(Activity item){
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
    list.sort((a,b)=>b.hours.compareTo(a.hours));

    }
  }

  void saveData(){
    List<String> stringList = list.map(
      (item) => json.encode(item.toMap()
    )).toList();
    sharedPreferences.setStringList('list', stringList);
  }



}
