import 'package:flutter/material.dart';

class ShowData extends StatefulWidget {
  @override
  _ShowDataState createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  // final gueste;
  // final guestes;
  // final guested;
  // ShowData({this.gueste, this.guestes, this.guested});
  List<int> _list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 1; i <= 20; i++) {
      _list.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Show Data'),
        centerTitle: true,
      ),
      body: GridView.builder(
          itemCount: _list.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext contex, int index) {
            return Padding(
                padding: EdgeInsets.all(5.0),
                child: Container(
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: Text(
                    '${_list[index]}',
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ));
          }),
    );
  }
}
