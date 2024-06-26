import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/core/theming/app_theme.dart';
import 'package:e_commerce/features/cart/presentation/screens/cart_screen.dart';
import 'package:e_commerce/features/cart/presentation/widgets/open_cart_icon.dart';
import 'package:e_commerce/features/home/presentation/widgets/brands_section.dart';
import 'package:e_commerce/features/home/presentation/widgets/categories_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/route_blue.png",
            width: 66.w,
            height: 22.h,
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'what are you looking for?',
                    hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppTheme.blueColor,
                        ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: AppTheme.blueColor,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35.r)),
                  ),
                ),
              ),
               const OpenCartIcon(),
            ],
          ),
          SizedBox(height: 16.h,),
          CarouselSlider(
            items: [
              Image.asset(
                "assets/images/Variant1.png",
              ),
              Image.asset(
                "assets/images/Variant2.png",
              ),
              Image.asset(
                "assets/images/Variant3.png",
              ),
            ],
            options: CarouselOptions(
              viewportFraction: 0.98,
              initialPage: 0,
              enableInfiniteScroll: true,
              autoPlay: true,
              enlargeCenterPage: true,
              enlargeFactor: 0.7,
              scrollDirection: Axis.horizontal,
            ),
          ),
          CategoriesSection(),
          BrandsSection(),
        ],
      ),
    );
  }
}
