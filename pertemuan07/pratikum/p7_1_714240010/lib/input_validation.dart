
import 'package:flutter/material.dart';

class MyFormValidation extends StatefulWidget {
  const MyFormValidation({super.key});

  @override
  State<MyFormValidation> createState() =>
      _MyFormValidationState();
}

class _MyFormValidationState extends State<MyFormValidation> {
  // Key untuk mengelola Form dan validasi
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>();

  // Controller untuk mengambil input pengguna
  final TextEditingController _controllerEmail =
      TextEditingController();

  final TextEditingController _controllerNama =
      TextEditingController();

  // Validasi email sesuai modul
  String? _validateEmail(String? value) {
    const String expression =
        "[a-zA-Z0-9+._%-+]{1,256}"
        "\\@"
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}"
        "("
        "\\."
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}"
        ")+";

    final RegExp regExp = RegExp(expression);

    if (value == null || value.isEmpty) {
      return 'Email wajib diisi';
    }

    if (!regExp.hasMatch(value)) {
      return 'Tolong inputkan email yang valid!';
    }

    return null;
  }

  // Validasi nama minimal 3 karakter
  String? _validateNama(String? value) {
    if (value == null || value.length < 3) {
      return 'Masukkan setidaknya 3 karakter';
    }

    return null;
  }

  // Membersihkan controller
  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerNama.dispose();
    super.dispose();
  }

  // Menampilkan data yang sudah diinput
  void _showDataDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Data yang Diinput'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Email: ${_controllerEmail.text}'),
              const SizedBox(height: 8),
              Text('Nama: ${_controllerNama.text}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Tutup'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Validation'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Form Email
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _controllerEmail,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: 'Write your email here...',
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      fillColor: Color.fromARGB(
                        255, 222, 254, 255,
                      ),
                      filled: true,
                    ),
                    validator: _validateEmail,
                  ),
                ),

                // Form Nama
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _controllerNama,
                    decoration: const InputDecoration(
                      hintText: 'Write your name here...',
                      labelText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      fillColor: Color.fromARGB(
                        255, 222, 254, 255,
                      ),
                      filled: true,
                    ),
                    validator: _validateNama,
                  ),
                ),

                const SizedBox(height: 16),

                // Tombol validasi
                ElevatedButton(
                  child: const Text('Submit'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                        const SnackBar(
                          content: Text('Processing Data'),
                          duration: Duration(seconds: 2),
                        ),
                      );

                      _showDataDialog();
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Please complete the form',
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
