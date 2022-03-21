import 'package:flutter/material.dart';
import 'package:flutter_application_14/alljobs.dart';
import 'package:flutter_application_14/detiles.dart';
import 'package:flutter_application_14/network.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var network = Network();

  String x = '';
  @override
  void initState() {
    network.getUrl();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Task-Api'),
        ),
        body: FutureBuilder<List<Jobs>?>(
          future: network.getUrl(),
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
