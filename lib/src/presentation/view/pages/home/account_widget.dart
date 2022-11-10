import 'package:riverpod_base/src/presentation/controller/auth/login_controller.dart';
import 'package:riverpod_base/src/presentation/controller/home/slider_controller.dart';
import 'package:riverpod_base/src/presentation/view/theme/theme.dart';
import 'package:riverpod_base/src/presentation/view/widgets/load/image_network_loading.dart';
import 'package:riverpod_base/src/translation/app_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AccountWidget extends ConsumerWidget {
  const AccountWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(loginControllerProvider);
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverList(delegate: SliverChildListDelegate([
            SizedBox(
              height: 218.h,
              child: Stack(
                children: [
                  Positioned.fill(child: Container(
                    color: AppColor.fillPositive,
                  )),
                  // Positioned(
                  //   left: 20.w,
                  //   top: 53.h,
                  //   child: Container(
                  //   color: AppColor.fillPositive,
                  //   child: SizedBox(
                  //       height: 24.h,
                  //       width: 24.h,
                  //       child: CupertinoButton(
                  //           padding: EdgeInsets.zero,
                  //           onPressed: () {
                  //             Get.back();
                  //             if (kDebugMode) {
                  //               print('back');
                  //             }
                  //           },
                  //           child: const Icon(
                  //             CupertinoIcons.back,
                  //             color: AppColor.content,
                  //           )
                  //       )
                  //   ),
                  // )),
                  Positioned.fill(
                      top: 40.h,
                      child: Column(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Container(
                                color: AppColor.backgroundLight,
                                child: ImageNetworkLoading(
                                   '${user.avatar}',
                                  fit: BoxFit.fill,
                                  height: 86,
                                  width: 86,
                                  errorWidget: Image.asset("assets/images/default_user.png"),
                                ),
                              )

                          ),
                          SizedBox(height: 5.h,),
                          Text(user.fullName(),
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: AppSize.textXl
                            ),
                          ),
                        ],
                      )
                  ),

                  Positioned.fill(
                      top: 180.h,
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Color(0xffFAFAFA),
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(28)
                            )
                        ),

                      )
                  ),
                ],
              ),
            ),
            ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 20.h,
                        width: 13.w,
                        child: SvgPicture.asset('assets/icons/ic_mail.svg',
                        ),
                      ),
                      SizedBox(width: 9.w,),
                      Text(
                        '${user.email}',
                        style: TextStyle(
                            fontSize: AppSize.textBase
                        ),
                      )
                    ],
                  ),
                ),
                const Divider(),
                SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 20.h,
                        width: 10.w,
                        child: SvgPicture.asset('assets/icons/ic_location.svg',
                        ),
                      ),
                      SizedBox(width: 12.w,),
                      // Text(_controller.user.value.address?? '',
                      //   style: TextStyle(
                      //       fontSize: AppSize.textBase
                      //   ),
                      // )
                    ],
                  ),
                ),
                const Divider(),
                InkWell(
                  onTap: (){
                    // Get.toNamed(Routes.ORDER_HISTORY);
                  },
                  focusColor: AppColor.fillPositive.withOpacity(0.5),
                  highlightColor: AppColor.fillPositive.withOpacity(0.5),
                  splashColor: AppColor.backgroundLight,
                  child: SizedBox(
                    height: 40,
                    child: Row(
                      children: [
                        SizedBox(
                          height: 20.h,
                          width: 13.w,
                          child: SvgPicture.asset('assets/icons/ic_clock_history.svg',
                          ),
                        ),
                        SizedBox(width: 9.w,),
                        Text(AppLocalization.of(context)!.translate('order_history'),
                          style: TextStyle(
                              fontSize: AppSize.textBase
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const Divider(),
                // InkWell(
                //   onTap: (){
                //     Get.toNamed(Routes.NOTIFICATION);
                //   },
                //   focusColor: AppColor.fillPositive.withOpacity(0.5),
                //   highlightColor: AppColor.fillPositive.withOpacity(0.5),
                //   splashColor: AppColor.backgroundLight,
                //   child: SizedBox(
                //     height: 40,
                //     child: Row(
                //       children: [
                //         SizedBox(
                //           height: 20.h,
                //           width: 12.w,
                //           child: SvgPicture.asset('assets/icons/ic_bell.svg',
                //           ),
                //         ),
                //         SizedBox(width: 10.w,),
                //         Text('notification'.tr,
                //           style: TextStyle(
                //               fontSize: AppSize.textBase
                //           ),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                // Divider(),
                InkWell(
                  onTap: (){
                    // Get.toNamed(Routes.FORGET_PASSWORD);
                  },
                  focusColor: AppColor.fillPositive.withOpacity(0.5),
                  highlightColor: AppColor.fillPositive.withOpacity(0.5),
                  splashColor: AppColor.backgroundLight,
                  child: SizedBox(
                    height: 40,
                    child: Row(
                      children: [
                        SizedBox(
                          height: 20.h,
                          width: 12.w,
                          child: SvgPicture.asset('assets/icons/ic_key.svg',
                          ),
                        ),
                        SizedBox(width: 10.w,),
                        Text(AppLocalization.of(context)!.translate('change_password'),
                          style: TextStyle(
                              fontSize: AppSize.textBase
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const Divider(),
                SizedBox(height: 38.h,),
                Padding(padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: CupertinoButton(
                      borderRadius: BorderRadius.circular(27),
                      child: Text(AppLocalization.of(context)!.translate('logout'),
                        style: const TextStyle(
                          color: AppColor.content,
                          fontWeight: FontWeight.w500,

                        ),
                      ),
                      color: AppColor.backgroundLight,
                      onPressed: (){
                        ref.read(loginControllerProvider.notifier).logout();
                        // _controller.logout();
                      }),
                )
              ],
            )
          ]
          ))
        ],
      ),
    );
  }
}
