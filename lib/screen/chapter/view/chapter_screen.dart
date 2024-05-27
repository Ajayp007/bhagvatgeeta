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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 500,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage("${m1.url}"), fit: BoxFit.cover),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "${m1.shloka}",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
