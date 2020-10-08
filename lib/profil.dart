import 'package:flutter/material.dart';

class Profil extends StatelessWidget {
  const Profil({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('PROFIL'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                width: 200,
                height: 200,
                margin: EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("images/turtoise.jpg"),
                    fit: BoxFit.cover,
                  ),
                  //borderRadius: BorderRadius.circular(10000),
                ),
              ),
              Text("Nama : Turtoise"),
              Text("Jenis Kelamin : Laki-Laki"),
              Text("Tanggal Lahir : 20-02-2000"),
            ],
          ),
        ),
        bottomSheet: Container(
          width: double.infinity,
          height: 60,
          child: RaisedButton(
              color: Colors.indigo[800],
              child: Text(
                "BACK",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
      ),
    );
  }
}
