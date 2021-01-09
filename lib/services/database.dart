import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_dsi/model/aluno.dart';

class DataBaseService {
  CollectionReference todosCollection =
      FirebaseFirestore.instance.collection('pessoas');

  // Future createNewTodo(String title) async {
  //   //Create
  //   return await todosCollection.add({
  //     "title": title,
  //     "isComplet": false,
  //   });
  // }

  // Future completTask(uid) async {
  //   //Update
  //   await todosCollection.doc(uid).update({"isComplet": true});
  // }

  // Future removeTodo(uid) async {
  //   await todosCollection.doc(uid).delete();
  // }

  List<Aluno> todoFromFirestore(QuerySnapshot snapshot) {
    if (snapshot != null) {
      return snapshot.docs.map((e) {
        return Aluno(
          nome: e.data()['nome'],
          cpf: e.data()['cpf'],
          endereco: e.data()['endereco'],
          matricula: e.data()['matricula'],
        );
      }).toList();
    } else
      return null;
  }

  Stream<List<Aluno>> listTodo() {
    return todosCollection.snapshots().map(todoFromFirestore);
  }
}
