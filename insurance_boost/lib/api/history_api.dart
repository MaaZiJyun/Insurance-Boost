import 'package:cloud_firestore/cloud_firestore.dart';

class PackageApi {
  final CollectionReference col =
      FirebaseFirestore.instance.collection('history');

  Future newHistory(String event, int num, int price, String userId) async {
    return col.add({
      'event': event,
      'price': price,
      'point': num,
      'user': userId,
    });
  }
}
