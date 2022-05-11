import 'package:flutter/material.dart';
import 'package:newprojectbin/mainpage.dart';
import 'package:newprojectbin/newdiarypage.dart';
import 'newdiarypage.dart';

class diary extends StatefulWidget {
  final String? value2;
  const diary({Key? key,this.value2}) : super(key: key);

  @override
  State<diary> createState() => _diaryState();
}

class _diaryState extends State<diary> {
  final diarytext1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 10,
        title: Text('일기'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.check),
              onPressed: () {
                print(diarytext1.text);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          newdiarypage(value: diarytext1.text)),//value에 텍스트 값 넣어서 newdiarypage로 전달
                );
                  MaterialPageRoute(
                      builder: (context) =>
                          MainPage(value3: diarytext1.text));//value3에 텍스트 값 넣어서 MainPage로 전달
              })
        ],
      ),
      body: Column(
        children: [
          Card(
            color: Colors.grey[200],
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                controller: diarytext1..text = '${widget.value2}', //textformfield 기본 값
                maxLines: 27,
                decoration: InputDecoration.collapsed(hintText: "일기를 작성하세요."),
              ),
            ),
          )
        ],
      ),
    );
  }
}
