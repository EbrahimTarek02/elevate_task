import 'package:elevate_task/ui/utils/app_colors.dart';
import 'package:elevate_task/ui/utils/app_text_styles.dart';
import 'package:elevate_task/ui/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FailureWidget extends StatelessWidget {

  final String errorMessage;
  final Function tryAgainFunction;

  const FailureWidget({required this.errorMessage, required this.tryAgainFunction, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => tryAgainFunction(),

      child: Container(
        padding: EdgeInsets.symmetric(horizontal: getResponsiveSize(context, size: 16)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            errorMessage == Constants.networkErrorMessage
                ?
            CircleAvatar(
                maxRadius: getResponsiveSize(context, size: 22),
                backgroundColor: AppColors.red,
                child: Icon(
                  Icons.wifi_off,
                  color: AppColors.white,
                  size: getResponsiveSize(context, size: 30),
                )
            )
                :
            Icon(
              Icons.error,
              color: AppColors.red,
              size: getResponsiveSize(context, size: 45),
            ),

            SizedBox(height: getResponsiveSize(context, size: 20)),

            Text(
              errorMessage,
              style: GoogleFonts.poppins(
                  fontSize: getResponsiveSize(context, size: 16),
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: getResponsiveSize(context, size: 20)),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.refresh,
                  color: AppColors.primaryColor,
                  size: getResponsiveSize(context, size: 20),
                ),

                Text(
                  "Try Again",
                  style: GoogleFonts.poppins(
                      fontSize: getResponsiveSize(context, size: 12),
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
