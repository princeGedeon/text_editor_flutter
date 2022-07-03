import 'package:flutter/material.dart';

final List<Map<String, dynamic>> contents = [
  {"content": "lorem"},
  {"content": "Blabla"}
];

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final TextEditingController contentController = TextEditingController();
  @override
  void initState() {
    super.initState();

    contentController.addListener(() {
      if (contentController.text.isNotEmpty) {
        setState(() {
          contents.add({
            "content": contentController.text,
          });
        });
      }
    });
  }

  @override
  void dispose() {
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(Object context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text("Editeur | By PrinceG")),
      body: Row(children: [
        Expanded(
            flex: 2,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Nouveau Contenu"),
                    ),
                  ),
                ),
                Expanded(
                    child: ListView.separated(
                  separatorBuilder: ((context, index) => const Divider()),
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        contents[index]["content"]!.toUpperCase(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      onTap: () {},
                    );
                  },
                  itemCount: contents.length,
                )),
              ],
            )),
        Expanded(
            flex: 5,
            child: Container(
                child: Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                      controller: contentController,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Laissez libre cours a votre imagination...",
                      ))
                ],
              ),
            )))
      ]),
    );
  }
}
