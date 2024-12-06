import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zacro_tribe/utils/app_constants.dart';
import 'package:http/http.dart' as http;
import 'package:zacro_tribe/utils/auth_service.dart';

class VerifyOtpPage extends StatefulWidget {

  final String email;

  const VerifyOtpPage({super.key, required this.email});

  @override
  State<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {

  final _authService = AuthService();
  List<TextEditingController> otpControllers = List.generate(4, (index) => TextEditingController());
  List<String?> otpErrors = List.generate(4, (index) => null);
  int secondsRemaining = 60;
  Timer? timer;
  bool isSubmitting = false;

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (secondsRemaining > 0) {
          secondsRemaining--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  void submitOtp() {
    setState(() {
      isSubmitting = true;
    });
    verifyOtp();
  }

  void validateOtp() {
    setState(() {
      bool hasError = false;
      for (int i = 0; i < 4; i++) {
        if (otpControllers[i].text.isEmpty) {
          otpErrors[i] = '';
          hasError = true;
        } else {
          otpErrors[i] = null;
        }
      }

      if (!hasError) {
        submitOtp();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please enter all the Fields")),
        );
      }
    });
  }

  Future<void> verifyOtp() async {
    final apiUrl = Uri.parse("${appConstants.baseUrl}/verifyRegisterOtp");
    String otp = otpControllers.map((controller) => controller.text).join();
    try {
      var data = {
        "otp": otp,
        "email": widget.email
      };

      final response = await http.post(apiUrl, body: data);

      if (response.statusCode == 200) {
        final Map<String, dynamic> bodyData = jsonDecode(response.body);
        String token = bodyData['token'];
        await _authService.login(token);
        appConstants.accessToken = token;
        print('VerifyOTPSuccess: ${response.statusCode}, Msg: ${bodyData['message']}, Token: ${appConstants.accessToken}');
      } else {
        final Map<String, dynamic> errorBodyData = jsonDecode(response.body);
        throw Exception("VerifyOTPFailed: ${response.statusCode}, Msg: ${errorBodyData['message']}");
      }
    } catch (e) {
      throw Exception("VerifyOTPError: $e");
    }
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    otpControllers.forEach((controller) => controller.dispose());
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Verification', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black, size: 24,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'An Authentication code has been sent to',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, color: Colors.grey),
              ),
              const SizedBox(height: 8.0),
              Text(widget.email, style: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w700, color: Color(0xFFED222E)),),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(4, (index) {
                    return _buildStyledOtpInput(otpControllers[index], otpErrors[index], index);
                  }),
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: isSubmitting
                    ? null
                    : () {
                  validateOtp();
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 124),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: const Color(0xFFED222E),
                ),
                child: isSubmitting
                    ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )
                    : const Text('Submit', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14, color: Colors.white),),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Code Sent. Resend Code in ', style: TextStyle(color: Colors.grey),),
                  Text(secondsRemaining.toString().padLeft(2, '0'), style: const TextStyle(color: Color(0xFFED222E)),),
                ],
              ),
              const SizedBox(height: 5.0),
              GestureDetector(
                onTap: () {
                  if (secondsRemaining == 0) {
                    setState(() {
                      secondsRemaining = 60;
                    });
                    startTimer();
                  }
                },
                child: Text(
                  'Resend Code',
                  style: TextStyle(color: secondsRemaining == 0 ? const Color(0xFFED222E) : Colors.grey, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStyledOtpInput(TextEditingController controller, String? errorText, int index) {
    return SizedBox(
      width: 48.0,
      child: Column(
        children: [
          TextFormField(
            controller: controller,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Color(0xFF1F3BAE)),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Color(0xFFFF3B36)),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: const BorderSide(color: Color(0xFFFF3B36)),
              ),
              errorText: errorText,
            ),
            style: const TextStyle(
              fontSize: 24.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            onChanged: (value) {
              if (value.length == 1 && index < otpControllers.length - 1) {
                FocusScope.of(context).nextFocus();
              } else if (value.isEmpty && index > 0) {
                FocusScope.of(context).previousFocus();
              }
            },
          ),
        ],
      ),
    );
  }

}
