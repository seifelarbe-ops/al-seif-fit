import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: BodyApp(), debugShowCheckedModeBanner: false));

class BodyApp extends StatefulWidget {
  @override
  _BodyAppState createState() => _BodyAppState();
}

class _BodyAppState extends State<BodyApp> {
  TextEditingController w = TextEditingController();
  TextEditingController h = TextEditingController();
  String result = "";

  void calc() {
    double weight = double.tryParse(w.text) ?? 0;
    double height = double.tryParse(h.text) ?? 0;
    if (height > 0) {
      double bmi = weight / ((height / 100) * (height / 100));
      setState(() {
        if (bmi < 18.5) {
          result = "محتاج تزيد شوية 💪 BMI: ${bmi.toStringAsFixed(1)}";
        } else if (bmi < 25) {
          result = "جسمك مظبوط عاش 👏 BMI: ${bmi.toStringAsFixed(1)}";
        } else {
          result = "محتاج تخس شوية 🏃 BMI: ${bmi.toStringAsFixed(1)}";
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      appBar: AppBar(title: Text("Al-Seif Fit"), backgroundColor: Colors.green),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: w,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(labelText: "الوزن (كجم)", filled: true, fillColor: Color(0xFF1E1E1E)),
            ),
            SizedBox(height: 10),
            TextField(
              controller: h,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(labelText: "الطول (سم)", filled: true, fillColor: Color(0xFF1E1E1E)),
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: calc,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green, minimumSize: Size(double.infinity, 50)),
              child: Text("احسب جسمي"),
            ),
            SizedBox(height: 20),
            Text(result, style: TextStyle(color: Colors.white, fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
