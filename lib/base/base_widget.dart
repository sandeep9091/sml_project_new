import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'base_view_model.dart';

/// StatefulWidget for T type of ViewModel / ChangeNotifier
class BaseWidget<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T? model, Widget? child) builder;
  final ProviderListenable providerBase;
  final Function(T)? onModelReady;
  final Widget? child;
  final Function(T)? onInit;

  const BaseWidget({
    Key? key,
    required this.builder,
    required this.providerBase,
    this.onModelReady,
    this.child,
    this.onInit,
  }) : super(key: key);

  @override
  _BaseWidget<T> createState() => _BaseWidget<T>();
}

/// State of StatefulWidget of T type of Viewmodel / ChangeNotifier
class _BaseWidget<T extends BaseViewModel> extends State<BaseWidget<T>> {
  T? _model;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        _model = watch.watch(widget.providerBase as ProviderListenable<T?>);

        if (_model != null && !_model!.alReadyLoaded) {
          _model!.alReadyLoaded = true;
          widget.onInit?.call(_model!);
        }
        widget.onModelReady?.call(_model!);

        return widget.builder(context, _model, child);
      },
      child: widget.child,
    );
  }
}
