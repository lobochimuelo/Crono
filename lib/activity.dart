class Activity {
  String title;
  int hours;
  String clr;
  Activity({
    this.title,
    this.hours = 0,
  });
  Activity.fromMap(Map map) :
    this.title = map['title'],
    this.hours = map['hours'];
  Map toMap(){
    return {
      'title': this.title,
      'hours': this.hours,
    };}}
