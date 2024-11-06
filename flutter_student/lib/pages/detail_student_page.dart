import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/students.dart';

class DetailStudent extends StatelessWidget {
  static const routeName = '/detail-student';

  @override
  Widget build(BuildContext context) {
    final students = Provider.of<Students>(context, listen: false);
    final studentId = ModalRoute.of(context)!.settings.arguments as String;
    final selectStudent = students.selectById(studentId);

    final TextEditingController nameController =
        TextEditingController(text: selectStudent.name);
    final TextEditingController ageController =
        TextEditingController(text: selectStudent.age);
    final TextEditingController majorController =
        TextEditingController(text: selectStudent.major);

    return Scaffold(
      appBar: AppBar(
        title: Text("DETAIL STUDENT"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                autocorrect: false,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: "Nama",
                ),
                textInputAction: TextInputAction.next,
                controller: nameController,
              ),
              TextFormField(
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: "Umur",
                ),
                textInputAction: TextInputAction.next,
                controller: ageController,
              ),
              TextFormField(
                autocorrect: false,
                decoration: InputDecoration(
                  labelText: "Major",
                ),
                textInputAction: TextInputAction.done,
                controller: majorController,
                onEditingComplete: () {
                  students.editStudent(
                    studentId,
                    nameController.text,
                    ageController.text,
                    majorController.text,
                    context,
                  );
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 50),
              Center(
                child: OutlinedButton(
                  onPressed: () {
                    students.editStudent(
                      studentId,
                      nameController.text,
                      ageController.text,
                      majorController.text,
                      context,
                    );
                    Navigator.pop(context);
                  },
                  child: Text(
                    "EDIT",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
