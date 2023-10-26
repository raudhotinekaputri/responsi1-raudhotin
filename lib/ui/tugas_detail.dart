import 'package:flutter/material.dart';
import 'package:assignments/bloc/tugas_bloc.dart';
import 'package:assignments/model/tugas.dart';
import 'package:assignments/ui/tugas_form.dart';
import 'package:assignments/ui/tugas_page.dart';

class TugasDetail extends StatefulWidget {
  int? id;
  String? title;
  String? description;
  DateTime? deadline;

  TugasDetail({Key? key, this.id, this.title, this.description, this.deadline, required Tugas tugas})
      : super(key: key);

  @override
  _TugasDetailState createState() => _TugasDetailState();
}

class _TugasDetailState extends State<TugasDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tugas Detail'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "ID : ${widget.id ?? ''}",
              style: TextStyle(fontSize: 20.0),
            ),
            Text(
              "Title : ${widget.title ?? ''}",
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              "Description : ${widget.description ?? ''}",
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              "Deadline : ${widget.deadline ?? ''}",
              style: TextStyle(fontSize: 18.0),
            ),
            _tombolEditHapus()
          ],
        ),
      ),
    );
  }

  Widget _tombolEditHapus() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Tombol Edit
        OutlinedButton(
          child: Text("EDIT"),
          onPressed: () {
            // Implement your edit logic here
          },
        ),
        // Tombol Hapus
        OutlinedButton(
          child: Text("DELETE"),
          onPressed: () => confirmHapus(),
        ),
      ],
    );
  }

  void confirmHapus() {
    AlertDialog alertDialog = AlertDialog(
      content: Text("Yakin ingin menghapus data ini?"),
      actions: [
        // Tombol Hapus
        OutlinedButton(
          child: Text("Ya"),
          onPressed: () {
            // Implement your delete logic here
            Navigator.pop(context);
          },
        ),
        // Tombol Batal
        OutlinedButton(
          child: Text("Batal"),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );

    showDialog(context: context, builder: (context) => alertDialog);
  }
}