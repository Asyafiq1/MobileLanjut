import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpProvider with ChangeNotifier {
  Map<String, dynamic> _data = {};

  Map<String, dynamic> get data => _data;

  int get jumlahData => _data.length;

  Future<void> connectAPI(String name, String job) async {
    Uri url = Uri.parse("https://reqres.in/api/users");

    try {
      var response = await http.post(
        url,
        body: {
          "name": name,
          "job": job,
        },
      );

      if (response.statusCode == 201) {
        _data = json.decode(response.body);
        notifyListeners();
      } else {
        throw Exception('Failed to create user');
      }
    } catch (e) {
      print('Error: $e');
      // You might want to handle the error more gracefully here
    }
  }
}