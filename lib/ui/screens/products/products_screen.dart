import 'package:elevate_task/data/model/products_response_dm/products_response_dm.dart';
import 'package:elevate_task/domain/di/di.dart';
import 'package:elevate_task/ui/screens/products/products_states.dart';
import 'package:elevate_task/ui/screens/products/products_view_model.dart';
import 'package:elevate_task/ui/screens/products/widgets/product_item.dart';
import 'package:elevate_task/ui/shared_widget/failure_widget.dart';
import 'package:elevate_task/ui/utils/app_assets.dart';
import 'package:elevate_task/ui/utils/app_colors.dart';
import 'package:elevate_task/ui/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsScreen extends StatefulWidget {

  static const String routeName = "products_screen";

  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final ProductsViewModel viewModel = getIt<ProductsViewModel>();

  @override
  void initState() {
    viewModel.getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      appBar: AppBar(
        elevation: 0.0,

        backgroundColor: AppColors.white,

        title: Image.asset(
          AppAssets.appLogo,
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getResponsiveSize(context, size: 16)),

        child: BlocBuilder<ProductsViewModel, ProductsStates>(
          bloc: viewModel,
          builder: (context, state) {
            if (state is ProductsErrorState) {
              return FailureWidget(
                  errorMessage: state.errorMessage,
                  tryAgainFunction: (){
                    viewModel.getProducts();
                  }
              );
            }

            else if (state is ProductsSuccessState<List<ProductsResponseDM>> && state.data.isNotEmpty) {
              return GridView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: state.data.length,

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: MediaQuery.sizeOf(context).width * 0.03,
                  mainAxisSpacing: MediaQuery.sizeOf(context).width * 0.03,
                  childAspectRatio: 0.7
                ),

                itemBuilder: (context, index) => ProductItem(product: state.data[index])
              );
            }

            else if (state is ProductsSuccessState<List<ProductsResponseDM>> && state.data.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: [
                  Image.asset(
                    AppAssets.emptyListImage,
                    height: getResponsiveSize(context, size: 300),
                    fit: BoxFit.fill,
                  ),

                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.05,),

                  Text(
                    "No Available Products",

                    style: GoogleFonts.poppins(
                      fontSize: getResponsiveSize(context, size: getResponsiveSize(context, size: 16)),
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor
                    ),

                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              );
            }

            else {
              return const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,),);
            }
          },
        ),
      ),
    );
  }
}
