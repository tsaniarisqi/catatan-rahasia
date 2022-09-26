import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Note extends StatefulWidget {
  const Note({Key? key}) : super(key: key);

  @override
  State<Note> createState() => _Note();
}

class _Note extends State<Note> {
  TextEditingController noteController = TextEditingController();

  @override
  void initState() {
    readNote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catatan Rahasia Tsania"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextFormField(
                controller: noteController,
                maxLines: 10,
                decoration: InputDecoration(
                  hintText: 'Masukkan Catatan Rahasia',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 15),
                width: double.infinity,
                height: 70,
                child: ElevatedButton(
                  onPressed: () {
                    saveNote();
                  },
                  child: const Text(
                    "Simpan",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 15),
                width: double.infinity,
                height: 70,
                child: ElevatedButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: const Text(
                    "Tutup Catatan Rahasia",
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

  void saveNote() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('note', noteController.text);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Berhasil Menyimpan Data'),
      ),
    );
  }

  void readNote() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      noteController.text = prefs.getString('note') ?? '';
    });
  }
}
