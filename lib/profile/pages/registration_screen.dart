import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:laboratory_work_7/profile/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  Future<void> _registerUser() async {
    if (_formKey.currentState!.validate()) {
      const url =
          'https://databaseforflutter-f9f8c-default-rtdb.firebaseio.com/users.json';
      http.post(
        Uri.parse(url),
        body: jsonEncode({
          'fullName': _fullNameController.text,
          'email': _emailController.text,
          'phone': _phoneController.text,
        }),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
    title: const Text("Регистрация"),
    centerTitle: true,
    backgroundColor: Colors.deepPurple,
  ),
  body: SingleChildScrollView(
    padding: const EdgeInsets.all(16.0),
    child: Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 30),
          const Text(
            "Создайте аккаунт",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),

          // ФИО
          TextFormField(
            controller: _fullNameController,
            decoration: InputDecoration(
              labelText: 'ФИО',
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(),
            ),
            validator: (value) =>
                value!.isEmpty ? 'Введите ФИО' : null,
          ),
          const SizedBox(height: 16),

          // Email
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email),
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) =>
                value!.isEmpty ? 'Введите email' : null,
          ),
          const SizedBox(height: 16),

          // Телефон
          TextFormField(
            controller: _phoneController,
            decoration: InputDecoration(
              labelText: 'Телефон',
              prefixIcon: Icon(Icons.phone),
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.phone,
            validator: (value) =>
                value!.isEmpty ? 'Введите номер телефона' : null,
          ),
          const SizedBox(height: 30),

          // Кнопка регистрации
          ElevatedButton.icon(
            onPressed: _registerUser,
            icon: Icon(Icons.check),
            label: Text("Зарегистрироваться"),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 58, 250, 48),
              padding: EdgeInsets.symmetric(vertical: 16),
              textStyle: TextStyle(fontSize: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
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