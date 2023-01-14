import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:suitmedia_question_1/ui/second_screen/bloc/second_screen_bloc.dart';

import '../third_screen/third_screen.dart';

class SecondScreen extends StatelessWidget {
  final String nameText;
  const SecondScreen({super.key, required this.nameText});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SecondScreenBloc(),
      child: SecondScreenContent(
        nameText: nameText,
      ),
    );
  }
}

class SecondScreenContent extends StatelessWidget {
  final String nameText;
  const SecondScreenContent({super.key, required this.nameText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 28.5,
                vertical: 16,
              ),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset(
                      "assets/icons/back_icon.svg",
                      width: 24,
                      height: 24,
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Second Screen",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
            const Divider(
              color: Color(0xffe9e9e9),
              height: 1,
              thickness: 1,
            ),
            Expanded(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 21,
                      vertical: 13,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Welcome",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          nameText,
                          style: const TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: BlocBuilder<SecondScreenBloc, SecondScreenState>(
                      builder: (context, state) {
                        return Text(
                          state.name,
                          style: const TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () async {
                String? result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const ThirdScreen();
                    },
                  ),
                );

                if (result != null) {
                  // ignore: use_build_context_synchronously
                  context.read<SecondScreenBloc>().add(SelectedUser(result));
                }
              },
              child: Container(
                height: 41,
                margin: const EdgeInsets.only(
                  left: 33,
                  right: 33,
                  bottom: 32,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xff2B637B),
                ),
                child: const Center(
                  child: Text(
                    "Choose a User",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Poppins",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
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
