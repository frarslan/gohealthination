import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../pages/pages_route_cubit.dart';
import '../shared/custom_text.dart';
import 'menu_items.dart';

class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({super.key});

  final tabs = [HomePage(), FormsPage(), PatientsPage(), MeetingsPage(),TasksPage()];
  Color color1 = const Color(0xff3e2093);
  Color color2 = const Color(0xff37b2cb);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PagesRoute, PageGeneral>(
      builder: (context, state) {
        return Container(
          color: const Color(0xfff4f5fa),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                  tabs.length,
                  (index) => InkWell(
                        onTap: () =>
                            context.read<PagesRoute>().selection(tabs[index]),
                        child: Tab(
                          icon: Icon(
                            tabs[index].icon,
                            color: state.icon == tabs[index].icon
                                ? color1
                                : Colors.black,
                          ),
                          child: CustomText(fontSize: 20.sp,
                            text: tabs[index].title,
                            color: state.icon == tabs[index].icon
                                ? color1
                                : Colors.black,
                          ),
                        ),
                      ))),
        );
      },
    );
  }
}
