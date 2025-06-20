import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _showPasswordField = false;
  bool _submitted = false;
  bool _isUserTypingPassword = false;

  final String correctUsername = "user"; 
  final Password = "12345678";// اسم المستخدم الصحيح للتجريب

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool get _isPasswordTooShort =>
      _passwordController.text.isNotEmpty &&
      _passwordController.text.length < 8;

  bool get _shouldShowPasswordHint =>
      _isUserTypingPassword && _isPasswordTooShort;

  void _validateAndLogin() {
    setState(() {
      _submitted = true;
    });

    final username = _usernameController.text;
    final password = _passwordController.text;

    if (username.isEmpty || password.isEmpty || password.length < 8 || username != correctUsername) {
      // فشل التحقق، إظهار الأخطاء
      return;
      
    }

    // نجاح التحقق → الانتقال للصفحة الرئيسية
    Navigator.popAndPushNamed(context, '/previeww');
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // --- اللوغو ---
                Image.asset(
                  'assets/images/logo.png',
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.22,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: screenHeight * 0.02),

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
                    errorText: _submitted && _usernameController.text.isEmpty
                        ? "يرجى إدخال اسم المستخدم"
                        : _submitted &&
                                _usernameController.text.isNotEmpty &&
                                _usernameController.text != correctUsername
                            ? "اسم المستخدم غير صحيح"
                            : null,
                  ),
                ),
                SizedBox(height: screenHeight * 0.015),

                // --- كلمة المرور ---
                TextField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  onTap: () {
                    if (!_showPasswordField) {
                      setState(() {
                        _showPasswordField = true;
                      });
                    }
                  },
                  onChanged: (_) {
                    setState(() {
                      _isUserTypingPassword = true;
                    });
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Colors.white),
                    hintText: "كلمة المرور",
                    hintStyle: TextStyle(color: Colors.white),
                    filled: true,
                    fillColor: Colors.teal,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: _passwordController.text.isNotEmpty
                        ? IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          )
                        : null,
                    errorText: _submitted && _passwordController.text.isEmpty
                        ? "يرجى إدخال كلمة المرور"
                        : _submitted &&
                                _passwordController.text.length < 8 &&
                                _passwordController.text.isNotEmpty&&
                                _passwordController.text!=Password
                            ? "كلمة المرور يجب أن تكون 8 أحرف على الأقل"
                            : null,
                    helperText: _shouldShowPasswordHint
                        ? "كلمة المرور يجب أن تكون 8 أحرف على الأقل"
                        : null,
                    helperStyle: TextStyle(color: Colors.red),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),

                // --- زر تسجيل الدخول ---
                ElevatedButton(
                  onPressed: _validateAndLogin,
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
                  child: Text(
                    "تسجيل الدخول",
                    style: TextStyle(
                      fontSize: screenHeight * 0.022,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.015),

                // --- رابط إنشاء حساب ---
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "ليس لديك حساب؟ ",
                      style: TextStyle(
                          color: Colors.teal,
                          fontSize: screenHeight * 0.016),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, '/SignUp');
                      },
                      child: Text(
                        "إنشاء حساب",
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
    );
  }
}
