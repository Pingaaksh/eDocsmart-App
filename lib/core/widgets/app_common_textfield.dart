import 'package:skin_match/core/common/app_common_exports.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class CommonMobileTextField extends StatefulWidget {
  const CommonMobileTextField({
    super.key,
    this.onChanged,
    this.onSubmitted,
    this.onValidate,
    this.borderRadius,
    required this.textEditController,
    required this.focusNode,
    required this.textInputType,
    this.textInputAction,
    required this.labelText,
    this.filledColor,
    this.isFilled,
    this.isBorderEnabled,
    this.onSaved,
  });

  final ValueChanged<PhoneNumber>? onChanged;
  final ValueChanged<PhoneNumber>? onSaved;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<bool>? onValidate;
  final double? borderRadius;
  final TextEditingController textEditController;
  final FocusNode focusNode;
  final TextInputType textInputType;
  final TextInputAction? textInputAction;
  final String labelText;
  final Color? filledColor;
  final bool? isFilled;
  final bool? isBorderEnabled;

  @override
  State<CommonMobileTextField> createState() => _CommonMobileTextFieldState();
}

class _CommonMobileTextFieldState extends State<CommonMobileTextField> {
  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      textFieldController: widget.textEditController,
      focusNode: widget.focusNode,
      onInputChanged: (PhoneNumber number) => widget.onChanged?.call(number),
      onFieldSubmitted: (value) => widget.onSubmitted?.call(value),
      onSaved: (PhoneNumber number) => widget.onSaved?.call(number),
      selectorConfig: const SelectorConfig(
        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
        setSelectorButtonAsPrefixIcon: true,
        leadingPadding: 5,
        trailingSpace: false,
        showFlags: false,
        useBottomSheetSafeArea: true,
      ),
      initialValue: initialCountryCode,
      selectorButtonOnErrorPadding: 20.w,
      searchBoxDecoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 12.h),
        hintText: widget.labelText,
        filled: widget.isFilled ?? true,
        fillColor: context.theme.colorScheme.surface,
        labelStyle: context.theme.textTheme.titleMedium?.copyWith(
          fontSize: 16.sp,
          color: context.theme.colorScheme.primaryContainer.withOpacity(0.6),
          fontWeight: FontWeight.w400,
        ),
        hintStyle: context.theme.textTheme.titleMedium?.copyWith(
          fontSize: 16.sp,
          color: context.theme.colorScheme.primaryContainer.withOpacity(0.6),
          fontWeight: FontWeight.w400,
        ),
        errorStyle: context.theme.textTheme.titleMedium?.copyWith(
          fontSize: 16.sp,
          color: context.theme.colorScheme.primary,
          fontWeight: FontWeight.w400,
        ),
        errorMaxLines: 2,
        border: getBorder(
          context,
          context.theme.colorScheme.outline,
          borderRadius: widget.borderRadius,
        ),
        enabledBorder: getBorder(
          context,
          context.theme.colorScheme.outline,
          borderRadius: widget.borderRadius,
        ),
        disabledBorder: getBorder(
          context,
          context.theme.colorScheme.outline,
          borderRadius: widget.borderRadius,
        ),
        focusedErrorBorder: getBorder(
          context,
          context.theme.colorScheme.error,
          borderRadius: widget.borderRadius,
        ),
        errorBorder: getBorder(
          context,
          context.theme.colorScheme.error,
          borderRadius: widget.borderRadius,
        ),
        focusedBorder: getBorder(
          context,
          context.theme.disabledColor,
          borderRadius: widget.borderRadius,
        ),
      ),
      selectorTextStyle: context.theme.textTheme.titleSmall?.copyWith(
        fontSize: 16.sp,
        color: context.theme.colorScheme.primaryContainer,
        decoration: TextDecoration.none,
        fontWeight: FontWeight.w500,
      ),
      onInputValidated: (bool value) => widget.onValidate?.call(value),
      spaceBetweenSelectorAndTextField: 25.w,
      textStyle: context.theme.textTheme.titleSmall?.copyWith(
        fontSize: 16.sp,
        color: context.theme.primaryColor,
        decoration: TextDecoration.none,
        fontWeight: FontWeight.w400,
      ),
      inputDecoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 12.h),
        hintText: widget.labelText,
        filled: widget.isFilled ?? true,
        fillColor: context.theme.colorScheme.surface,
        labelStyle: context.theme.textTheme.titleSmall?.copyWith(
          fontSize: 16.sp,
          color: context.theme.colorScheme.primaryContainer.withOpacity(0.6),
          fontWeight: FontWeight.w400,
        ),
        hintStyle: context.theme.textTheme.titleSmall?.copyWith(
          fontSize: 16.sp,
          color: context.theme.colorScheme.primaryContainer.withOpacity(0.6),
          fontWeight: FontWeight.w400,
        ),
        errorStyle: context.theme.textTheme.titleMedium?.copyWith(
          fontSize: 16.sp,
          color: context.theme.colorScheme.primary,
          fontWeight: FontWeight.w400,
        ),
        border: getBorder(
          context,
          context.theme.colorScheme.outline,
          borderRadius: widget.borderRadius,
        ),
        enabledBorder: getBorder(
          context,
          context.theme.colorScheme.outline,
          borderRadius: widget.borderRadius,
        ),
        disabledBorder: getBorder(
          context,
          context.theme.colorScheme.outline,
          borderRadius: widget.borderRadius,
        ),
        focusedErrorBorder: getBorder(
          context,
          context.theme.colorScheme.error,
          borderRadius: widget.borderRadius,
        ),
        errorBorder: getBorder(
          context,
          context.theme.colorScheme.error,
          borderRadius: widget.borderRadius,
        ),
        focusedBorder: getBorder(
          context,
          context.theme.disabledColor,
          borderRadius: widget.borderRadius,
        ),
      ),
    );
  }
}

class CommonTextField extends StatefulWidget {
  final TextEditingController textEditController;
  final FocusNode focusNode;
  final TextInputType textInputType;
  final TextInputAction? textInputAction;
  final String labelText;
  final Color? filledColor;
  final bool? isFilled;
  final bool? isBorderEnabled;
  final bool? isRequired;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final String? Function(String?)? onValidate;
  final double? borderRadius;
  final bool isPassword;
  final bool isTypeHint;
  final Widget? suffixIcon;
  final String? hintText;
  final bool enabled;
  final int? maxLine;
  final int? minLines;
  final bool? expands;
  final TextOverflow? hintTextOverFlow;
  final List<TextInputFormatter>? inputFormatters;
  final bool isLabelEnabled;
  final AutovalidateMode? autovalidateMode;
  final Widget? prefixIcon;

  const CommonTextField({
    super.key,
    required this.textEditController,
    required this.focusNode,
    this.textInputAction,
    required this.textInputType,
    required this.labelText,
    this.isFilled,
    this.filledColor,
    this.onChanged,
    this.isRequired,
    this.onSubmitted,
    this.borderRadius,
    this.autovalidateMode,
    required this.onValidate,
    this.isBorderEnabled,
    this.suffixIcon,
    this.hintText,
    this.enabled = true,
    this.maxLine,
    this.expands,
    this.minLines,
    this.hintTextOverFlow,
    this.inputFormatters,
    this.prefixIcon,
    this.isLabelEnabled = false,
  })  : isPassword = false,
        isTypeHint = false;

  CommonTextField.chat({
    super.key,
    required this.textEditController,
    required this.focusNode,
    this.textInputAction,
    required this.textInputType,
    required this.labelText,
    this.isFilled,
    this.onChanged,
    this.isRequired,
    this.autovalidateMode,
    this.borderRadius,
    required this.onValidate,
    this.onSubmitted,
    this.suffixIcon,
    this.hintText,
    this.enabled = true,
    this.maxLine,
    this.expands,
    this.minLines,
    this.hintTextOverFlow,
    this.inputFormatters,
    this.prefixIcon,
    this.isLabelEnabled = false,
  })  : isPassword = false,
        isBorderEnabled = false,
        isTypeHint = true,
        filledColor = Get.theme.scaffoldBackgroundColor;

  const CommonTextField.password({
    super.key,
    required this.textEditController,
    required this.focusNode,
    this.textInputAction,
    required this.textInputType,
    required this.labelText,
    this.isFilled,
    this.filledColor,
    this.autovalidateMode,
    this.onChanged,
    this.isRequired,
    this.onSubmitted,
    this.borderRadius,
    required this.onValidate,
    this.isBorderEnabled,
    this.suffixIcon,
    this.hintText,
    this.enabled = true,
    this.maxLine,
    this.expands,
    this.minLines,
    this.hintTextOverFlow,
    this.prefixIcon,
    this.inputFormatters,
    this.isLabelEnabled = false,
  })  : isPassword = true,
        isTypeHint = false;

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  bool passwordHide = true;

  void _toggleVisibility() => setState(() => passwordHide = !passwordHide);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.isLabelEnabled) ...[
          CommonTextRegular(
            text: widget.labelText,
            textAlign: TextAlign.start,
            size: 16.sp,
          ).paddingOnly(left: 10.w),
          SizedBox(height: 10.h),
        ],
        TextFormField(
          autovalidateMode: widget.autovalidateMode ?? AutovalidateMode.disabled,
          inputFormatters: widget.inputFormatters,
          controller: widget.textEditController,
          minLines: widget.minLines,
          maxLines: widget.maxLine ?? (widget.expands == true ? null : 1),
          expands: widget.expands ?? false,
          focusNode: widget.focusNode,
          textInputAction: widget.textInputAction ?? TextInputAction.next,
          keyboardType: widget.textInputType,
          enabled: widget.enabled,
          obscureText: widget.isPassword ? passwordHide : false,
          style: context.theme.textTheme.titleMedium?.copyWith(
            fontSize: 16.sp,
            color:
                context.theme.colorScheme.primaryContainer.withOpacity(widget.enabled ? 1 : 0.40),
            decoration: TextDecoration.none,
            fontWeight: FontWeight.w400,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 15.h),
            hintText: widget.hintText ?? widget.labelText,
            filled: widget.isFilled ?? true,
            fillColor: widget.enabled
                ? widget.filledColor ?? context.theme.colorScheme.secondary
                : context.theme.colorScheme.secondary.withOpacity(0.70),
            labelStyle: context.theme.textTheme.titleSmall?.copyWith(
              fontSize: 16.sp,
              color: context.theme.colorScheme.primaryContainer.withOpacity(0.6),
              fontWeight: FontWeight.w400,
            ),
            hintStyle: context.theme.textTheme.titleSmall?.copyWith(
              fontSize: 16.sp,
              color: context.theme.colorScheme.primaryContainer.withOpacity(0.6),
              fontWeight: FontWeight.w400,
              overflow: widget.hintTextOverFlow,
            ),
            errorStyle: context.theme.textTheme.titleMedium?.copyWith(
              fontSize: 16.sp,
              color: context.theme.colorScheme.error,
              fontWeight: FontWeight.w400,
            ),
            border: getBorder(
              context,
              context.theme.colorScheme.secondary,
              borderRadius: widget.borderRadius,
            ),
            enabledBorder: getBorder(
              context,
              context.theme.colorScheme.secondary,
              borderRadius: widget.borderRadius,
            ),
            disabledBorder: getBorder(
              context,
              context.theme.dividerColor,
              borderRadius: widget.borderRadius,
            ),
            focusedErrorBorder: getBorder(
              context,
              context.theme.colorScheme.error,
              borderRadius: widget.borderRadius,
            ),
            errorBorder: getBorder(
              context,
              context.theme.colorScheme.error,
              borderRadius: widget.borderRadius,
            ),
            focusedBorder: getBorder(
              context,
              context.theme.disabledColor,
              borderRadius: widget.borderRadius,
            ),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.isPassword
                ? Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: IconButton(
                      icon: Icon(
                        passwordHide ? Icons.visibility : Icons.visibility_off_rounded,
                      ),
                      color: const Color(0xFFBCA776),
                      onPressed: _toggleVisibility,
                    ),
                  )
                : AnimatedOpacity(
                    opacity: widget.enabled ? 1 : 0.30,
                    duration: const Duration(),
                    child: widget.suffixIcon,
                  ),
          ),
          onFieldSubmitted: widget.onSubmitted,
          onChanged: widget.onChanged,
          validator: widget.onValidate,
        ),
      ],
    );
  }
}

OutlineInputBorder getBorder(
  BuildContext context,
  Color borderColor, {
  double? borderRadius,
}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(borderRadius ?? 100.h),
    borderSide: BorderSide(
      color: borderColor,
    ),
  );
}
