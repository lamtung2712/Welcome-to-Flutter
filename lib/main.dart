import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NikeShoesPage(),
    );
  }
}

class NikeShoesPage extends StatefulWidget {
  @override
  _NikeShoesPageState createState() => _NikeShoesPageState();
}

class _NikeShoesPageState extends State<NikeShoesPage> {
  int _selectedImageIndex = 0;
  bool _isDescriptionExpanded = false; // Biến lưu trạng thái của mô tả

  // Danh sách các ảnh nhỏ cho Row 3
  final List<String> imageList = [
    "assets/Row3/Picture0.png",
    "assets/Row3/Picture1.png",
    "assets/Row3/Picture2.png",
    "assets/Row3/Picture3.png",
    "assets/Row3/Picture4.png",
    "assets/Row3/Picture5.png"
  ];

  // Danh sách các giày cho "Other Options"
  final List<String> otherShoes = [
    "Nike Air Max", "Nike React", "Nike Air Force", "Nike SB Dunk", "Nike Blazer"
  ];

  void _showBigImage(int index) {
    setState(() {
      _selectedImageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nike Shoes'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Quay lại màn hình trước
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print("Search icon clicked");
            },
          ),
        ],
      ),
      body: SingleChildScrollView(  // Cho phép cuộn xuống toàn bộ nội dung
        child: Column(
          children: [
            // Row 1: Tiêu đề "Nike Zoom X"
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Nike Zoom X',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),

            // Row 2: Nike ZoomX Invincible Run 3 và mô tả
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nike ZoomX Invincible Run 3',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'This running shoe is designed for comfort and support with a lightweight feel. It is perfect for long-distance runs.',
                    style: TextStyle(fontSize: 16),
                    maxLines: _isDescriptionExpanded ? null : 3, // Hiển thị tối đa 3 dòng nếu không mở rộng
                    overflow: TextOverflow.ellipsis, // Dùng "..." nếu văn bản dài hơn
                  ),
                  SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isDescriptionExpanded = !_isDescriptionExpanded; // Thay đổi trạng thái khi nhấn
                      });
                    },
                    child: Text(
                      _isDescriptionExpanded ? 'Show less' : 'Show more',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Row 3: Ảnh lớn khi click vào
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      contentPadding: EdgeInsets.all(0), // Loại bỏ padding mặc định
                      content: Container(
                        width: 600, // Tăng kích thước của container
                        height: 350, // Tăng chiều cao của container
                        child: Image.asset(
                          imageList[_selectedImageIndex], // Ảnh lớn được chọn từ Row 3
                          width: 300, // Tăng kích thước ảnh
                          height: 300, // Tăng kích thước ảnh
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              },
              child: Image.asset(
                imageList[_selectedImageIndex],
                width: double.infinity,
                height: 400,
                fit: BoxFit.cover,
              ),
            ),

            // Row 4: Các ô ảnh nhỏ khi nhấn vào sẽ hiển thị ảnh lớn
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(imageList.length, (index) {
                  return Expanded(  // Sử dụng Expanded để phân chia đều không gian
                    child: GestureDetector(
                      onTap: () => _showBigImage(index),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          imageList[index],
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),

            // Row 5: Hiển thị mũi tên xuống với text "Other Options"
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return SingleChildScrollView(  // Cung cấp cuộn cho danh sách giày
                      child: Container(
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Other Options',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 10),
                            Divider(thickness: 1),
                            ListView.builder(
                              shrinkWrap: true,  // Đảm bảo chiều cao của ListView không chiếm quá nhiều không gian
                              itemCount: otherShoes.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(otherShoes[index]),
                                  onTap: () {
                                    Navigator.pop(context); // Đóng modal khi chọn giày
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey.shade300,  // Màu khung
                      width: 1,
                    ),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_drop_down, size: 30),
                      SizedBox(width: 10),
                      Text(
                        'Other Options',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
