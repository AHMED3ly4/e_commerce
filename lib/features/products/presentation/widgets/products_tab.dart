import 'package:e_commerce/core/gi/service_locator.dart';
import 'package:e_commerce/core/indicators/shimmer_loading.dart';
import 'package:e_commerce/core/theming/app_theme.dart';
import 'package:e_commerce/features/cart/presentation/widgets/open_cart_icon.dart';
import 'package:e_commerce/features/products/presentation/cubit/product_states.dart';
import 'package:e_commerce/features/products/presentation/cubit/products_cubit.dart';
import 'package:e_commerce/features/products/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsTab extends StatefulWidget {
  const ProductsTab({super.key});

  @override
  State<ProductsTab> createState() => _ProductsTabState();
}
class _ProductsTabState extends State<ProductsTab> {
final ProductsCubit cubit =getIt.get<ProductsCubit>();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit.getAllProducts();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
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
        BlocBuilder<ProductsCubit,ProductsState>(
          bloc: cubit,
            builder: (context, state) {
              if(state is GetAllProductsLoading){
                return Expanded(
                  child: ShimmerLoading(
                      child: GridView.builder(
                        itemCount: 8,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing:16.h,
                          mainAxisSpacing: 16.h,
                          crossAxisCount: 2,
                          childAspectRatio: 191/192,
                        ),
                        itemBuilder: (context, index) => const ProductItem(),
                      )
                  ),
                );
              }else if(state is GetAllProductsSuccess){
                return Expanded(
                  child: GridView.builder(
                    itemCount: state.products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing:16.h,
                      crossAxisCount: 2,
                      childAspectRatio: 191/230,
                    ),
                    itemBuilder: (context, index) => ProductItem(product: state.products[index],),
                  ),
                );
              }else if(state is GetAllProductsError){
                return Center(
                  child: Column(
                    children: [
                      const Icon(Icons.error),
                      Text(state.errorMessage),
                    ],
                  ),
                );
              }
              return const Text("sss");
            },
        ),
      ],
    );
  }
}
