import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/student.dart';

class Students with ChangeNotifier {
  final List<Student> _allStudent = [];

  List<Student> get allStudent => _allStudent;

  int get jumlahStudent => _allStudent.length;

  Student selectById(String id) {
    return _allStudent.firstWhere((element) => element.id == id);
  }

  Future<void> addStudent(String name, String age, String major) async {
    Uri url = Uri.parse("http://localhost/flutter/student.php/student");

    try {
      final response = await http.post(
        url,
        body: json.encode({
          "name": name,
          "age": age,
          "major": major,
        }),
      );

      print("THEN FUNCTION");
      print(json.decode(response.body));

      final student = Student(
        id: json.decode(response.body)["id"],
        name: name,
        age: age,
        major: major,
      );

      _allStudent.add(student);
      notifyListeners();
    } catch (err) {
      throw err;
    }
  }

  void editStudent(
    String id,
    String name,
    String age,
    String major,
    BuildContext context,
  ) {
    Student selectPlayer =
        _allStudent.firstWhere((element) => element.id == id);
    selectPlayer.name = name;
    selectPlayer.age = age;
    selectPlayer.major = major;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Berhasil diubah"),
        duration: Duration(seconds: 2),
      ),
    );
    notifyListeners();
  }

  void deletePlayer(String id, BuildContext context) {
    _allStudent.removeWhere((element) => element.id == id);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Berhasil dihapus"),
        duration: Duration(milliseconds: 500),
      ),
    );
    notifyListeners();
  }

  Future<void> initializeData() async {
    Uri url = Uri.parse("http://localhost/flutter/student.php/student");
    try {
      var hasilGetData = await http.get(url);
      var dataResponse = json.decode(hasilGetData.body) as Map<String, dynamic>;

      // Create Student objects from the response data
      final List<Student> loadedStudents = [];
      dataResponse.forEach((key, value) {
        loadedStudents.add(
          Student(
            id: value['id'],
            name: value['name'],
            age: value['age'],
            major: value['major'],
          ),
        );
      });

      _allStudent.clear();
      _allStudent.addAll(loadedStudents);

      print("BERHASIL MEMUAT DATA LIST");
      notifyListeners();
    } catch (err) {
      throw err;
    }
  }
}
