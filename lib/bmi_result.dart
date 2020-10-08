
import 'package:flutter/material.dart';
import 'dart:math';

class BMIResult extends StatelessWidget {

  BMIResult({
    @required this.tinggi_badan, 
    @required this.berat_badan,
    @required this.nama,
    @required this.jenisKelamin,
    @required this.tanggalLahir,
  });
  final int tinggi_badan;
  final int berat_badan;
  final String nama;
  final String jenisKelamin;
  final DateTime tanggalLahir;
 // final String tanggalLahir;
 // final String jenisKelamin; 
  @override
  Widget build(BuildContext context) {
    double bmi = berat_badan/pow(tinggi_badan/100,2);
    String cBMI;
    int umur = DateTime.now().year - tanggalLahir.year;

    if (bmi>=28) cBMI="Obese";
    else if (bmi>=23) cBMI="Overweight";
    else if (bmi>=17.5) cBMI="Normal";
    else cBMI="Underweight";
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('RESULT'),
      ),
      body: Container(
      alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Nama : $nama",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ), 
            ),
            Text(
              "Jenis Kelamin : $jenisKelamin",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              "Umur : $umur",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20,),
            Text(
              cBMI,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w500,
                color: Colors.green,
              ),
            ),
            Text(
              bmi.toStringAsFixed(2),
              style: TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.w800,
                color: Colors.grey,
              ),
            ),
            Text(
              'Normal BMI Range',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Colors.grey[900],
              ),
            ),
            Text(
              '17,5 -  22.9 ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Colors.grey[900],
              ),
            ),

          ],
        ),
      ),
      bottomSheet: Container(
        width: double.infinity,
        height: 80,
        child: RaisedButton(

          color: Colors.indigo[900],
          child: Text('BACK',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),

          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

    );
  }
}
