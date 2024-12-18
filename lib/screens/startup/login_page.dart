import 'package:flutter/material.dart';
import 'package:zacro_tribe/screens/demo/demo_home_page.dart';
import 'package:zacro_tribe/screens/home/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 75),
              child: TextFormField(
                controller: nameController,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: 'User Name',
                  floatingLabelStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
                  contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28.0),
                    borderSide: BorderSide(color: Colors.grey[300]!,),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28.0),
                    borderSide: BorderSide(color: Colors.grey[300]!,),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter User Name';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 15,),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DemoHomePage()),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFED222E),
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 80),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text('Continue', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
