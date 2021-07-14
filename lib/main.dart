import 'package:flutter/material.dart';
import 'package:to_do_list/another.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isHiddenPassWord = true;
  String username;
  String mail;
  String pass;
  final GlobalKey<FormState> _GSkey = new GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final pswController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('App'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _GSkey,
              child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.blue,
                              ),
                              hintText: 'Enter UserName',
                              labelText: "username",
                              fillColor: Colors.grey[100],
                              filled: true,
                            ),
                            controller: nameController,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please Enter UserName';
                              }
                              return null;
                            },
                            onSaved: (String value) {
                              username = value;
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.blue,
                              ),
                              hintText: 'Enter Mail',
                              fillColor: Colors.grey[110],
                              filled: true,
                            ),
                            controller: emailController,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please Enter valid mail';
                              }
                              Pattern pattern =
                                  r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)";
                              RegExp reExp = new RegExp(pattern);
                              if (!reExp.hasMatch(value)) {
                                return 'Email not corect';
                              }
                              return null;
                            },
                            onSaved: (String value) {
                              mail = value;
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                            obscureText: isHiddenPassWord,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                prefixIcon: Icon(
                                  Icons.security,
                                  color: Colors.blue,
                                ),
                                hintText: 'Enter PassWord',
                                fillColor: Colors.grey[110],
                                filled: true,
                                suffixIcon: InkWell(
                                  onTap: _tapPasswodView,
                                  child: Icon(Icons.visibility),
                                )),
                            controller: pswController,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Please Enter PassWord';
                              }
                              Pattern pattern =
                                  r'^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$';
                              RegExp reEx = new RegExp(pattern);
                              if (!reEx.hasMatch(value)) {
                                return 'Pass format not Correct';
                              }
                              return null;
                            },
                            onSaved: (String value) {
                              pass = value;
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              if (_GSkey.currentState.validate()) {
                                // var enter_value = nameController.text;
                                // print("$enter_value");
                                // var enter_values = nameControllers.text;
                                // print("$enter_values");
                                // var enter_valuep = nameControllerss.text;
                                // print("$enter_valuep");
                                // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ShowData(
                                //           gueste: enter_value,
                                //           guestes: enter_values,
                                //           guested: enter_valuep,
                                //         )));
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            ShowData()));
                                return;
                              }
                              _GSkey.currentState.save();
                              print(username);
                              print(mail);
                              print(pass);
                            },
                            child: Center(
                              child: Text('Submit'),
                            )),
                      ],
                    ),
                  )),
            ),
          ),
        ));
  }

  void _tapPasswodView() {
    setState(() {
      isHiddenPassWord = !isHiddenPassWord;
    });
  }
}
