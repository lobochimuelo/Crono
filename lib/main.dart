import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:crono/activity.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(title:'CRONO',theme: ThemeData.dark(),home: crono());}}
class crono extends StatefulWidget {
  @override
  _cronoState createState() => _cronoState();}
class _cronoState extends State<crono> {
  final newAct = TextEditingController();
  List<Activity> list = new List<Activity>();
  Activity lf;int may=0;SharedPreferences sp;
 @override
  void initState() {loadSP();super.initState();}
  void loadSP() async {sp = await SharedPreferences.getInstance();loadData();}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('crono'),
        leading: IconButton(icon:Icon(Icons.add_box),iconSize: 40.0,
        onPressed: () {return showDialog(context: context,builder: (context) {
              return AlertDialog( content:Container(height: 130.0,
              child:ListView(children: [
              TextFormField(
              decoration: InputDecoration(
              labelText: "What is your new activity?"),
              controller: newAct),
              Container(child: IconButton(icon:Icon(Icons.save,color: Colors.teal,size: 45.0,),
              onPressed: () { addItem(Activity(title: newAct.text,clr: list.length%3 == 0 ? (1) : (list.length%2==0 ? 2 : 3)));
               setState((){});Navigator.pop(context); newAct.clear();}))])));}
        );})),
      body:Column(children: [
      
        Text(' '),Text(" Where do you spend more time?",style: TextStyle(fontSize: 20.0)),Text(' '),
        Expanded(child: buildListView())]),);}
   Widget buildListView() {
    return ListView.builder(itemCount: list.length,
      itemBuilder: (BuildContext context,int index){
        return buildItem(list[index], index);});}
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
      margin: EdgeInsets.all(9.0),
      shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
      child:Column(
        children: <Widget>[
ListTile(
      title: Text(
        item.title
      ),
      trailing: 
      IconButton(icon:Icon(Icons.add_circle,),color: Colors.white,
      iconSize: 50.0,onPressed: () {plusHour(item);})),
    Align(alignment: Alignment.topLeft,
     child: Container(
       margin: EdgeInsets.only(bottom: 5, right: 5, left: 5),
       
        width: item.hours<3 ? 40 :((item.hours/may)*300)<40 ?40 :  (item.hours/may)*300,
        decoration: new BoxDecoration(
               color: item.clr==1 ? (Color(0xFF3a9679)) : (item.clr==2 ? Color(0xFFfabc60) : Color(0xFFe16262)),
          borderRadius: BorderRadius.all(Radius.circular(10.0))
      ),        
        child:Text(
        " hrs: "+item.hours.toString(),
      )))]));
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
    loadData();
  }
  void removeItem(Activity item){
    list.remove(item);
    saveData();
  }
  void loadData() {
    List<String> listString = sp.getStringList('list');
    if(listString != null){
      list = listString.map(
        (item) => Activity.fromMap(json.decode(item))
      ).toList();
      setState((){});
    list.sort((a,b)=>b.hours.compareTo(a.hours));
    }
    lf=list.first;
     may=lf.hours;
  }
  void saveData(){
    List<String> stringList = list.map(
      (item) => json.encode(item.toMap()
    )).toList();
    sp.setStringList('list', stringList);
  }
}
