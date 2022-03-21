import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_14/alljobs.dart';
import 'package:flutter_application_14/detiles.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String x = '';
  @override
  void initState() {
    getUrl();
    super.initState();
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Task-Api'),
        ),
        body: FutureBuilder<List<Jobs>?>(
          future: getUrl(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var jobs = snapshot.data;
              return ListView(
                children: List.generate(
                    jobs!.length,
                    (index) => ListTile(
                          title: Text(jobs[index].title ?? ""),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Detiles(
                                      jobs: jobs[index],
                                      allusersSetStte: setState),
                                ));
                          },
                        )),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
