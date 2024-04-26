import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<TextEditingController> _controllers = [TextEditingController()];

  void _addTextField() {
    setState(() {
      _controllers.add(TextEditingController());
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('냉장고 파먹기'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: _controllers.map((controller) {
            int index = _controllers.indexOf(controller);
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: '재료 ${index + 1}',
                  border: const OutlineInputBorder(),
                ),
              ),
            );
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTextField,
        child: const Icon(Icons.add),
      ),
    );
  }
}
