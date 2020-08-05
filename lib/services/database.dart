import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mocak_app/models/event.dart';

class DatabaseService{
  String collection;
  DatabaseService({this.collection});
final CollectionReference currentEvents = Firestore.instance.collection('currentEvents');

final CollectionReference finishedEvents = Firestore.instance.collection('finishedEvents');

Future addEvent(String title,  String description, String declarantName,int startDate,int finishDate,String section) async{
  return await currentEvents.add({
        'title': title,
        'description': description,
        'declarantName': declarantName,
        'startDate':startDate,
        'finishDate':finishDate,
        'section':section
     });

}


  deleteCurrentEvent (id) async {
    return await  currentEvents.document(id).delete();
    }

    deleteFinishedEvent (id) async {
    return await  finishedEvents.document(id).delete();
    }

    Future finishEvent(String title,  String description, String declarantName,int startDate,int finishDate,String id,String section) async{
      currentEvents.document(id).delete();
      return await finishedEvents.add({
        'title': title,
        'description': description,
        'declarantName': declarantName,
        'startDate':startDate,
        'finishDate':finishDate,
        'section':section
     });
    }

  List<Event> _eventsListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Event(
        title: doc.data['title'] ?? '',
        description: doc.data['description'] ?? ' ',
        declarantName: doc.data['declarantName'] ?? '',
        id: doc.documentID ?? '',
        startDate: doc.data['startDate'] ?? 0,
        finishDate: doc.data['finishDate'] ?? 0,
        section: doc.data['section'] ?? ''
      );
    }).toList();
  }

  Stream<List<Event>> get events  {
      return Firestore.instance.collection(collection).orderBy('startDate', descending:true).snapshots()
        .map(_eventsListFromSnapshot);
    }

}