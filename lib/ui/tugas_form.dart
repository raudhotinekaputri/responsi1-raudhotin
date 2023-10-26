import 'package:assignments/model/tugas.dart';
import 'package:flutter/material.dart';
// import 'package:tokokita/bloc/produk_bloc.dart';
import 'package:assignments/model/tugas.dart';
import 'package:assignments/ui/tugas_page.dart';
import 'package:assignments/widget/warning_dialog.dart';
import 'package:http/http.dart';

class TugasForm extends StatefulWidget {
  Tugas? tugas;

  TugasForm({Key? key, this.tugas}) : super(key: key);

  @override
  _TugasFormState createState() => _TugasFormState();
}

class _TugasFormState extends State<TugasForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  String judul = "TAMBAH TUGAS";
  String tombolSubmit = "SIMPAN";

  final _idController = TextEditingController();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _deadlineController = TextEditingController();

  @override
  void initState() {
    super.initState();
    isUpdate();
  }

  isUpdate() {
    if (widget.tugas != null) {
      setState(() {
        judul = "UBAH TUGAS";
        tombolSubmit = "UBAH";
        _idController.text = widget.tugas!.id.toString();
        _titleController.text = widget.tugas!.title!;
        _descriptionController.text = widget.tugas!.description!;
        _deadlineController.text = widget.tugas!.deadline.toString();
      });
    } else {
      judul = "TAMBAH TUGAS";
      tombolSubmit = "SIMPAN";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(judul)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _idTextField(),
                _titleTextField(),
                _descriptionTextField(),
                _deadlineTextField(),
                _buttonSubmit(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _idTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "ID"),
      keyboardType: TextInputType.number,
      controller: _idController,
      validator: (value) {
        if (value!.isEmpty) {
          return "ID harus diisi";
        }
        return null;
      },
    );
  }

  Widget _titleTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Title"),
      keyboardType: TextInputType.text,
      controller: _titleController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Title harus diisi";
        }
        return null;
      },
    );
  }

  Widget _descriptionTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Description"),
      keyboardType: TextInputType.text,
      controller: _descriptionController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Description harus diisi";
        }
        return null;
      },
    );
  }

  Widget _deadlineTextField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Deadline"),
      keyboardType: TextInputType.text,
      controller: _deadlineController,
      validator: (value) {
        if (value!.isEmpty) {
          return "Deadline harus diisi";
        }
        return null;
      },
    );
  }

  Widget _buttonSubmit() {
    return OutlinedButton(
      child: Text(tombolSubmit),
      onPressed: () {
        var validate = _formKey.currentState!.validate();
        if (validate) {
          if (!_isLoading) {
            if (widget.tugas != null) {
              // Kondisi update tugas
              ubah();
            } else {
              // Kondisi tambah tugas
              simpan();
            }
          }
        }
      },
    );
  }

  simpan() {
    setState(() {
      _isLoading = true;
    });
    Tugas createTugas = Tugas();
    createTugas.id = int.parse(_idController.text);
    createTugas.title = _titleController.text;
    createTugas.description = _descriptionController.text;
    createTugas.deadline = DateTime.parse(_deadlineController.text);
    // Tambahkan logika untuk menyimpan Tugas ke server atau penyimpanan data lainnya sesuai kebutuhan Anda
    // Kemudian, Anda dapat menggunakan Navigator untuk kembali ke halaman sebelumnya.
    // Contoh:
    // Navigator.of(context).pop();
  }

  ubah() {
    setState(() {
      _isLoading = true;
    });
    Tugas updateTugas = Tugas();
    updateTugas.id = int.parse(_idController.text);
    updateTugas.title = _titleController.text;
    updateTugas.description = _descriptionController.text;
    updateTugas.deadline = DateTime.parse(_deadlineController.text);
    // Tambahkan logika untuk mengubah Tugas di server atau penyimpanan data lainnya sesuai kebutuhan Anda
    // Kemudian, Anda dapat menggunakan Navigator untuk kembali ke halaman sebelumnya.
    // Contoh:
    // Navigator.of(context).pop();
  }
}
