import 'package:flutter/material.dart';
import 'package:flutter_application_1/AUTH/SignUp_PATIENT.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// شاشات التسجيل لكل دور
class PatientRegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("تسجيل مريض")),
      body: Center(child: Text("شاشة تسجيل المريض")),
    );
  }
}

class StudentRegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("تسجيل طالب طب")),
      body: Center(child: Text("شاشة تسجيل الطالب")),
    );
  }
}

class ClinicRepRegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("تسجيل سفير العيادة")),
      body: Center(child: Text("شاشة تسجيل السفير")),
    );
  }
}

// شاشة اختيار نوع الحساب
class RoleSelectionScreen extends StatefulWidget {
  @override
  _RoleSelectionScreenState createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "اختيار نوع الحساب",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.teal),
                ),
              ),
              SizedBox(height: 20),

              // بطاقة مريض
              _buildRoleCard(
                context,
                title: "مريض",
                icon: FontAwesomeIcons.userInjured,
                color: Colors.teal,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => SignUp()),
                  );
                },
              ),
              SizedBox(height: 20),

              // بطاقة طالب طب
              _buildRoleCard(
                context,
                title: "طالب طب",
                icon: FontAwesomeIcons.graduationCap,
                color: Colors.teal,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => StudentRegisterScreen()),
                  );
                },
              ),
              SizedBox(height: 20),

              // بطاقة سفير عيادة
              _buildRoleCard(
                context,
                title: "سفير عيادة" ,
                icon: FontAwesomeIcons.hospital,
                color: Colors.teal,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ClinicRepRegisterScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleCard(
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Card(
        color: Colors.teal,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: Icon(icon, color: color, size: 30),
                  ),
                  SizedBox(width: 20),
                  Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                ],
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
