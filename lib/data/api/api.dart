import 'dart:convert';

import 'package:flutter_rickandmorty_api/domain/models/characters_modals.dart';
import 'package:http/http.dart' as http;

class Api {
  static Future<List<Character>> getCharacter(url) async {
    final api = Uri.parse(url);
    final headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
    var response = await http.get(api, headers: headers);
    var responseData = json.decode(response.body);
    List<Character> characterData = [];
    for (var index in responseData['results']) {
      Character jsonCharacter = Character(
        id: index['id'],
        name: index['name'],
        status: index['status'],
        species: index['species'],
        type: index['type'],
        gender: index['gender'],
        origin: index['origin'],
        location: index['location'],
        image: index['image'],
        episode: index['episode'],
      );
      characterData.add(jsonCharacter);
    }
    return characterData;
  }
}
