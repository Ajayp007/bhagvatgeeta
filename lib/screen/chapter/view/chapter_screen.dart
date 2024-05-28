import 'package:bhagvatgeeta/screen/home/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home/provider/home_provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  HomeProvider? providerRH;
  HomeProvider? providerWH;

  @override
  Widget build(BuildContext context) {
    providerRH = context.read<HomeProvider>();
    providerWH = context.watch<HomeProvider>();
    HomeModel m1 = ModalRoute.of(context)!.settings.arguments as HomeModel;
    return Scaffold(
      appBar: AppBar(
        title: Text("${m1.title}"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          Text(
            "${m1.chapter}",
            style: const TextStyle(fontSize: 22),
          ),
          Container(
            height: 300,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(20),
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: NetworkImage("${m1.url}"), fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: m1.shloka!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${m1.english![index]}"),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
