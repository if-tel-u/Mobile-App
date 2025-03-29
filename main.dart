import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local Time Notification',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: const MyHomePage(title: 'MeeTime'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _showNotification() {
    DateTime now = DateTime.now();
    String formattedTime =
        "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Notifikasi'),
            content: Text('Anda menekan tombol pada waktu $formattedTime'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.pink[100],
      ),
      body: const Center(
        child: Text(
          '',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showNotification,
        child: const Icon(Icons.notifications),
        backgroundColor: Colors.pink[100],
      ),
    );
  }
}
