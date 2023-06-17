// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class PersonageScreen extends StatefulWidget {
  const PersonageScreen({super.key, required this.heroTag, this.personageData});
  final personageData;
  final int heroTag;
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
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Hero(
                tag: widget.heroTag,
                child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: NetworkImage(personage.image),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        //SOMBRA
                        color: Colors.black,
                        offset: Offset(1.0, 1.0),
                        blurRadius: 3.0,
                      ),
                    ],
                  ),
                  child: const SizedBox.shrink(),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),
                      Center(
                        child: Text(
                          personage.name,
                          style: const TextStyle(
                            fontSize: 35,
                          ),
                        ),
                      ),
                      Container(
                          padding: const EdgeInsets.all(8.0),
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          decoration: BoxDecoration(
                            color: personage.status == 'Dead'
                                ? Colors.red
                                : personage.status == 'Alive'
                                    ? Colors.green
                                    : Colors.grey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(personage.status)),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            personage.gender == 'Male'
                                ? const Icon(Icons.male,
                                    size: 30, color: Colors.blue)
                                : personage.gender == 'Female'
                                    ? const Icon(
                                        Icons.female,
                                        size: 30,
                                        color: Colors.red,
                                      )
                                    : const Icon(
                                        Icons.public,
                                        size: 30,
                                        color: Colors.green,
                                      ),
                            const SizedBox(width: 10),
                            Text(
                              personage.gender,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Icon(Icons.fingerprint,
                                size: 30, color: Colors.green[700]),
                            const SizedBox(width: 10),
                            Text(
                              personage.species,
                              style: const TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Card(
                          color: Colors.green[700],
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // TextSpanData(
                                //     title: 'Species: ',
                                //     text: personage.species),
                                //SizedBox(height: 5),
                                TextSpanData(
                                    title: 'Type: ',
                                    text: personage.type == ''
                                        ? 'Not found'
                                        : personage.type),
                                //SizedBox(height: 5),
                                TextSpanData(
                                    title: 'Episodes: ',
                                    text: '${personage.episode.length}'),
                                //SizedBox(height: 5),
                                TextSpanData(
                                    title: 'Origin: ',
                                    text: personage.origin['name']),
                                //SizedBox(height: 5),
                                TextSpanData(
                                    title: 'Location: ',
                                    text: personage.location['name']),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextSpanData extends StatelessWidget {
  const TextSpanData({
    Key? key,
    required this.title,
    required this.text,
  }) : super(key: key);
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        children: [
          TextSpan(
              text: text,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal)),
        ],
      ),
    );
  }
}
/*
final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Map origin;
  final Map location;
  final String image;
 */