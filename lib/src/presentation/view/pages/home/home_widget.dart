import 'package:riverpod_base/src/presentation/controller/auth/auth_controller.dart';
import 'package:riverpod_base/src/presentation/controller/controller.dart';
import 'package:riverpod_base/src/presentation/controller/home/slider_controller.dart';
import 'package:riverpod_base/src/presentation/view/theme/theme.dart';
import 'package:riverpod_base/src/presentation/view/widgets/widgets.dart';
import 'package:riverpod_base/src/translation/app_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeWidget extends ConsumerWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Map<String, String>> sliders = [
      {
        'icon': 'assets/images/international.png',
        'title': AppLocalization.of(context)!.translate('international_shipping'),
      },
      {
        'icon': 'assets/images/international_2.png',
        'title': AppLocalization.of(context)!.translate('international_shipping'),
      },
      {
        'icon': 'assets/images/international_3.png',
        'title': AppLocalization.of(context)!.translate('international_shipping'),
      }
    ];
    final PageController _pageController = PageController(
        keepPage: false,
        initialPage: 1,
        viewportFraction: 0.5);
    final TextEditingController _searchTextController = TextEditingController();
    final sliderIndex = ref.watch(sliderControllerProvider);
    final isLogged = ref.watch(authControllerProvider);

    return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width:MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child:SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(height: 40.h,),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      child: AppbarDropdownButton(),
                    ),
                    SizedBox(height: 10.h,),
                    Align(
                      alignment: Alignment.topCenter,
                      child: SizedBox(
                        height: 244.h,
                        child: PageView.builder(
                            itemCount: sliders.length,
                            physics: const BouncingScrollPhysics(),
                            controller: _pageController,
                            onPageChanged: (index){
                              ref.read(sliderControllerProvider.notifier).changeSliderIndex(index);
                            },
                            itemBuilder: (context,pagePosition){
                              return
                                pagePosition== sliderIndex ?
                                SizedBox(
                                  height: 244.h,
                                  child: Container(
                                      color: AppColor.fillPositive,
                                      child: Center(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Image.asset(
                                              '${sliders[pagePosition]['icon']}',
                                              width: 66.w,
                                              height: 66.h,
                                            ),
                                            SizedBox(height: 20.h,),
                                            Text('${sliders[pagePosition]['title']}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 16.sp
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                  ),

                                ) :
                                Container(
                                    width: 185.w,
                                    height: 183.h,
                                    margin: EdgeInsets.all(20.w),
                                    alignment: Alignment.center,
                                    color: AppColor.backgroundLight,
                                    child: Center(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(
                                            '${sliders[pagePosition]['icon']}',
                                            width: 54.w,
                                            height: 54.h,
                                          ),
                                          SizedBox(height: 20.h,),
                                          Text('${sliders[pagePosition]['title']}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 14.sp
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                );
                            }
                        ),
                      ),
                    ),
                    SizedBox(height: 195.h,),
                    Container(
                      height: 47.h,
                      padding: EdgeInsets.symmetric(horizontal: 40.w),
                      child: TextFormField(
                        obscureText: false,
                        cursorHeight: 18.h,
                        autofocus: false,
                        autovalidateMode: AutovalidateMode.disabled,
                        style: const TextStyle(
                            color: AppColor.content
                        ),
                        onSaved: (value){
                          print(value);
                        },
                        validator: (value){
                          print(value);
                        },
                        onChanged: (value){
                          print(value);
                        },
                        onTap: (){

                        },

                        onEditingComplete: (){
                          FocusManager.instance.primaryFocus!.unfocus();
                        },
                        controller: _searchTextController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.8),
                          hintText: AppLocalization.of(context)!.translate('enter_order'),
                          hintStyle: const TextStyle(
                            color: AppColor.content3,
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 5.0.h, horizontal: 10.w),
                          prefixIcon: Padding(
                              padding: EdgeInsets.only(left: 16.w, right: 5.w),
                              child: SvgPicture.asset("assets/icons/ic_search.svg")
                          ),
                          prefixIconConstraints: BoxConstraints(
                              maxHeight: 18.h
                          ),
                          suffixIcon: isLogged ? GestureDetector(
                            onTap: (){
                              ref.read(tabBarControllerProvider.notifier).changeTabIndex(1, context);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(right: 16.w),
                              child: Image.asset("assets/images/qr.png",

                              ),
                            ),
                          ) : const SizedBox(),
                          suffixIconConstraints: BoxConstraints(
                              maxHeight: 29.h
                          ),

                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(27)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(27)
                          ),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(27)
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(27)
                          ),
                          errorStyle: const TextStyle(
                            color: AppColor.accent2,
                          ),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(27)
                          ),
                        ),

                      ),
                    ),
                    SizedBox(height: 11.h,),

                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 40.w),
                      child: CupertinoButton(
                          color: AppColor.fillPositive,
                          disabledColor: AppColor.content4,
                          borderRadius: BorderRadius.circular(27),
                          child: Center(
                            child: Text(AppLocalization.of(context)!.translate('search'
                            ),
                              style: const TextStyle(
                                  color: AppColor.content,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),


                          onPressed:  (){
                            // _homeController.getTransport();
                          }) ,
                    ),
                    SizedBox(height: 40.h,),
                  ],
                ),
                // Obx(()=>
                // _homeController.loadingTransport.value ? const Positioned.fill(child: Center(
                //   child: CircularProgressIndicator.adaptive(),
                // )
                // ): const SizedBox(),),

              ],
            ),
          ) /* add child content here */,
        )
    );
  }
}
