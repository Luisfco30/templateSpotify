import 'dart:async';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  Future<dynamic> obtenerApi(busqueda) async {
    var uri = Uri.parse('https://spotify23.p.rapidapi.com/search/?q=$busqueda&type=multi&offset=0&limit=10&numberOfTopResults=5');
    var response = await http.get(uri, headers: {
      'X-RapidAPI-Host': 'spotify23.p.rapidapi.com',
      'X-RapidAPI-Key': '34d924aa03msh6ff5b59b14a5035p1f19d1jsn8f5366139b5a'
    });

     if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      final a = json.decode(response.body) as Map;

      return a['albums']['items'];
     }else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load json data');
    }
  }
}
