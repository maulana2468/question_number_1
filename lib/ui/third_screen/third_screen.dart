import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:suitmedia_question_1/enum.dart';
import 'package:suitmedia_question_1/ui/widget/list_data.dart';
import 'package:suitmedia_question_1/ui/third_screen/bloc/third_screen_bloc.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThirdScreenBloc()..add(InitLoadData()),
      child: const ThirdScreenContent(),
    );
  }
}

class ThirdScreenContent extends StatelessWidget {
  const ThirdScreenContent({super.key});

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
                    onTap: () => Navigator.pop(
                      context,
                      null,
                    ),
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
                      "Third Screen",
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
              child: BlocBuilder<ThirdScreenBloc, ThirdScreenState>(
                builder: (context, state) {
                  if (state.status == DataAvailable.initLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Color(0xff2B637B),
                      ),
                    );
                  } else if (state.status == DataAvailable.available) {
                    return ListData(initData: state.listData);
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
