import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:newprojectbin/mainpage.dart';
import 'diarypage.dart';
import 'drawingpage.dart';
import 'package:flutter_drawing_board/flutter_drawing_board.dart';

class newdiarypage extends StatefulWidget {
  final String? value;
  final Uint8List? imagedata;
  const newdiarypage({Key? key, this.value,this.imagedata}) : super(key: key);

  @override
  State<newdiarypage> createState() => _newdiarypageState();
}

class _newdiarypageState extends State<newdiarypage> {
  final DrawingController _drawingController = DrawingController();
  final diarytext1 = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('일기 부분'),
        centerTitle: true,
        backgroundColor: Colors.grey,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.check),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainPage(value3: '${widget.value}',), // 메인 페이지로 일기 글 부분 값 이동
                  ),
                );
                print('${widget.value}');
              })
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 0),
              child: TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '일기 그림 부분',
                ),
                maxLines: 10,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => drawingpage()),
                  );
                },
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  hintText: '제목',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 20),
              child: TextFormField(
                controller: diarytext1..text = '${widget.value}', // 초기값

                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '일기 글 부분',
                ),
                maxLines: 11,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => diary(
                              value2: '${widget.value}',
                            )),
                  );
                },
                onChanged: (text) {
                  print(text);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
