import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sportsbet/common/ui/app_colors.dart';

class Expandable extends StatefulWidget {
  const Expandable({
    required Widget headerContent,
    required Widget bodyContent,
    required Color arrowButtonColor,
    bool isInitiallyExpanded = false,
    Key? key,
  })  : _headerContent = headerContent,
        _bodyContent = bodyContent,
        _arrowButtonColor = arrowButtonColor,
        _isInitiallyExpanded = isInitiallyExpanded,
        super(key: key);

  final Widget _headerContent;
  final Widget _bodyContent;
  final Color _arrowButtonColor;
  final bool _isInitiallyExpanded;

  @override
  State<Expandable> createState() => _ExpandableState();
}

class _ExpandableState extends State<Expandable> {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget._isInitiallyExpanded;
  }

  void _onTapExpandButton() {
    setState(() => _isExpanded = !_isExpanded);
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: widget._headerContent,
          ),
          SizedBox(
            width: 6.w,
          ),
          InkWell(
            onTap: _onTapExpandButton,
            child: Icon(
              _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              size: 24.w,
              color: widget._arrowButtonColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(),
        widget._bodyContent,
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: AnimatedSize(
        duration: const Duration(milliseconds: 150),
        alignment: Alignment.topCenter,
        child: _isExpanded ? _buildBody() : _buildHeader(),
      ),
    );
  }
}
