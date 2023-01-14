import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../second_screen/second_screen.dart';
import '../widget/button_first_screen.dart';
import '../widget/dialog_palindrom.dart';
import '../widget/text_form.dart';
import 'bloc/first_screen_bloc.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FirstScreenBloc(),
      child: const FirstScreenContent(),
    );
  }
}

class FirstScreenContent extends StatelessWidget {
  const FirstScreenContent({super.key});

  bool isPalindromCheck(String text) {
    return text == text.split("").reversed.join();
  }

  void dismissKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final palindromText =
        context.select((FirstScreenBloc b) => b.state.palindromText);
    final name = context.select((FirstScreenBloc b) => b.state.name);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/background_fs.png",
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.all(33),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/ic_photo.png",
                  width: 116,
                  height: 116,
                ),
                const SizedBox(height: 58.12),
                textForm(
                  "Name",
                  (val) {
                    context.read<FirstScreenBloc>().add(
                          NameChangedEvent(val),
                        );
                  },
                ),
                const SizedBox(height: 22.12),
                textForm(
                  "Palindrome",
                  (val) {
                    context
                        .read<FirstScreenBloc>()
                        .add(PalindromTextChangedEvent(val.toLowerCase()));
                  },
                ),
                const SizedBox(height: 45),
                buttonFirstScreen(
                  "CHECK",
                  () {
                    dismissKeyboard(context);
                    if (palindromText.trim().isNotEmpty ||
                        palindromText.trim() != "") {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return dialogPalindrom(
                            context,
                            isPalindromCheck(palindromText),
                            palindromText,
                          );
                        },
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Palindrome is Empty",
                            style: TextStyle(fontFamily: "Poppins"),
                          ),
                        ),
                      );
                    }
                  },
                ),
                const SizedBox(height: 15),
                buttonFirstScreen(
                  "NEXT",
                  () {
                    dismissKeyboard(context);
                    if (name.trim().isNotEmpty || name.trim() != "") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SecondScreen(nameText: name.trim());
                          },
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Name is Empty",
                            style: TextStyle(fontFamily: "Poppins"),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
