import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FourthPage extends StatefulWidget {
  const FourthPage({super.key});

  @override
  State<FourthPage> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  String fullName = '';
  String email = '';
  String phone = '';

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  void loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      fullName = prefs.getString('fullName') ?? '';
      email = prefs.getString('email') ?? '';
      phone = prefs.getString('phone') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('ФИО: $fullName', style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 8),
          Text('Email: $email', style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 8),
          Text('Телефон: $phone', style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
