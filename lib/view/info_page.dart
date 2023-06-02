import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Row(
              children: const [
                Icon(Icons.settings),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Row(
              children: const [
                Icon(Icons.lens_blur),
                Text("Til"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
