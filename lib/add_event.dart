import 'package:flutter/material.dart';
import 'package:mocak_app/decoration/decoration.dart';
import 'package:mocak_app/services/database.dart';

class AddEvent extends StatefulWidget {
  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {

String _currentTitle;
String _currentDescription;
String _currentdeclarantName;
String _currentstartDate;
String _currentfinishDate;

List<String> sections = [
  'Dyrekcja','Dział Administracji','Dział IT','Dział Księgowości','Dział Promocji','Dział Sztuki','Dział Techniczny','Dział Wiedzy o Sztuce','Dział wydawnictw','MOCAK Bookstore'
];

  @override
  Widget build(BuildContext context) {
    String _currentSection = sections[0];
int _currentDate = new DateTime.now().millisecondsSinceEpoch;

    return Scaffold(
      appBar: AppBar(
        title: Text('Dodaj zgłoszenie'),
        
      ),
      body: SingleChildScrollView(
              child: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            child: Column(
              children: <Widget>[
                //title
                TextFormField(
                    onChanged: (val) => setState(() => _currentTitle = val),
                    decoration: inputDecoration.copyWith(labelText: 'Tytuł')
                  ),
                  SizedBox(height: 10,),
                  //description
                  TextFormField(
                    onChanged: (val) => setState(() => _currentDescription = val),
                    decoration: inputDecoration.copyWith(labelText: 'Opis'),
                    minLines: 2,
                    maxLines: 6,
                    keyboardType: TextInputType.multiline,
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    onChanged: (val) => setState(() => _currentdeclarantName = val),
                    decoration: inputDecoration.copyWith(labelText: 'Zgłaszający'),
                  ),
                  SizedBox(height: 10,),
                  DropdownButtonFormField(
                    decoration: inputDecoration,
                    value: _currentSection ?? sections[0],
                    items: sections.map((section) {
                      return DropdownMenuItem(
                        value: section,
                        child: Text(section),
                      );
                    }).toList(),
                    onChanged: (val) => setState(() => _currentSection = val),
                  ),
                  SizedBox(height: 10,),
                  RaisedButton(
                    
                    padding: EdgeInsets.all(15),
                    color: Color(0xff222222),
                    child: Text('Dodaj',style: TextStyle(color: Colors.white,fontSize: 16),),
                    onPressed: (){
                      DatabaseService(collection: 'currentEvents').addEvent(_currentTitle, _currentDescription, _currentdeclarantName, _currentDate, 0,_currentSection);
                      Navigator.pop(context);
                    },
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}