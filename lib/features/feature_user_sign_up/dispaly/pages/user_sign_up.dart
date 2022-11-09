import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rapidor_task/configurations/styles/styles.dart';
import 'package:rapidor_task/core/use_cases/use_case.dart';
import 'package:rapidor_task/core/widgets/my_app_bar.dart';
import 'package:rapidor_task/features/feature_user_sign_up/dispaly/state_management/user_provider.dart';
import 'package:rapidor_task/features/feature_user_sign_up/dispaly/widgets/my_text_field.dart';

class UserSignUpPage extends ConsumerWidget {
  UserSignUpPage({Key? key}) : super(key: key);
  TextEditingController txtName = TextEditingController();
  TextEditingController txtMobile = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reference = ref.watch(userProvider);
    return Scaffold(
        appBar: MyAppBar(title: "User SignUp"),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyTextField(controller: txtName, hintText: "User name"),
              const SizedBox(height: 30),
              MyTextField(
                  controller: txtMobile,
                  hintText: "Mobile Number",
                  inputType: TextInputType.number),
              reference.userEntity == null
                  ? const Text("")
                  : !reference.userEntity!.status
                      ? Text(
                          reference.userEntity!.message.toString(),
                          style: errorTextStyle,
                        )
                      : Text(reference.userEntity!.message.toString(),
                          style: successTextStyle),
              ElevatedButton(
                  onPressed: () {
                    ref.read(userProvider).userSignUp(
                          SignUpWitNameAndPhoneParams(
                            userName: txtName.text.toString().trim(),
                            userMobile: txtMobile.text.toString().trim(),
                          ),
                        );
                  },
                  child: const Text("Submit"))
            ],
          ),
        ));
  }
}
