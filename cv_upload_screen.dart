import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class CVUploadScreen extends StatefulWidget {
  const CVUploadScreen({super.key});

  @override
  _CVUploadScreenState createState() => _CVUploadScreenState();
}

class _CVUploadScreenState extends State<CVUploadScreen> {
  File? selectedFile;

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );

    if (result != null) {
      setState(() {
        selectedFile = File(result.files.single.path!);
      });
    }
  }

  Future<void> uploadFile() async {
    if (selectedFile == null) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Файл отправлен: ${selectedFile!.path}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Загрузка резюме')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: pickFile,
              child: const Text('Выбрать файл'),
            ),
            if (selectedFile != null) Text('Выбран файл: ${selectedFile!.path}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: uploadFile,
              child: const Text('Отправить файл'),
            ),
          ],
        ),
      ),
    );
  }
}

