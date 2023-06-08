import 'package:flutter/material.dart';
import 'package:flutter_rickandmorty_api/data/api/api.dart';
import 'package:flutter_rickandmorty_api/domain/models/characters_modals.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Character>> futureCharacter;

  @override
  void initState() {
    futureCharacter =
        Api.getCharacter('https://rickandmortyapi.com/api/character');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Rick And Morty')),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Characters of Rick and Morty',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Search character',
                      hintStyle: TextStyle(
                        fontSize: 15,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.green, width: 2),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: FutureBuilder<List<Character>>(
                future: futureCharacter,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.isEmpty) {
                      return Center(
                        child: Text('Not Data Available'),
                      );
                    } else {
                      return GridView.builder(
                        itemCount: snapshot.data!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 1.0,
                          mainAxisSpacing: 1.0,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          var name = snapshot.data![index].name;
                          var status = snapshot.data![index].status;

                          var image = snapshot.data![index].image;
                          return Stack(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 50, 10, 10),
                                child: Card(
                                  elevation: 6,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  shadowColor: Colors.green,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 15,
                                              width: 15,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  color: status == 'Dead'
                                                      ? Colors.red
                                                      : status == 'Alive'
                                                          ? Colors.green
                                                          : Colors.grey),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 35,
                                        ),
                                        Text(
                                          name,
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Card(
                                  elevation: 6,
                                  shadowColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  child: CircleAvatar(
                                    radius: 45,
                                    backgroundImage: NetworkImage(image),
                                    backgroundColor: Colors.green,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0.0,
                    mainAxisSpacing: 0.0),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    color: Colors.amber,
                    child: Stack(
                      children: [
                        Positioned(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
                            child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 10,
                                          width: 10,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: Colors.green),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 35,
                                    ),
                                    Text(
                                      'Nombre',
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Positioned(
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              child: CircleAvatar(
                                  radius: 45,
                                  child: Icon(Icons.verified_user_rounded)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
 */