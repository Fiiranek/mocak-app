import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mocak_app/models/event.dart';
import 'package:mocak_app/models/event_detail.dart';
import 'package:mocak_app/services/database.dart';

class CurrentEventTile extends StatefulWidget {
  @override
  _CurrentEventTileState createState() => _CurrentEventTileState();
  Event event;
  CurrentEventTile({this.event});
}

class _CurrentEventTileState extends State<CurrentEventTile> {
  
  @override
  Widget build(BuildContext context) {

    int _currentDate = new DateTime.now().millisecondsSinceEpoch;

    Event event = widget.event;
  return Slidable(
  actionPane: SlidableDrawerActionPane(),
  actionExtentRatio: 0.25,
  child: Container(
    color: Colors.white,
    child: ListTile(
      // leading: CircleAvatar(
        
      //   foregroundColor: Colors.white,
      // ),
       onTap: (){
        Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EventDetail(event: event,)),
            );
      },
      title: Text(event.title),
      subtitle: Text(event.declarantName),
    ),
  ),
  secondaryActions: <Widget>[
    IconSlideAction(
      caption: 'Ukończ',
      color: Colors.green,
      icon: Icons.done,
      onTap: () => DatabaseService(collection: 'currentEvents').finishEvent(event.title, event.description, event.declarantName, event.startDate, _currentDate, event.id,event.section),
    ),
    IconSlideAction(
      caption: 'Usuń',
      color: Colors.red,
      icon: Icons.delete,
      onTap: () => DatabaseService(collection: 'currentEvents').deleteCurrentEvent(event.id),
    ),
  ],
);

  }
}