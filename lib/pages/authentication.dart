import 'package:evaluasi/pages/note.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreen();
}

class _AuthScreen extends State<AuthScreen> {
  TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pin"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Masukkan Pin Anda",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: TextFormField(
                  obscureText: true,
                  controller: pinController,
                  decoration: InputDecoration(
                    hintText: 'Masukkan pin',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Masukkan Pin';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 15.0),
                width: double.infinity,
                height: 70,
                child: ElevatedButton(
                  onPressed: () {
                    String result = pinController.text;
                    if (result == "123456") {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Berhasil Login'),
                        ),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Note(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Pin Salah'),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  child: const Text(
                    "Buka!",
                    style: TextStyle(fontSize: 18),
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
