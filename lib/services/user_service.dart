import 'dart:convert';

import 'package:suitmedia_test/model/user_model.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<List<UserModel>> getUserList() async {
    var url = 'https://reqres.in/api/users?page=1&per_page=15';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(Uri.parse(url), headers: headers);
    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<UserModel> products = [];

      for (var item in data) {
        products.add(UserModel.fromJson(item));
      }
      return products;
    } else {
      throw Exception('Failed to get user list!');
    }
  }
}
