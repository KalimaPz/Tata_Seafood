import 'package:cloud_firestore/cloud_firestore.dart';

class ActionMenu {
  String collection_name = 'menu_list';
  FirebaseFirestore firestore_db;

  ActionMenu() {
    firestore_db = FirebaseFirestore.instance;
  }

  getAllMenu() async {
    final collection = firestore_db.collection(collection_name);
    QuerySnapshot res = await collection.get();
    final dataList = res.docs.map((doc) => doc.data()).toList();
    return dataList;
  }

  addNewMenu(
    Map<String, dynamic> data,
  ) async {
    final collection = firestore_db.collection(collection_name);
    collection
        .doc(data['name'])
        .set(data);
  }

  updateMenu() async {

  }

  deleteMenu(String docName) async {
        final collection = firestore_db.collection(collection_name);
    collection.doc(docName).delete();
        
  }
}
