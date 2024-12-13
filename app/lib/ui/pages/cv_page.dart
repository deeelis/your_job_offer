import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:your_job_offer/ui/providers/user/user_provider.dart';

import '../../domain/model/user.dart';
import '../../main.dart';
import 'form_page.dart';

class CVUploadPage extends ConsumerStatefulWidget {
  const CVUploadPage({super.key});

  @override
  ConsumerState<CVUploadPage> createState() => _CVUploadPageState();
}

class _CVUploadPageState extends ConsumerState<CVUploadPage> {
  File? selectedFile;
  User? _userModel;
  bool isLoading = false;

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null && result.files.single.path != null) {
      setState(() {
        selectedFile = File(result.files.single.path!);
      });
    }
  }

  Future<void> _uploadFile() async {
    if (selectedFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a file first.')),
      );
      return;
    }

    final request = http.MultipartRequest(
      'POST',
      Uri.parse('http://94.103.183.30:8080/upload'),
    );
    request.files.add(
      await http.MultipartFile.fromPath('file', selectedFile!.path),
    );
    request.headers['Content-Type'] = 'application/pdf';
    request.fields['login'] = 'test';
    request.fields['password'] = 'test';

    final response = await http.Response.fromStream(await request.send());
    try {
      final userModel = await _parseResponse(response);
      setState(() {
        _userModel = userModel;
      });
    } catch (e) {
      _showError('Failed to parse user data: $e');
    }
    if (response.statusCode == 200) {
      print(_userModel.toString());
      ref.read(userStateProvider.notifier).updateUser(_userModel!);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('File uploaded successfully!')),
        );
        Navigator.pushNamed(context, Pages.form,
            arguments: FormArguments(user: _userModel!));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('File upload failed.')),
      );
    }
  }

  void _showError(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Future<User> _parseResponse(http.Response response) async {
    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(jsonDecode(response.body));
      return User.fromJson(jsonResponse);
    } else {
      throw Exception(
          'Failed to parse user data. Status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    print(isLoading);
    var user = ref.watch(userStateProvider).valueOrNull ?? User.getEmptyUser();
    print(user);
    if (isLoading) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Upload PDF File'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Pages.form,
                        arguments: FormArguments(user: user));
                  },
                  child: const Text("Пропустить"))
            ],
          ),
          body: const Center(child: CircularProgressIndicator()));
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Upload PDF File'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Pages.form,
                      arguments: FormArguments(user: user));
                },
                child: const Text("Пропустить"))
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  selectedFile != null
                      ? selectedFile!.path.split('/').last
                      : 'No file selected',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _pickFile,
                  child: const Text('Select PDF File'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    await _uploadFile();
                    setState(() {
                      isLoading = false;
                    });
                  },
                  child: const Text('Upload File'),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
