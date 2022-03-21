import 'dart:io';

import 'package:flutter/material.dart';

import 'alljobs.dart';
import 'package:url_launcher/url_launcher.dart';

class Detiles extends StatelessWidget {
  final Jobs? jobs;
  final StateSetter allusersSetStte;
  const Detiles({Key? key, required this.jobs, required this.allusersSetStte})
      : super(key: key);

  void _launchURL() async {
    if (!await launch(jobs!.url ?? '')) throw 'Could not launch ${jobs!.url}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detiles Job'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(jobs!.logo ?? ""),
              Text('Company Name:  ${jobs!.companyName ?? " "}'),
              Text('Catgoy Name: ${jobs!.catgoryName ?? ""}'),
              Text('Job Type: ${jobs!.jobType ?? ""} '),
              Text('Location: ${jobs!.location ?? ""} '),
              Text('Salary: ${jobs!.salary ?? ""} '),
              Text('tags: ${jobs!.tags ?? ""} '),
              TextButton(
                  onPressed: () {
                    _launchURL();
                  },
                  child: const Text('Information for are Comapny'))
            ],
          ),
        ),
      ),
    );
  }
}
