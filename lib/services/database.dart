import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_dsi/model/aluno.dart';
import 'package:project_dsi/model/professor.dart';

class DataBaseServiceAluno {
  CollectionReference todosCollection =
      FirebaseFirestore.instance.collection('alunos');

  Future createNewAluno(Aluno aluno) async {
    //Create
    return await todosCollection.add({
      "nome": aluno.nome,
      "cpf": aluno.cpf,
      "endereco": aluno.endereco,
      "matricula": aluno.matricula,
    });
  }

  Future updateAluno(uid, Aluno aluno) async {
    //Update
    await todosCollection.doc(uid).update({"nome": aluno.nome});
    await todosCollection.doc(uid).update({"cpf": aluno.cpf});
    await todosCollection.doc(uid).update({"endereco": aluno.endereco});
    await todosCollection.doc(uid).update({"matricula": aluno.matricula});
  }

  Future removeAluno(uid) async {
    //delete
    await todosCollection.doc(uid).delete();
  }

  List<Aluno> alunosFromFirestore(QuerySnapshot snapshot) {
    //read
    if (snapshot != null) {
      return snapshot.docs.map((e) {
        return Aluno(
          nome: e.data()['nome'],
          cpf: e.data()['cpf'],
          endereco: e.data()['endereco'],
          matricula: e.data()['matricula'],
          id: e.id,
        );
      }).toList();
    } else
      return null;
  }

  Stream<List<Aluno>> listAluno() {
    return todosCollection.snapshots().map(alunosFromFirestore);
  }
}

class DataBaseServiceProfessor {
  CollectionReference todosCollection =
      FirebaseFirestore.instance.collection('professores');

  Future createNewProfessor(Professor professor) async {
    //Create
    return await todosCollection.add({
      "nome": professor.nome,
      "cpf": professor.cpf,
      "endereco": professor.endereco,
      "turmas": professor.turmas,
    });
  }

  Future updateProfessor(uid, Professor professor) async {
    //Update
    await todosCollection.doc(uid).update({"nome": professor.nome});
    await todosCollection.doc(uid).update({"cpf": professor.cpf});
    await todosCollection.doc(uid).update({"endereco": professor.endereco});
    await todosCollection.doc(uid).update({"turmas": professor.turmas});
  }

  Future removeProfessor(uid) async {
    //delete
    await todosCollection.doc(uid).delete();
  }

  List<Professor> professoresFromFirestore(QuerySnapshot snapshot) {
    //read
    if (snapshot != null) {
      return snapshot.docs.map((e) {
        return Professor(
          nome: e.data()['nome'],
          cpf: e.data()['cpf'],
          endereco: e.data()['endereco'],
          turmas: e.data()['turmas'],
          id: e.id,
        );
      }).toList();
    } else
      return null;
  }

  Stream<List<Professor>> listProfessor() {
    return todosCollection.snapshots().map(professoresFromFirestore);
  }
}
