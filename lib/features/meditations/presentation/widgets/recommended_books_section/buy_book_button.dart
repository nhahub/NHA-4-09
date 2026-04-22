import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/app_text_button.dart';
import '../../../data/models/book_model.dart';

class BuyBookButton extends StatelessWidget {
  final BookModel book;
  const BuyBookButton({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return book.saleInfo?.saleability == "FOR_SALE"
        ? SizedBox(
            width: double.infinity,
            child: AppTextButton(
              onPressed: () async {
                final url = Uri.parse(book.saleInfo!.buyLink!);
                await launchUrl(url, mode: LaunchMode.externalApplication);
              },
              buttonText: "Buy Now",
            ),
          )
        : Center(
            child: Text(
              "Not available for sale",
              style: AppStyles.semiBold16.copyWith(color: AppColors.orange),
            ),
          );
  }
}
