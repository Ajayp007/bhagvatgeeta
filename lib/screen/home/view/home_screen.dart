import 'dart:ui';

import 'package:bhagvatgeeta/screen/home/provider/home_provider.dart';
import 'package:bhagvatgeeta/utils/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/shared_pref.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ThemeProvider? providerR;
  ThemeProvider? providerW;

  HomeProvider? providerRH;
  HomeProvider? providerWH;
  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().getJson();
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<ThemeProvider>();
    providerW = context.watch<ThemeProvider>();

    providerRH = context.read<HomeProvider>();
    providerWH = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: providerWH!.language=="Sanskrit"?const Text("|| भगवद् गीता||"):const Text("|| Bhagvad Gita ||"),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: RadioListTile(
                    value: "All",
                    groupValue: providerWH!.language,
                    onChanged: (value) {
                      providerWH!.changeLanguage(value!);
                    },
                    title: const Text("All"),
                  ),
                ),
                PopupMenuItem(
                  child: RadioListTile(
                    value: "Sanskrit",
                    groupValue: providerWH!.language,
                    onChanged: (value) {
                      providerWH!.changeLanguage(value!);
                      Navigator.pop(context);
                    },
                    title: const Text("Sanskrit"),
                  ),
                ),
                PopupMenuItem(
                  child: RadioListTile(
                    value: "English",
                    groupValue: providerWH!.language,
                    onChanged: (value) {
                      providerWH!.changeLanguage(value!);
                      Navigator.pop(context);
                    },
                    title: const Text("English"),
                  ),
                ),
                PopupMenuItem(
                  child:Switch(
                    value: providerW!.themeMode,
                    onChanged: (value) {
                      setThemeData(value);
                      providerR!.setTheme();
                    },
                  ),
                ),
              ];
            },
          ),

        ],
      ),
      body: Stack(
        children: [

          Image.asset(
            "assets/images/krishna.jpg",
            fit: BoxFit.cover,
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,

          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(),
          ),
          providerWH!.language=="Sanskrit"?ListView.builder(
            itemCount: providerWH!.slokList.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.pushNamed(context, 'detail',arguments: providerRH!.slokList[index]);
                },
                subtitle: Text("${providerRH!.slokList[index].title}",style: const TextStyle(color: Colors.white),),
                title: Text("${providerRH!.slokList[index].chapter}",style: const TextStyle(fontSize: 20,color: Colors.white),overflow: TextOverflow.ellipsis,),
                leading: Text("${providerRH!.slokList[index].id}",style: const TextStyle(fontSize: 20,color: Colors.white),),
              );
            },
          ) :
          ListView.builder(
            itemCount: providerWH!.slokList.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.pushNamed(context, 'detail',arguments: providerRH!.slokList[index]);
                },
                subtitle: Text("${providerRH!.slokList[index].eChapter}",style: const TextStyle(color: Colors.white),),
                title: Text("${providerRH!.slokList[index].tEnglish}",style: const TextStyle(fontSize: 20,color: Colors.white),overflow: TextOverflow.ellipsis,),
                leading: Text("${providerRH!.slokList[index].id}",style: const TextStyle(fontSize: 20,color: Colors.white),),
              );
            },
          ),
        ],
      ),
    );
  }
}
