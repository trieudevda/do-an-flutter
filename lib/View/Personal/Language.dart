import 'package:flutter/material.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  Widget btnLanguage(String title){
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
        side: BorderSide(color: Colors.black12), // foreground border
      ),
      onPressed: () {  },
      child: Padding(
        padding: const EdgeInsets.only(top: 10,bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.check,color: Colors.black),
            Text(title),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chọn ngôn ngữ'),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.check))
        ],
      ),
      body: Container(
        child: Column(
          children: [
            btnLanguage('Tiếng việt'),
            btnLanguage('English'),
          ],
        ),
      ),
    );
  }
}
