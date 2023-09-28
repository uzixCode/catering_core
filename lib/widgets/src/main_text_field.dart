import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:catering_core/core.dart';

class MainTextField extends StatelessWidget {
  const MainTextField({
    super.key,
    this.controller,
    this.isObscure = false,
    this.suffix,
    this.prefix,
    this.hintText,
    this.elevation,
    this.padding,
    this.margin,
    this.label,
    this.minLines,
    this.prefixPadding,
    this.sufixPadding,
    this.fontSize,
    this.maxLines = 1,
    this.readOnly = false,
    this.onChanged,
    this.onSubmitted,
    this.inputFormatters,
    this.keyboardType,
    this.backgroundColor,
  });
  final TextEditingController? controller;
  final bool isObscure;
  final Widget? prefix;
  final Widget? suffix;
  final String? hintText;
  final double? elevation;
  final double? padding;
  final double? prefixPadding;
  final double? sufixPadding;
  final EdgeInsetsGeometry? margin;
  final String? label;
  final bool readOnly;
  final int? minLines;
  final int? maxLines;
  final double? fontSize;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: context.rsize(1, max: 42, min: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
              child: MainText(
                label,
                style: TextStyle(
                    fontSize: fontSize ?? context.fontSize(25, max: 25)),
              ),
            ),

          // margin: margin ?? EdgeInsets.zero,
          // elevation: elevation ?? 0,
          // shape: RoundedRectangleBorder(
          //     side: const BorderSide(color: Colors.grey),
          //     borderRadius: BorderRadius.circular(10)),
          TextField(
            keyboardType: keyboardType,
            controller: controller,
            obscureText: isObscure,
            readOnly: readOnly,
            minLines: minLines,
            maxLines: maxLines,
            enableInteractiveSelection: true,
            onSubmitted: onSubmitted,
            onChanged: keyboardType != TextInputType.number
                ? onChanged
                : (String text) {
                    try {
                      if (controller == null) return;
                      final formatter = NumberFormat("#,###");
                      if (text.isEmpty) {
                        controller!.text = "0";
                      }
                      if (text.startsWith("0") && text.length > 1) {
                        controller!.text = text.substring(1);
                      }
                      if (text.isNotEmpty) {
                        controller!.text =
                            formatter.format(int.parse(text.numericOnly()));
                      }

                      controller!.selection = TextSelection.fromPosition(
                          TextPosition(offset: controller!.text.length));

                      if (onChanged != null) {
                        onChanged!(text.numericOnly());
                      }
                    } catch (e) {
                      log("error : $e");
                    }
                  },
            inputFormatters: inputFormatters,
            scrollPhysics: const AlwaysScrollableScrollPhysics(),
            style: GoogleFonts.roboto(fontSize: context.fontSize(25, max: 25)),
            decoration: InputDecoration(
              fillColor: backgroundColor,
              filled: backgroundColor == null ? false : true,
              suffixIcon: suffix,
              prefixIcon: prefix,
              hintText: hintText ?? "",
              hintStyle:
                  GoogleFonts.roboto(fontSize: context.fontSize(25, max: 25)),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: BaseColor.primary)),
            ),
          ),
        ],
      ),
    );
  }
}
