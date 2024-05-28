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
        title: const Text("|| ભગવદ ગીતા ||"),
        centerTitle: true,
        actions: [
          Switch(
            value: providerW!.themeMode,
            onChanged: (value) {
              setThemeData(value);
              providerR!.setTheme();
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
          ListView.builder(
            itemCount: providerWH!.slokList.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  Navigator.pushNamed(context, 'detail',arguments: providerRH!.slokList[index]);
                },
                subtitle: Text("${providerRH!.slokList[index].title}",style: TextStyle(color: Colors.white),),
                title: Text("${providerRH!.slokList[index].chapter}",style: const TextStyle(fontSize: 20,color: Colors.white),overflow: TextOverflow.ellipsis,),
                leading: Text("${providerRH!.slokList[index].id}",style: const TextStyle(fontSize: 20,color: Colors.white),),
              );
            },
          ),
        ],
      ),
    );
  }
}
