import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:reddit_news/screens/widgets/news_list.dart';
import 'package:reddit_news/screens/widgets/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String url = 'https://www.reddit.com/r/flutterdev/new.json';

  List? newsData;

  /// api service
  Future getUser() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      setState(() {
        newsData = data?['data']['children'];
      });
      return data;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Reddit news'),
          centerTitle: true,
          backgroundColor: Colors.redAccent,
        ),
        body: FutureBuilder(
          future: getUser(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return RefreshScreenWidget(
                widget: NewsList(newsLength: newsData!.length, newsData: newsData!),
                future: getUser(),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
