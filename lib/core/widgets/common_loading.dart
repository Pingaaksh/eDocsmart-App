import 'package:skin_match/core/common/app_common_exports.dart';
import 'package:skin_match/core/widgets/custom_progress_dialog.dart';

class CommonLoading extends StatelessWidget {
  const CommonLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomProgressDialog(),
        ],
      ),
    );
  }
}
