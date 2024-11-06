import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/students.dart';

class AddStudent extends StatelessWidget {
  static const routeName = '/add-student';

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController majorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final players = Provider.of<Students>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("ADD Student"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              players
                  .addStudent(
                nameController.text,
                ageController.text,
                majorController.text,
              )
                  .then(
                (response) {
                  print("Kembali ke home & kasih notif snack bar");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Berhasil ditambahkan"),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  Navigator.pop(context);
                },
              );
            },
          ),
        ],
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
                  players
                      .addStudent(
                    nameController.text,
                    ageController.text,
                    majorController.text,
                  )
                      .then(
                    (response) {
                      print("Kembali ke home & kasih notif snack bar");
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Berhasil ditambahkan"),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      Navigator.pop(context);
                    },
                  );
                },
              ),
              SizedBox(height: 20),
              Center(
                child: OutlinedButton(
                  onPressed: () {
                    players
                        .addStudent(
                      nameController.text,
                      ageController.text,
                      majorController.text,
                    )
                        .then(
                      (response) {
                        print("Kembali ke home & kasih notif snack bar");
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Berhasil ditambahkan"),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        Navigator.pop(context);
                      },
                    );
                  },
                  child: Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
