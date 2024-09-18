import 'package:cached_network_image/cached_network_image.dart';
import 'package:elevate_task/data/model/products_response_dm/products_response_dm.dart';
import 'package:elevate_task/domain/di/di.dart';
import 'package:elevate_task/ui/screens/products/products_view_model.dart';
import 'package:elevate_task/ui/utils/app_assets.dart';
import 'package:elevate_task/ui/utils/app_colors.dart';
import 'package:elevate_task/ui/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductItem extends StatelessWidget {
  final ProductsResponseDM product;
  final ProductsViewModel viewModel = getIt<ProductsViewModel>();

  ProductItem({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,

      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColor, width: getResponsiveSize(context, size: 1.2)),
        borderRadius: BorderRadius.circular(getResponsiveSize(context, size: 15)),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                CachedNetworkImage(
                    imageUrl: product.image ?? "",
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.contain,
                        ),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(getResponsiveSize(context, size: 14)),
                            topRight: Radius.circular(getResponsiveSize(context, size: 14)
                          )
                        ),
                      ),
                    ),
                    progressIndicatorBuilder: (_, __, ___) => const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    errorWidget: (_, __, ___) => const Center(
                      child: Icon(Icons.error, color: AppColors.red,),
                    )),

                Padding(
                  padding: EdgeInsets.all(getResponsiveSize(context, size: 6)),

                  child: CircleAvatar(
                    maxRadius: getResponsiveSize(context, size: 15),
                    child: IconButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.white,
                          shadowColor: AppColors.primaryColor,
                          padding: EdgeInsets.zero,
                          elevation: 3.0
                      ),
                      icon: ImageIcon(

                        const AssetImage(AppAssets.wishListIcon),
                        size: getResponsiveSize(context, size: 18),
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),

          SizedBox(height: getResponsiveSize(context, size: 8),),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: getResponsiveSize(context, size: 6)),

            child: Text(
              product.title ?? "Product Title",
              textAlign: TextAlign.start,
              style: GoogleFonts.poppins(
                  fontSize: getResponsiveSize(context, size: 14),
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor),
              overflow: TextOverflow.ellipsis,
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: getResponsiveSize(context, size: 6)),
            child: Text(
              product.description ?? "Product Description",
              textAlign: TextAlign.start,
              style: GoogleFonts.poppins(
                  fontSize: getResponsiveSize(context, size: 16),
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor),
              overflow: TextOverflow.ellipsis,
            ),
          ),

          SizedBox(height: MediaQuery.sizeOf(context).height * 0.01,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: getResponsiveSize(context, size: 100),

                  child: Text(
                    "EGP ${product.price?.toStringAsFixed(2)}",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                SizedBox(
                  width: getResponsiveSize(context, size: 50),

                  child: Text(
                    "${viewModel.calculateProductPriceBeforeDiscount(product.price, 20)} EGP",
                    style: GoogleFonts.poppins(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w400,
                        color: AppColors.primaryColor.withOpacity(0.7),
                        decoration: TextDecoration.lineThrough,
                        letterSpacing: -0.3
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Row(
              children: [
                Text(
                  "Review (${product.rating?.rate?.toStringAsFixed(2)})",
                  style: GoogleFonts.poppins(
                    fontSize: getResponsiveSize(context, size: 12),
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),

                Icon(
                  Icons.star_rate_rounded,
                  color: AppColors.yellow,
                  size: getResponsiveSize(context, size: 20),
                ),

                const Spacer(),

                InkWell(
                  onTap: () {},

                  child: ImageIcon(
                    const AssetImage(AppAssets.plusIcon),
                    color: AppColors.primaryColor,
                    size: getResponsiveSize(context, size: 20),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
