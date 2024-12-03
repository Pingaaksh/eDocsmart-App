import 'package:skin_match/core/common/app_common_exports.dart';
import 'package:get/get.dart';

class PriceDifferenceTextRow extends StatelessWidget {
  final String discountPrice;
  final String actualPrice;
  final double? discountPriceSize;
  final double? actualPriceSize;
  const PriceDifferenceTextRow({
    super.key,
    required this.discountPrice,
    required this.actualPrice,
    this.discountPriceSize,
    this.actualPriceSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonTextMedium(
          text: '$currencyCode$discountPrice',
          color: context.theme.colorScheme.primary,
          size: discountPriceSize ?? 36.sp,
        ),
        SizedBox(
          height: 10.h,
        ),
        CommonTextRegular.lineThrough(
          text: '$currencyCode$actualPrice',
          size: actualPriceSize ?? 28.sp,
          color: context.theme.colorScheme.secondaryContainer,
        ),
      ],
    );
  }
}
