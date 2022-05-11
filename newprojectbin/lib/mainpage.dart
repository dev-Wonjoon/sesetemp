// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:newprojectbin/calendarevent.dart';
import 'package:newprojectbin/main.dart';
import 'package:newprojectbin/screen/LoginScreen.dart';
import 'package:table_calendar/table_calendar.dart';
import 'newdiarypage.dart';
import 'settingpage.dart';

class MainPage extends StatefulWidget {
  final String? value3;
  const MainPage({Key? key,this.value3}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  //달력 이벤트
  late Map<DateTime, List<calendarevent>> selectedEvents;

  void initState() {
    selectedEvents = {};
    super.initState();
  }

  List<calendarevent> getEventsfromday(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override

  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[200],
      drawer: Drawer(
        // 메뉴바
        backgroundColor: Colors.grey[300],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/gucci.jpg'),
                backgroundColor: Colors.white,
              ),
              accountName: Text('구찌'),
              accountEmail: Text('avan31017@gmail.com'),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20), //밑 둥글게
                      bottomRight: Radius.circular(20))),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.grey[800],
              ),
              title: Text('설정'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => settingpage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.power_settings_new,
                color: Colors.grey[800],
              ),
              title: Text('로그아웃'),
              onTap: () {
                logout(context);
              },
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 10,
        title: Text('일기장'),
        centerTitle: true,
        actions: <Widget>[
          IconButton( // 달력 이벤트
              icon: const Icon(Icons.autorenew),
              onPressed: () {
                if ('${widget.value3}'.isEmpty) {

                } else {
                  if (selectedEvents[selectedDay] != null) {
                    selectedEvents[selectedDay]?.add(
                        calendarevent(title: '${widget.value3}'));
                  }else{
                    selectedEvents[selectedDay]=[
                      calendarevent(title: '${widget.value3}')
                    ];
                  }
                }
                setState(() {

                });
                return;
              })
        ],
      ),
      // 테이블 캘린더
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime(1990),
            lastDay: DateTime(2050),
            focusedDay: focusedDay,
            calendarFormat: format,
            onFormatChanged: (CalendarFormat _format) {
              setState(() {
                format = _format;
              });
            },

            eventLoader: getEventsfromday,

            onDaySelected: (DateTime selectDay, DateTime focusDay) {
              setState(() {
                selectedDay = selectDay;
                focusedDay = focusDay;
              });
              print(focusDay);
            },
            calendarStyle: CalendarStyle(
              isTodayHighlighted: true,
              selectedDecoration: BoxDecoration(
                color: Colors.purple,
                shape: BoxShape.circle,
              ),
              selectedTextStyle: TextStyle(
                color: Colors.black,
              ),
            ),
            //날짜 클릭 이벤트
            selectedDayPredicate: (DateTime date) {
              return isSameDay(selectedDay, date);
            },
          ),
          //달력 이벤트
          ...getEventsfromday(selectedDay).map((calendarevent event) =>
          ListTile(title: Text(event.title)))
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => newdiarypage(value: ''),
            ), //일기페이지 이동
          );
        },
        label: Text('쓰기'),
        icon: Icon(Icons.add),
        backgroundColor: Colors.blue[900],
      ),
    );
  }
}

//메뉴바 로그아웃 버튼 기능
void logout(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
            // 알림창 라운드 처리
            borderRadius: BorderRadius.circular(8.0)),
        title: Text("알림"),
        content: Text("로그아웃 하시겠습니까?"),
        actions: <Widget>[
          new FlatButton(
            child: Text("예"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
          new FlatButton(
            child: Text('아니오'),
            onPressed: () {
              Navigator.pop(context); //알림창 끄기
            },
          )
        ],
      );
    },
  );
}
