import 'package:flutter/material.dart';
import 'package:go_router_example/common/constant.dart';

class ListInfo extends StatelessWidget {
  const ListInfo({
    Key? key,
    required this.title,
    this.content,
    this.hasDivider,
    this.titleStyle,
    this.contentWidget,
    this.contentStyle,
    this.titleFlex,
    this.contentFlex,
    this.margin,
    this.padding,
  }) : super(key: key);

  final String title;
  final String? content;
  final bool? hasDivider;
  final TextStyle? titleStyle;
  final Widget? contentWidget;
  final TextStyle? contentStyle;
  final int? titleFlex;
  final int? contentFlex;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.zero,
      margin: margin ?? kVerticalPadding12,
      decoration: BoxDecoration(
        border: Border(
            bottom: hasDivider != null && hasDivider!
                ? BorderSide(
                    color: Theme.of(context).dividerColor,
                  )
                : BorderSide.none),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: titleFlex ?? 3,
            child: Text(
              title,
              style: titleStyle ??
                  TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Expanded(
            flex: contentFlex ?? 4,
            child: contentWidget != null
                ? FittedBox(
                    alignment: Alignment.centerRight,
                    fit: BoxFit.scaleDown,
                    child: contentWidget!,
                  )
                : content != null
                    ? Text(
                        content!,
                        textAlign: TextAlign.right,
                        style: contentStyle ??
                            const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                      )
                    : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
