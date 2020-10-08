import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'bmi_result.dart';
import 'profil.dart';

class InputBMI extends StatefulWidget {
  @override
  _InputBMIState createState() => _InputBMIState();
}

class _InputBMIState extends State<InputBMI> {
  int tinggi = 0;
  int berat = 0;
  String nama = "-";
  String jenisKelamin = "-";
  DateTime tanggalLahir = DateTime.now();
  int jk; // jenis kelamin 
  
  // Date Picker 
  datePicker(BuildContext context) async{
    final DateTime date = await showDatePicker(
      context: context, 
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2045),
    );
    if(date != null){
      setState(() {
        tanggalLahir = date;
      });
      dateFieldController.text = 
          tanggalLahir.day.toString()+" - "+
          tanggalLahir.month.toString()+" - "+
          tanggalLahir.year.toString();
    }
  }
  
  // Text Controller for Text Field
  final TextEditingController dateFieldController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue,
      appBar: AppBar(
        //backgroundColor: Colors.black,
        centerTitle: true,
        leading: Icon(
          Icons.favorite,
          color: Colors.pink,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profil()),
              );
            },
          ),
        ],
        title: Text('MENGHITUNG BMI'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              //height: 20,
              // margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              // color: Colors.blue[700],
              child: Image.asset(
                'images/bmi_top.jpg',
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: TextField(
                        onChanged: (textValue) {
                          setState(() {
                            nama = textValue;
                          });
                        },
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                            // fillColor: Colors.blue[50],
                            hintText: 'Nama',
                            suffix: Icon(
                              Icons.account_box,
                            ),
                        ),
                      ),
                    ),
                  ],
                )),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: DropdownButton(
                        value: jk,
                        isExpanded: true,
                        hint: Text("Jenis Kelamin"),
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        items: [
                          DropdownMenuItem(
                            child: Text("Laki-Laki"),
                            value: 1,
                          ),
                          DropdownMenuItem(
                            child: Text("Perempuan"),
                            value: 2,
                          ),
                        ],
                        onChanged: (int value) {
                          setState(() {
                            jk = value;
                            if(jk == 1) {
                              jenisKelamin = "Laki-Laki";
                            }else{
                              jenisKelamin = "Perempuan";
                            } 
                          });
                        }, 
                      ),
                    ),
                  ],
                )),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: <Widget>[
                  TextField(
                    onTap: (){
                      datePicker(context);
                    },
                    controller: dateFieldController,
                    decoration: InputDecoration(
                      hintText: "Tanggal Lahir",
                      suffix: Icon(
                        Icons.calendar_today,
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    readOnly: true,
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                // color: Colors.blue[700],
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: TextField(
                        onChanged: (txt) {
                          setState(() {
                            berat = int.parse(txt);
                          });
                        },
                        keyboardType: TextInputType.number,
                        maxLength: 3,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                            suffix: Text('kg'),
                            // fillColor: Colors.blue[50],
                            hintText: 'Berat'),
                      ),
                    ),
                  ],
                )),
            Container(
              margin: EdgeInsets.only(right: 10, left: 10, bottom: 10),
              child: TextField(
                onChanged: (txt) {
                  setState(() {
                    tinggi = int.parse(txt);
                  });
                },
                keyboardType: TextInputType.number,
                maxLength: 3,
                style: TextStyle(
                  fontSize: 20,
                  //  color: Colors.black
                ),
                decoration: InputDecoration(
                    suffix: Text('cm'),
                    // fillColor: Colors.blue[50],
                    hintText: 'Tinggi'),
              ),
            ),
            Container(
              //height: double.infinity,
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BMIResult(
                              tinggi_badan: tinggi,
                              berat_badan: berat,
                              nama: nama,
                              jenisKelamin : jenisKelamin,
                              tanggalLahir: tanggalLahir,
                            )),
                  );
                },
                padding: EdgeInsets.only(top: 10, bottom: 10),
                color: Colors.blue[900],
                textColor: Colors.white,
                child: Text(
                  'HITUNG BMI',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        //color: Colors.transparent,
        child: Container(
          height: 60,
          color: Colors.indigo[800],
          alignment: Alignment.center,
          child: Text(
            'Developed by',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ),
        //elevation: 0,
      ),
    );
  }
}
