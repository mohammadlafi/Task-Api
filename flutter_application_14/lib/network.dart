import 'package:http/http.dart' as http;
import 'dart:convert';

import 'alljobs.dart';

class Network {
  Future<List<Jobs>?> getUrl() async {
    var url =
        Uri.parse('https://remotive.io/api/remote-jobs?category=software-dev');
    http.Response respone = await http.get(url);
    if (respone.statusCode == 200) {
      String data = respone.body;
      var jobsList = jsonDecode(data);
      Iterable jobsList2 = jobsList['jobs'];
      List<Jobs> listCatgory = [];

      for (var item in jobsList2) {
        listCatgory.add(Jobs.fromJson(item));
      }
      return listCatgory;
    }
    return null;
  }
}
