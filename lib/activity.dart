class Activity {
  String title;
  int hours;
  int clr;
  Activity({
    this.title,
    this.hours = 0,
    this.clr=0,
  });
  Activity.fromMap(Map map) :
    this.title = map['title'],
    this.hours = map['hours'],
    this.clr = map['clr'];
  Map toMap(){
    return {
      'title': this.title,
      'hours': this.hours,
      'clr': this.clr,

    };}}
