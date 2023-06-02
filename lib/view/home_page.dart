import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:localregister/core/extension/context_size.dart';
import 'package:localregister/provider/home_provider.dart';
import 'package:localregister/view/info_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      builder: (context, child) => _scaffold(context),
    );
  }

  Scaffold _scaffold(BuildContext context) {
    return Scaffold(
      drawer: const InfoPage(),
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            TextField(
              controller: context.watch<HomeProvider>().nameController,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: "Name",
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                controller: context.watch<HomeProvider>().lastNameController,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "Last name",
                ),
              ),
            ),
            TextField(
              controller: context.watch<HomeProvider>().ageController,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: "Age",
              ),
            ),
            SizedBox(
              height: context.height * 0.02,
            ),
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.blue,
              ),
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: const Text("Name"),
                    subtitle: Text(Hive.box("register").get("name") ?? ""),
                  ),
                  ListTile(
                    title: const Text("Last name"),
                    subtitle: Text(Hive.box("register").get("lastName") ?? ""),
                  ),
                  ListTile(
                    title: const Text("Age"),
                    subtitle: Text(Hive.box("register").get("age") ?? ""),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await context.read<HomeProvider>().putToBox();
        },
        child: const Text("Next"),
      ),
    );
  }
}
