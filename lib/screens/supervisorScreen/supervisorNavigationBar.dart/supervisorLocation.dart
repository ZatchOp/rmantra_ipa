import 'package:flutter/material.dart';

class SupervisorLocationPage extends StatefulWidget {
  const SupervisorLocationPage({super.key});

  @override
  State<SupervisorLocationPage> createState() => _SupervisorLocationPageState();
}

class _SupervisorLocationPageState extends State<SupervisorLocationPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Location Page")),
    );
  }
}
