import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_dsi/model/aluno.dart';
import 'package:project_dsi/model/pessoa.dart';
import 'package:project_dsi/model/professor.dart';

class DataBaseServiceAluno {
  CollectionReference alunoCollection =
      FirebaseFirestore.instance.collection('alunos');

  Future createNewAluno(Aluno aluno) async {
    //Create
    DataBaseServicePessoa().createNewPessoa(aluno);
    return await alunoCollection.add({
      "nome": aluno.nome,
      "cpf": aluno.cpf,
      "endereco": aluno.endereco,
      "matricula": aluno.matricula,
    });
  }

  Future updateAluno(uid, Aluno aluno, cpf) async {
    //Update
    var doc = await FirebaseFirestore.instance
        .collection('pessoas')
        .where('cpf', isEqualTo: cpf)
        .get();
    DataBaseServicePessoa().updatePessoa(doc.docs[0].id, aluno);

    await alunoCollection.doc(uid).update({"nome": aluno.nome});
    await alunoCollection.doc(uid).update({"cpf": aluno.cpf});
    await alunoCollection.doc(uid).update({"endereco": aluno.endereco});
    await alunoCollection.doc(uid).update({"matricula": aluno.matricula});
  }

  Future removeAluno(uid, cpf) async {
    //delete
    var doc = await FirebaseFirestore.instance
        .collection('pessoas')
        .where('cpf', isEqualTo: cpf)
        .get();
    DataBaseServicePessoa().removePessoa(doc.docs[0].id);

    await alunoCollection.doc(uid).delete();
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
    return alunoCollection.snapshots().map(alunosFromFirestore);
  }
}

class DataBaseServiceProfessor {
  CollectionReference professorCollection =
      FirebaseFirestore.instance.collection('professores');

  Future createNewProfessor(Professor professor) async {
    //Create
    DataBaseServicePessoa().createNewPessoa(professor);
    return await professorCollection.add({
      "nome": professor.nome,
      "cpf": professor.cpf,
      "endereco": professor.endereco,
      "turmas": professor.turmas,
    });
  }

  Future updateProfessor(uid, Professor professor, cpf) async {
    //Update
    var doc = await FirebaseFirestore.instance
        .collection('pessoas')
        .where('cpf', isEqualTo: cpf)
        .get();
    DataBaseServicePessoa().updatePessoa(doc.docs[0].id, professor);

    await professorCollection.doc(uid).update({"nome": professor.nome});
    await professorCollection.doc(uid).update({"cpf": professor.cpf});
    await professorCollection.doc(uid).update({"endereco": professor.endereco});
    await professorCollection.doc(uid).update({"turmas": professor.turmas});
  }

  Future removeProfessor(uid, cpf) async {
    //delete
    var doc = await FirebaseFirestore.instance
        .collection('pessoas')
        .where('cpf', isEqualTo: cpf)
        .get();
    DataBaseServicePessoa().removePessoa(doc.docs[0].id);

    await professorCollection.doc(uid).delete();
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
    return professorCollection.snapshots().map(professoresFromFirestore);
  }
}

class DataBaseServicePessoa {
  CollectionReference pessoaCollection =
      FirebaseFirestore.instance.collection('pessoas');

  Future createNewPessoa(Pessoa pessoa) async {
    //Create
    return await pessoaCollection.add({
      "nome": pessoa.nome,
      "cpf": pessoa.cpf,
      "endereco": pessoa.endereco,
    });
  }

  Future updatePessoa(uid, Pessoa pessoa) async {
    //Update
    await pessoaCollection.doc(uid).update({"nome": pessoa.nome});
    await pessoaCollection.doc(uid).update({"cpf": pessoa.cpf});
    await pessoaCollection.doc(uid).update({"endereco": pessoa.endereco});
  }

  Future removePessoa(uid) async {
    //delete
    await pessoaCollection.doc(uid).delete();
  }

  List<Pessoa> pessoaFromFirestore(QuerySnapshot snapshot) {
    //read
    if (snapshot != null) {
      var pessoas = snapshot.docs.map((e) {
        return Pessoa(
          nome: e.data()['nome'],
          cpf: e.data()['cpf'],
          endereco: e.data()['endereco'],
          id: e.id,
        );
      }).toList();
      return pessoas;
    } else
      return null;
  }

  Stream<List<Pessoa>> listPessoa() {
    return pessoaCollection.snapshots().map(pessoaFromFirestore);
  }
}
