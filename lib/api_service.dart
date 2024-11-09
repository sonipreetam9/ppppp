import 'package:http/http.dart' as http;
import 'dart:convert';






class ApiService{
  final String baseUrl = 'http://yourserver.com/api/';

  Future<LIst> readUsers() async{

  } 
}



class ApiService {
  final String baseUrl = 'http://yourserver.com/api/';


  Future<List> readUsers() async {
    final response = await http.get(Uri.parse('${baseUrl}read_users.php'));
    return json.decode(response.body);
  }

  Future<String> createUser(String name, String email, String phone) async {
    final response = await http.post(
      Uri.parse('${baseUrl}create_user.php'),
      body: {'name': name, 'email': email, 'phone': phone},
    );
    return json.decode(response.body)['message'];
  }

  Future<String> updateUser(int id, String name, String email, String phone) async {
    final response = await http.post(
      Uri.parse('${baseUrl}update_user.php'),
      body: {'id': id.toString(), 'name': name, 'email': email, 'phone': phone},
    );
    return json.decode(response.body)['message'];
  }

  Future<String> deleteUser(int id) async {
    final response = await http.post(
      Uri.parse('${baseUrl}delete_user.php'),
      body: {'id': id.toString()},
    );
    return json.decode(response.body)['message'];
  }
}

