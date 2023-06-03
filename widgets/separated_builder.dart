import 'package:flutter/material.dart';

class SeparatedBuilder extends StatelessWidget {
  const SeparatedBuilder({
    required Widget Function(int index) builder,
    required int itemCount,
    required double separatedValue,
    Axis direction = Axis.vertical,
    Key? key,
  })  : _builder = builder,
        _itemCount = itemCount,
        _separatedValue = separatedValue,
        _direction = direction,
        super(key: key);

  final Widget Function(int index) _builder;
  final int _itemCount;
  final double _separatedValue;
  final Axis _direction;

  Widget _buildGap(double value) {
    return _direction == Axis.vertical
        ? SizedBox(height: value)
        : SizedBox(width: value);
  }

  List<Widget> _buildBody() {
    final List<Widget> widgets = [];

    for (int index = 0; index < _itemCount; index++) {
      // last item
      if (index == _itemCount - 1) {
        widgets.add(_builder(index));
      } else {
        widgets.addAll([_builder(index), _buildGap(_separatedValue)]);
      }
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: _direction,
      children: _buildBody(),
    );
  }
}
