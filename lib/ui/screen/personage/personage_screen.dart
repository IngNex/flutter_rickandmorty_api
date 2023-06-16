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
    final personage = widget.personageData;
    return Scaffold(
        appBar: AppBar(
          title: Text('Data Personage'),
        ),
        body: Card(
          margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(personage.image),
              Text(
                personage.name,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text('Species: ${personage.species}'),
            ],
          ),
        ));
  }
}
