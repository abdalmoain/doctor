import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notifications App',
      home: NotificationsScreen(),
    );
  }
}

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'الاشعارات',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'حسابي'),
        ],
        currentIndex: 1,
        selectedItemColor: Colors.teal,
      ),
      body: Padding(
        padding: EdgeInsets.all(width * 0.04),
        child: ListView(
          children: [
            _notificationCard(
              context,
              'يريد الطالب @ اسم الطالب بتقديم معالجة حالتك مجاناً للمريض @ اسم المريض !',
              isDoctor: false,
            ),
            SizedBox(height: 10),
            _notificationCard(
              context,
              'يريد الطالب @ اسم الطالب بتقديم معالجة حالتك مجاناً للمريض @ اسم المريض !',
              isDoctor: false,
            ),
            SizedBox(height: 10),
            _notificationCard(
              context,
              'لديك موعد مع الدكتور @ اسم الدكتور لتشخيص حالتك للمريض @ اسم المريض',
              isDoctor: true,
            ),
            SizedBox(height: 20),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'عرض الكل',
                    style: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      height: 6,
                    ),
                  ),
                  SizedBox(width: 6),
                  Icon(Icons.keyboard_arrow_down, color: Colors.teal),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _notificationCard(
    BuildContext context,
    String text, {
    bool isDoctor = false,
  }) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.teal.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      isDoctor ? DoctorProfileScreen() : StudentProfileScreen(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 233, 247, 245),
              foregroundColor: Colors.black,
            ),
            child: Text("عرض ملفه الشخصي"),
          ),
        ],
      ),
    );
  }
}

// صفحة ملف الدكتور
class DoctorProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text("ملف الدكتور"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: height * 0.300,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 231, 229, 229),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(48),
                  bottomLeft: Radius.circular(48),
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: EdgeInsets.only(top: height * 0.07),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.person, color: Colors.white, size: 60),
                    ),
                  ),
                  Positioned(
                    top: height * 0.223,
                    left: width * 0.05,
                    right: width * 0.05,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Text(
                            'اسم الدكتور',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'اختصاص: طب أسنان',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.05),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.teal),
                      SizedBox(width: 6),
                      Text("موقع العيادة", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: height * 0.18,
                    width: double.infinity,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.teal, width: 1.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("المدينة: "),
                        SizedBox(height: 6),
                        Text("الحي: "),
                        SizedBox(height: 6),
                        Text("الشارع:  "),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.05,
                vertical: height * 0.025,
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  side: BorderSide(color: Colors.teal, width: 1.5),
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  "حجز موعد",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StudentProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text("ملف الطالب"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: height * 0.300,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 231, 229, 229),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(48),
                  bottomLeft: Radius.circular(48),
                ),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: EdgeInsets.only(top: height * 0.06),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.person, color: Colors.white, size: 60),
                    ),
                  ),
                  Positioned(
                    top: height * 0.223,
                    left: width * 0.05,
                    right: width * 0.05,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Text(
                            'اسم الطالب',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'كلية طب الأسنان - السنة الرابعة',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.05),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "معلومات إضافية:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text("الجامعة: جامعة دمشق"),
                  Text("البريد الجامعي: student@email.com"),
                  Text("رقم الهاتف: 09988776655"),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.05,
                vertical: height * 0.025,
              ),
              child: ElevatedButton(
                onPressed: () {
                  // إجراء مثل إرسال رسالة للطالب
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  "طلب التواصل مع الطالب",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// صفحة الإشعارات العامة
class AllNotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("كل الإشعارات"), backgroundColor: Colors.teal),
      body: Center(child: Text("قائمة الإشعارات الكاملة")),
    );
  }
}
