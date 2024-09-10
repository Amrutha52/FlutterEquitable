import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/Products.dart';
import '../model/ResponseMain.dart';

class ApiService
{
  Future<List<Products>?> fetchData()
  async {
    final responseData = await http.get(Uri.parse("https://dummyjson.com/products"));
    if (responseData.statusCode == 200)
      {
        var jsonn = jsonDecode(responseData.body);
        var data = ResponseMain.fromJson(jsonn);
        var list = data.products;
        return list;
      }
  }
}
