import 'package:skin_match/core/common/app_common_exports.dart';
import 'package:get/get.dart';

class ImagePlaceHolder extends StatelessWidget {
  final String imageUrl;
  final String? placeholderImage;
  final double? height;
  final double? width;
  final double? paddingPlaceHolder;
  final double? placeHolderSize;
  final BoxFit? fit;

  const ImagePlaceHolder({
    super.key,
    required this.imageUrl,
    this.placeholderImage,
    this.height,
    this.width,
    this.fit,
    this.placeHolderSize,
    this.paddingPlaceHolder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.scaffoldBackgroundColor,
      height: height,
      width: width,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: fit ?? BoxFit.contain,
        progressIndicatorBuilder: (context, url, progress) => placeholder(),
        errorWidget: (context, url, error) {
          return placeholder();
        },
        errorListener: (value) {
          // Logger.write('Error : Unable to Load Image from url : $imageUrl');
        },
      ),
    );
  }

  Widget placeholder() {
    return Padding(
      padding: EdgeInsets.all(paddingPlaceHolder ?? 10.r),
      child: Opacity(
        opacity: 0.4,
        child: SvgPicture.asset(
          // SVGPath.placeholderBWIcon,
          '',
          width: placeHolderSize,
          height: placeHolderSize,
        ),
      ),
    );
  }
}
