import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_dsi/model/aluno.dart';

class DataBaseService {
  CollectionReference todosCollection =
      FirebaseFirestore.instance.collection('alunos');

  Future createNewAluno(Aluno aluno) async {
    //Create
    return await todosCollection.add({
      "nome": aluno.nome,
      "cpf": aluno.cpf,
      "endereco": aluno.endereco,
      "matrícula": aluno.matricula,
    });
  }

  // Future completTask(uid) async {
  //   //Update
  //   await todosCollection.doc(uid).update({"isComplet": true});
  // }

  // Future removeTodo(uid) async {
  //   await todosCollection.doc(uid).delete();
  // }

  List<Aluno> alunosFromFirestore(QuerySnapshot snapshot) {
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

  Stream<List<Aluno>> listAluno() {
    return todosCollection.snapshots().map(alunosFromFirestore);
  }
}
