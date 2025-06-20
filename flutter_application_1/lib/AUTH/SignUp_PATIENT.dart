import 'package:flutter/material.dart';
import 'package:flutter_application_1/HOME_PAGE/Choose%20Preview.dart';
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  DateTime? selectedDate;
  String? _gender;

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _phoneNumberController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(primary: Colors.blue),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _ageController.text =
            "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // --- اللوغو ---
                  Image.asset(
                    'assets/images/logo.png',
                    width: screenWidth * 0.4,
                    height: screenHeight * 0.2,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // --- الاسم ---
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person, color: Colors.white),
                      hintText: "الاسم",
                      hintStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.teal, // يمكنك تغييره إلى لون من اللوغو
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // --- الكنية ---
                  TextField(
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person, color: Colors.white),
                      hintText: "الكنية",
                      hintStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.teal,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),

                  // --- اسم المستخدم ---
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person, color: Colors.white),
                      hintText: "اسم المستخدم",
                      hintStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.teal,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),

                  // --- كلمة المرور ---
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock, color: Colors.white),
                      hintText: "كلمة المرور",
                      hintStyle: TextStyle(color: Colors.white),
                      helperText: _passwordController.text.length < 8 &&
                              _passwordController.text.isNotEmpty
                          ? "يجب أن تكون كلمة المرور 8 أحرف على الأقل"
                          : null,
                      helperStyle: TextStyle(color: Colors.red),
                      filled: true,
                      fillColor: Colors.teal,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (_) {
                      setState(() {});
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // --- رقم الموبايل ---
                  TextField(
                    controller: _phoneNumberController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone, color: Colors.white),
                      hintText: "رقم الموبايل",
                      hintStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.teal,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // --- الجنس - DropdownButtonFormField ---
                  InputDecorator(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person, color: Colors.white),
                      hintText: "اختر الجنس",
                      hintStyle: TextStyle(color: Colors.white),
                      filled: true,
                      fillColor: Colors.teal,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: _gender,
                        isExpanded: true,
                        hint: Text("اختر الجنس"),
                        items: ["ذكر", "أنثى"]
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _gender = value;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),

                  // --- العمر - تاريخ الميلاد ---
                  InkWell(
                    onTap: () => _selectDate(context),
                    child: IgnorePointer(
                      child: TextField(
                        controller: _ageController,
                        decoration: InputDecoration(
                          prefixIcon:
                              Icon(Icons.calendar_today, color: Colors.white),
                          hintText: "اختر العمر",
                          hintStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: Colors.teal,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // --- زر إنشاء الحساب ---
             ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.teal,
    foregroundColor: Colors.white,
    padding: EdgeInsets.symmetric(
      vertical: screenHeight * 0.015,
      horizontal: screenWidth * 0.1,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  ),
  onPressed: () {
    if (_nameController.text.trim().isEmpty ||
        _usernameController.text.trim().isEmpty ||
        _passwordController.text.trim().isEmpty ||
        _phoneNumberController.text.trim().isEmpty ||
        _ageController.text.trim().isEmpty ||
        _gender == null) {
      
      // إظهار رسالة خطأ إذا كانت هناك حقول فارغة
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("يرجى ملء جميع الحقول"),
        ),
      );
      return; // يتوقف هنا ولا يستمر في تنفيذ باقي الأوامر
    }

    // إذا كانت جميع البيانات صحيحة، ننتقل إلى الصفحة الرئيسية
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => previeww(),
      ),
    );
  },
  child: Text(
    "إنشاء الحساب",
    style: TextStyle(
      color: Colors.white,
      fontSize: screenHeight * 0.022,
      fontWeight: FontWeight.bold,
    ),
  ),
),
                  SizedBox(height: screenHeight * 0.015),

                  // --- رابط تسجيل الدخول ---
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "لديك حساب؟ ",
                        style: TextStyle(
                            color: Colors.teal, fontSize: screenHeight * 0.016),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.popAndPushNamed(context, '/Login');
                        },
                        child: Text(
                          "سجل الدخول الآن",
                          style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                            fontSize: screenHeight * 0.016,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}