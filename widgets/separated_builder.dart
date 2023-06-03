import 'package:flutter/material.dart';

class SeparatedBuilder extends StatelessWidget {
  const SeparatedBuilder({
    required Widget Function(int index) builder,
    required double separatedValue,
    required int itemCount,
    Axis direction = Axis.vertical,
    Key? key,
  })  : _builder = builder,
        _separatedValue = separatedValue,
        _itemCount = itemCount,
        _direction = direction,
        super(key: key);

  final Widget Function(int index) _builder;
  final double _separatedValue;
  final int _itemCount;
  final Axis _direction;

  Widget _buildGap(double value) {
    return _direction == Axis.vertical
        ? SizedBox(height: value)
        : SizedBox(width: value);
  }

  List<Widget> _buildBody() {
    final List<Widget> widgets = [];

    for (int index = 0; index < _itemCount; index++) {
      widgets.add(_builder(index));

      if (index != _itemCount - 1) {
        widgets.add(_buildGap(_separatedValue));
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
