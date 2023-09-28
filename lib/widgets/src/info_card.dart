import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:catering_core/core.dart';

enum InfoType {
  success,
  error,
  warning,
  info,
  verify,
}

class InfoCard extends StatelessWidget {
  InfoCard(this.type, {super.key, this.message, this.heroTag});
  final InfoType type;
  final String? message;
  final dynamic heroTag;
  final typeMapping = {
    InfoType.success: "success",
    InfoType.error: "error",
    InfoType.warning: "warning",
    InfoType.info: "info",
    InfoType.verify: "question",
  };
  Future<T?> show<T>(BuildContext context,
      [Duration? autoCloseDuration]) async {
    bool isClosed = false;
    if (autoCloseDuration != null) {
      Timer(
        autoCloseDuration,
        () {
          if (!isClosed) {
            try {
              if (Navigator.canPop(context)) {
                context.pop();
              }
            } catch (e) {
              log(e.toString());
            }
          }
        },
      );
    }
    return context.pushDialog<T>(build(context)).then((value) {
      isClosed = true;
      return value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ParentSwitcher(
        index: heroTag == null ? 1 : 0,
        parents: [
          (child) => Hero(
                tag: heroTag,
                child: child,
              ),
          (child) => child
        ],
        child: SingleChildScrollView(
          child: SizedBox(
            height: context.rsize(.8, max: 400),
            width: context.rsize(.8, max: 400),
            child: BaseCard(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(context.rsize(.05))),
              child: Padding(
                padding: EdgeInsets.all(context.rsize(.03)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        height: context.rsize(.3, max: 150),
                        width: context.rsize(.3, max: 150),
                        child: Lottie.asset(
                            "assets/anim/${typeMapping[type]}.json",
                            fit: BoxFit.cover)),
                    if (message != null)
                      Expanded(
                        child: Center(
                          child: SingleChildScrollView(
                            child: Text(
                              message!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: context.fontSize(
                                    message!.length <= 10 ? 20 : 25,
                                    max: 25),
                              ),
                            ),
                          ),
                        ),
                      ),
                    Row(
                      children: [
                        if (type == InfoType.verify)
                          Expanded(
                            child: MainButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Colors.red[400])),
                                onPressed: () {
                                  context.pop();
                                },
                                child: const Left("Batal")),
                          ),
                        if (type == InfoType.verify) const SizedBox(width: 5),
                        Expanded(
                          child: MainButton(
                              onPressed: () {
                                context.pop(true);
                              },
                              child: const Left("OK")),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
