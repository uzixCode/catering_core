import 'package:catering_core/core.dart';
import 'package:flutter/material.dart';

class MenuListTile extends StatelessWidget {
  const MenuListTile({super.key, required this.label, this.onTap});
  final String label;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: SizedBox(
        height: context.rsize(.2),
        child: GestureDetector(
          onTap: onTap,
          child: Card(
            clipBehavior: Clip.antiAlias,
            elevation: 5,
            margin: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                const SizedBox(
                  width: 20,
                  height: double.infinity,
                  child: Card(
                    elevation: 5,
                    color: BaseColor.primary,
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: MainText(
                    label,
                    style: TextStyle(fontSize: context.fontSize(22)),
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
