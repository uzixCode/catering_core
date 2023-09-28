import 'package:flutter/material.dart';
import 'package:catering_core/core.dart';

class CubitBuilder<C extends BlocBase<Object?>> extends StatefulWidget {
  const CubitBuilder(
      {super.key,
      this.isWithProvider,
      this.initState,
      this.builder,
      required this.cubit});
  final bool? isWithProvider;
  final C cubit;
  final Widget Function(C cubit)? builder;
  final void Function(C cubit)? initState;

  @override
  State<CubitBuilder<C>> createState() => _CubitBuilderState<C>();
}

class _CubitBuilderState<C extends BlocBase<Object?>>
    extends State<CubitBuilder<C>> {
  @override
  Widget build(BuildContext context) {
    if (widget.isWithProvider == true) {
      return BlocProvider<C>(
        create: (context) => widget.cubit,
        child: _WithProvider<C>(
          builder: widget.builder,
          initState: widget.initState,
        ),
      );
    }
    return Builder(
      builder: (context) {
        final cubit = context.watch<C>();
        return widget.builder == null
            ? const SizedBox()
            : widget.builder!(cubit);
      },
    );
  }
}

class _WithProvider<C extends BlocBase<Object?>> extends StatefulWidget {
  const _WithProvider({Key? key, this.builder, this.initState})
      : super(key: key);

  final Widget Function(C cubit)? builder;
  final void Function(C cubit)? initState;
  @override
  State<_WithProvider<C>> createState() => _WithProviderState<C>();
}

class _WithProviderState<C extends BlocBase<Object?>>
    extends State<_WithProvider<C>> {
  @override
  void initState() {
    super.initState();
    if (widget.initState != null) {
      widget.initState!(context.read<C>());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final cubit = context.watch<C>();
        return widget.builder == null
            ? const SizedBox()
            : widget.builder!(cubit);
      },
    );
  }
}
