import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:gimme_delivery/core/theme/theme.dart';
import 'package:gimme_delivery/features/authentication/presentation/tab_view/signin_tab_view.dart';
import 'package:gimme_delivery/features/authentication/presentation/tab_view/signup_tab_view.dart';

@RoutePage()
class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({this.initialIndex = 0, super.key});

  static const String routeName = '/authentication-page';

  final int initialIndex;

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage>
    with TickerProviderStateMixin {
  late final TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Gap(30.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shipping and Track Anytime',
                    style: AppTextStyle.headlineLarge(),
                  ),
                  Gap(10.h),
                  Text(
                    'Get great experience with tracky',
                    style:
                        AppTextStyle.bodyMedium(color: AppColors.hintTextColor),
                  ),
                  Gap(30.h),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceColor,
                      borderRadius: BorderRadius.circular(50.sp),
                    ),
                    child: DefaultTabController(
                      length: 2,
                      initialIndex: 0,
                      child: TabBar(
                        controller: _controller,
                        tabs: const [
                          Tab(
                            text: 'Sign Up',
                          ),
                          Tab(
                            text: 'Sign In',
                          )
                        ],
                      ),
                    ),
                  ),
                  Gap(30.h),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _controller,
                children: const [
                  SignupTabView(),
                  SigninTabView(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
