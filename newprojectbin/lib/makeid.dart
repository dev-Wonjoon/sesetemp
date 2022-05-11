import 'package:flutter/material.dart';
import 'package:newprojectbin/components/makeid/make_id.dart';
import 'package:newprojectbin/components/makeid/make_name.dart';
import 'package:newprojectbin/components/makeid/make_password.dart';
import 'package:newprojectbin/components/makeid/make_passwordcheck.dart';
import 'package:newprojectbin/screen/LoginScreen.dart';

class makeid extends StatefulWidget {
  const makeid({Key? key}) : super(key: key);

  @override
  State<makeid> createState() => _makeidState();
}

class _makeidState extends State<makeid> {
  var _makeidTEC = TextEditingController();
  var _makepasswordTEC = TextEditingController();
  var _makepwcheckTEC = TextEditingController();
  var _makenameTEC = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(50, 150, 60, 100),
          child: Column(
            children: [
              Text('회원가입',
                  style: TextStyle(fontSize: 25)),
              make_id(tec: _makeidTEC),
              make_password(tec: _makepasswordTEC),
              make_passwordcheck(tec: _makepwcheckTEC),
              make_name(tec: _makenameTEC),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left:125,top: 10),
                    child: ElevatedButton(
                      onPressed: (){
                        print(
                            _makeidTEC.text+"/"+_makepasswordTEC.text+"/"+_makepwcheckTEC.text+"/"+
                                _makenameTEC.text+"/"
                        );
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=>LoginScreen())
                        );
                      },
                      child: Text('가입'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        primary: Colors.deepPurple[400],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
      ),
    );

  }
}
