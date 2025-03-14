import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Chào mừng đến với Flutter")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Row chứa icon + text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.flutter_dash, color: Colors.blue, size: 50),
                  SizedBox(width: 10), // Khoảng cách giữa icon và text
                  Text(
                    "Welcome to Flutter",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Hiển thị ảnh từ assets
              Image.asset(
                "assets/flutter5786.jpg",
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),

              // Nút bấm với icon
              TextButton.icon(
                onPressed: () {
                  // Hiển thị SnackBar khi bấm vào nút
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Bạn đã nhấn nút!"),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                icon: Icon(Icons.touch_app, color: Colors.blue), // Biểu tượng
                label: Text("Nhấn vào đây"), // Nội dung nút
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// nếu muốn thêm row hoặc thêm column thì thêm ngay dưới text với định dạng
// Row("
// children[
//
// ]
// ")