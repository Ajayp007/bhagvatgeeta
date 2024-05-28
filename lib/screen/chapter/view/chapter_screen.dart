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
  HomeProvider? providerR;
  HomeProvider? providerW;

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    HomeModel m1 = ModalRoute.of(context)!.settings.arguments as HomeModel;
    return Scaffold(
      appBar: AppBar(
        title: providerW!.language=="Sanskrit"?Text("${m1.title}"):Text("${m1.tEnglish}"),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: RadioListTile(
                    value: "All",
                    groupValue: providerW!.language,
                    onChanged: (value) {
                      providerW!.changeLanguage(value!);
                    },
                    title: const Text("All"),
                  ),
                ),
                PopupMenuItem(
                  child: RadioListTile(
                    value: "Sanskrit",
                    groupValue: providerW!.language,
                    onChanged: (value) {
                      providerW!.changeLanguage(value!);
                      Navigator.pop(context);
                    },
                    title: const Text("Sanskrit"),
                  ),
                ),
                PopupMenuItem(
                  child: RadioListTile(
                    value: "English",
                    groupValue: providerW!.language,
                    onChanged: (value) {
                      providerW!.changeLanguage(value!);
                      Navigator.pop(context);
                    },
                    title: const Text("English"),
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: providerW!.language == "Sanskrit"
          ? Column(
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
                        title: Text("${m1.shloka![index]}"),
                      );
                    },
                  ),
                )
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                Text(
                  "${m1.eChapter}",
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
                    itemCount: m1.english!.length,
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
