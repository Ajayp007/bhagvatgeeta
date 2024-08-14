import 'package:bhagvatgeeta/screen/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LikeScreen extends StatefulWidget {
  const LikeScreen({super.key});

  @override
  State<LikeScreen> createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;

  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().getSlok();
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: providerW!.likeSlokList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(providerR!.likeSlokList[index]),
            trailing: IconButton(
              onPressed: () {
                providerW!.deleteLikeSlok(index);
              },
              icon: const Icon(Icons.delete_outline),
            ),
          );
        },
      ),
    );
  }
}
