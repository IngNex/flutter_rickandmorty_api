import 'package:flutter/material.dart';

class PersonageScreen extends StatefulWidget {
  const PersonageScreen({super.key, this.personageData});
  final personageData;
  @override
  State<PersonageScreen> createState() => _PersonageScreenState();
}

class _PersonageScreenState extends State<PersonageScreen> {
  @override
  Widget build(BuildContext context) {
    final name = widget.personageData.name;
    return Scaffold(body: Center(child: Text(name)));
  }
}
