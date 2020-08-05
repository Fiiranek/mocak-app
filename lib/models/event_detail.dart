import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mocak_app/models/event.dart';

class EventDetail extends StatelessWidget {
  Event event;
  EventDetail({this.event});
  final f = DateFormat('yyyy-MM-dd');
  List<String> months = ['styczeń','luty','marzec','kwiecień','maj','czerwiec','lipiec','sierpień','wrzesień''październik','listopad','grudzień'];



  @override
  Widget build(BuildContext context) {
    String finishMonth;
String finishDay;
String finishYear;
String finishDateToDisplay;
    DateTime startDate =
        DateTime.fromMillisecondsSinceEpoch(event.startDate + 3600000);
        DateTime finishDate =
        DateTime.fromMillisecondsSinceEpoch(event.finishDate + 3600000);
        String startMonth = months[startDate.month];
        String startDay = startDate.day.toString();
        String startYear = startDate.year.toString();finishMonth = months[finishDate.month];
          finishDay = finishDate.day.toString();
          finishYear = finishDate.year.toString();
        if(event.finishDate==0){
         finishDateToDisplay = "-";
        }
        else{
          finishDateToDisplay = finishDay+" "+finishMonth+" "+finishYear;
        }
        
    String startDateToDisplay = startDay+" "+startMonth+" "+startYear;
    return Scaffold(
      appBar: AppBar(
        title: Text('Szczegóły'),
      ),
      body: SingleChildScrollView(
              child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(event.title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
            Container(
              height: 1,
              color: Color(0xff222222),
            ),
             SizedBox(height: 10,),
              Row(
              children: <Widget>[
                Icon(FontAwesomeIcons.fileAlt,size: 30,),
                SizedBox(width: 10,),
                SingleChildScrollView(
                                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                    Text('Opis',style: TextStyle(fontWeight: FontWeight.bold),),SizedBox(height: 10,),
              Text( event.description,textAlign: TextAlign.left,),
                  ],),
                )
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: <Widget>[
                Icon(FontAwesomeIcons.calendarDay,size: 30,),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  Text('Data zgłoszenia',style: TextStyle(fontWeight: FontWeight.bold),),SizedBox(height: 10,),
              Text( startDateToDisplay),
                ],)
              ],
            ),

        SizedBox(height: 20,),
            Row(
              children: <Widget>[
                Icon(FontAwesomeIcons.calendarWeek,size: 30,),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  Text('Data zakończenia',style: TextStyle(fontWeight: FontWeight.bold),),SizedBox(height: 10,),
              Text( finishDateToDisplay),
                ],)
              ],
            ),

            SizedBox(height: 20,),
            
            Row(
              children: <Widget>[
                Icon(Icons.person,size: 30,),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  Text('Zgłaszający',style: TextStyle(fontWeight: FontWeight.bold),),SizedBox(height: 10,),
              Text( event.declarantName ),
                ],)
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: <Widget>[
                Icon(FontAwesomeIcons.building,size: 30,),
                
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  Text('Dział',style: TextStyle(fontWeight: FontWeight.bold),),SizedBox(height: 10,),
              Text( event.section ),
                ],)
              ],
            ),
            ],),
          
        ),
      ),
    );
  }
}