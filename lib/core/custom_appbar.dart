import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/pages_route_cubit.dart';
import '../shared/custom_text.dart';
import 'menu_items.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppbar({super.key});
  Color color1 = const Color(0xff3e2093);
  Color color2 = const Color(0xff37b2cb);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PagesRoute, PageGeneral>(builder: (context, state) {
      return AppBar(
        // leading: popScope(_titles[state.index], context),
        elevation: 0,
        backgroundColor: color1,
      /*  actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25).r,
            child: InkWell(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              onTap: () {
                context.read<PagesRoute>().selection(ProfilePage());
              },
              child: const CircleAvatar(
                child: CustomText(text: '1'),
              ),
            ),
          )
        ],*/
        title: CustomText(
          text: context.read<PagesRoute>().state.title,
          fontSize: 30.sp,color: Colors.white,
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      );
    });
  }

  @override
  Size get preferredSize => const Size.fromHeight(75);
}
