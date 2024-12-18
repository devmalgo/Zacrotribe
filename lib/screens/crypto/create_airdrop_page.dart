import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateAirdropPage extends StatefulWidget {
  const CreateAirdropPage({super.key});

  @override
  State<CreateAirdropPage> createState() => _CreateAirdropPageState();
}

class _CreateAirdropPageState extends State<CreateAirdropPage> {

  int currentStep = 0;

  final TextEditingController fNameController = TextEditingController();
  final TextEditingController lNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController twitterController = TextEditingController();
  final TextEditingController telegramController = TextEditingController();
  final TextEditingController discordController = TextEditingController();
  final TextEditingController wAddressController = TextEditingController();
  final TextEditingController linkController = TextEditingController();
  final TextEditingController refIDController = TextEditingController();
  final borderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30.0),
    borderSide: const BorderSide(color: Color(0xFFDDDDDD),),
  );
  final focusBorderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30.0),
    borderSide: const BorderSide(color: Colors.black),
  );
  final errorBorderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28.0),
    borderSide: const BorderSide(color: Color(0xFFED222E)),
  );
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0),
        child: Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(primary: Color(0xFFEE333E)),
          ),
          child: Stepper(
            type: StepperType.horizontal,
            steps: getSteps(),
            currentStep: currentStep,
            onStepContinue: () {
              final isLastStep = currentStep == getSteps().length - 1;
              if (isLastStep) {
                print('Completed');
              } else {
                setState(() {
                  currentStep += 1;
                });
              }
            },
            onStepTapped: (step) => setState(() => currentStep = step),
            onStepCancel: currentStep == 0
                ? null
                : () => setState(() => currentStep -= 1),
            controlsBuilder: (BuildContext context, ControlsDetails details) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 56,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: details.onStepContinue,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFEE333E),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          child: const Text('Continue', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                        ),
                      ),
                      const SizedBox(height: 8),
                      if (details.onStepCancel != null)
                        SizedBox(
                          height: 56,
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: details.onStepCancel,
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              side: const BorderSide(color: Color(0xFFEE333E)),
                            ),
                            child: const Text('Back', style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  if (currentStep == 2)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Supported Wallets", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),
                          const SizedBox(height: 25),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 75,
                                width: 70,
                                child: Column(
                                  children: [
                                    Image.asset('assets/icons/ic_meta_mask.png', height: 24, width: 24,),
                                    const SizedBox(height: 20,),
                                    const Text("Meta Mask", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 20,),
                              SizedBox(
                                height: 75,
                                width: 70,
                                child: Column(
                                  children: [
                                    Image.asset('assets/icons/ic_trust_wallet.png', height: 24, width: 24,),
                                    const SizedBox(height: 20,),
                                    const Text("Trust wallet", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  const Text("Disclaimers", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 8),
                  const Text(
                    "• Use only one wallet address for registration.\n"
                        "• Duplicate entries may be disqualified.\n"
                        "• Beware of scams.\n"
                        "• Only use official links provided here.",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  List<Step> getSteps() => [
    Step(
      state: currentStep > 0 ? StepState.complete : StepState.indexed,
      isActive: currentStep >= 0,
      title: const Text(''),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Personal Information", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),
          const SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 44,
                width: 152,
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFFDDDDDD)),
                    floatingLabelStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black),
                    contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    border: borderStyle,
                    enabledBorder: borderStyle,
                    focusedBorder: focusBorderStyle,
                    errorBorder: errorBorderStyle,
                    focusedErrorBorder: errorBorderStyle,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 44,
                width: 152,
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFFDDDDDD)),
                    floatingLabelStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black),
                    contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    border: borderStyle,
                    enabledBorder: borderStyle,
                    focusedBorder: focusBorderStyle,
                    errorBorder: errorBorderStyle,
                    focusedErrorBorder: errorBorderStyle,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 25,),
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: 'Email Address',
              labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFFDDDDDD)),
              floatingLabelStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black),
              contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              border: borderStyle,
              enabledBorder: borderStyle,
              focusedBorder: focusBorderStyle,
              errorBorder: errorBorderStyle,
              focusedErrorBorder: errorBorderStyle,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email address';
              } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                return 'Please enter valid email address';
              }
              return null;
            },
          ),
          const SizedBox(height: 25,),
          TextFormField(
            controller: mobileController,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              labelText: 'Mobile Number',
              labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFFDDDDDD)),
              floatingLabelStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black),
              contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              border: borderStyle,
              enabledBorder: borderStyle,
              focusedBorder: focusBorderStyle,
              errorBorder: errorBorderStyle,
              focusedErrorBorder: errorBorderStyle,
            ),
            inputFormatters: [
              LengthLimitingTextInputFormatter(10),
              FilteringTextInputFormatter.digitsOnly,
            ],
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your mobile number';
              }
              return null;
            },
          ),
          const SizedBox(height: 25,),
        ],
      ),
    ),
    Step(
      state: currentStep > 1 ? StepState.complete : StepState.indexed,
      isActive: currentStep >= 1,
      title: const Text(''),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Social media Details", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),
          const SizedBox(height: 25,),
          TextFormField(
            controller: twitterController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: 'Twitter ID',
              labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFFDDDDDD)),
              floatingLabelStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black),
              contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              border: borderStyle,
              enabledBorder: borderStyle,
              focusedBorder: focusBorderStyle,
              errorBorder: errorBorderStyle,
              focusedErrorBorder: errorBorderStyle,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your twitter ID';
              }
              return null;
            },
          ),
          const SizedBox(height: 25,),
          TextFormField(
            controller: telegramController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: 'Telegram UserName',
              labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFFDDDDDD)),
              floatingLabelStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black),
              contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              border: borderStyle,
              enabledBorder: borderStyle,
              focusedBorder: focusBorderStyle,
              errorBorder: errorBorderStyle,
              focusedErrorBorder: errorBorderStyle,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your telegram username';
              }
              return null;
            },
          ),
          const SizedBox(height: 25,),
          TextFormField(
            controller: discordController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              labelText: 'Discord ID',
              labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFFDDDDDD)),
              floatingLabelStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black),
              contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              border: borderStyle,
              enabledBorder: borderStyle,
              focusedBorder: focusBorderStyle,
              errorBorder: errorBorderStyle,
              focusedErrorBorder: errorBorderStyle,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your discord ID';
              }
              return null;
            },
          ),
          const SizedBox(height: 25,),
        ],
      ),
    ),
    Step(
      state: currentStep > 2 ? StepState.complete : StepState.indexed,
      isActive: currentStep >= 2,
      title: const Text(''),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Wallet Information", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),
          const SizedBox(height: 25,),
          TextFormField(
            controller: wAddressController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              labelText: 'Wallet Address',
              labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFFDDDDDD)),
              floatingLabelStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black),
              contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              border: borderStyle,
              enabledBorder: borderStyle,
              focusedBorder: focusBorderStyle,
              errorBorder: errorBorderStyle,
              focusedErrorBorder: errorBorderStyle,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your wallet address';
              }
              return null;
            },
          ),
          const SizedBox(height: 25,),
        ],
      ),
    ),
    Step(
      state: currentStep > 3 ? StepState.complete : StepState.indexed,
      isActive: currentStep >= 3,
      title: const Text(''),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Task Verification", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),
          const SizedBox(height: 25,),
          TextFormField(
            controller: linkController,
            keyboardType: TextInputType.url,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: 'Link',
              labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFFDDDDDD)),
              floatingLabelStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black),
              contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              border: borderStyle,
              enabledBorder: borderStyle,
              focusedBorder: focusBorderStyle,
              errorBorder: errorBorderStyle,
              focusedErrorBorder: errorBorderStyle,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your link here';
              }
              return null;
            },
          ),
          const SizedBox(height: 25,),
          TextFormField(
            controller: refIDController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              labelText: 'Referral ID (if applicable)',
              labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFFDDDDDD)),
              floatingLabelStyle: const TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black),
              contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              border: borderStyle,
              enabledBorder: borderStyle,
              focusedBorder: focusBorderStyle,
              errorBorder: errorBorderStyle,
              focusedErrorBorder: errorBorderStyle,
            ),
          ),
          const SizedBox(height: 25,),
        ],
      ),
    ),
    Step(
      state: currentStep > 4 ? StepState.complete : StepState.indexed,
      isActive: currentStep >= 4,
      title: const Text(''),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Consent", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),
          const SizedBox(height: 25,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 24,
                width: 24,
                child: Checkbox(
                  value: _isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value ?? false;
                    });
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  side: MaterialStateBorderSide.resolveWith((states) => const BorderSide(width: 1.0, color: Color(0xFFEE333E))),
                ),
              ),
              const SizedBox(width: 10,),
              const Text("agree to the terms and conditions of the airdrop \ncampaign", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),),
            ],
          ),
          const SizedBox(height: 25,),
        ],
      ),
    ),
  ];
}
