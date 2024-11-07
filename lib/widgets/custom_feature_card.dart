import 'package:flutter/material.dart';

class CustomFeatureCard extends StatefulWidget {
  const CustomFeatureCard({
    super.key,
    required this.name,
    required this.description,
    this.padding,
    this.initialElevation,
    this.hoverElevation,
    this.elevationDuration,
    this.size,
    this.icon,
    this.borderRadius,
    this.onTap,
    this.shouldHaveBorderOnHover,
    this.shouldChangeMouseCursorOnHover,
    this.background,
  });

  final Color? background;
  final String name;
  final String description;
  final EdgeInsetsGeometry? padding;
  final double? initialElevation;
  final double? hoverElevation;
  final Duration? elevationDuration;
  final Size? size;
  final Widget? icon;
  final BorderRadius? borderRadius;
  final void Function()? onTap;
  final bool? shouldHaveBorderOnHover;
  final bool? shouldChangeMouseCursorOnHover;

  @override
  State<CustomFeatureCard> createState() => _CustomFeatureCardState();
}

class _CustomFeatureCardState extends State<CustomFeatureCard> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    var themeData = Theme.of(context);
    var background = widget.background ?? themeData.colorScheme.surface;
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        cursor: widget.shouldChangeMouseCursorOnHover ?? true
            ? _isHover
                ? SystemMouseCursors.click
                : SystemMouseCursors.basic
            : SystemMouseCursors.basic,
        onHover: (_) => setState(() => _isHover = true),
        onExit: (_) => setState(() => _isHover = false),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: widget.borderRadius ?? const BorderRadius.all(Radius.circular(8.0)),
            border: widget.shouldHaveBorderOnHover ?? false
                ? Border.all(
                    color: _isHover ? themeData.colorScheme.primary : Colors.transparent,
                    width: 4.0,
                  )
                : null,
          ),
          child: Material(
            elevation: _isHover ? widget.hoverElevation ?? 12.0 : widget.initialElevation ?? 0.0,
            borderRadius: widget.borderRadius ?? const BorderRadius.all(Radius.circular(8.0)),
            color: background,
            child: AnimatedContainer(
              padding: widget.padding,
              margin: const EdgeInsets.all(22),
              width: widget.size?.width,
              height: widget.size?.height,
              decoration: BoxDecoration(
                color: background,
              ),
              duration: widget.elevationDuration ?? const Duration(milliseconds: 200),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.icon != null) ...[
                    widget.icon!,
                    const SizedBox(height: 16),
                  ],
                  Text(
                    widget.name,
                    textAlign: TextAlign.center,
                    style: themeData.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: nameWidth() + 48,
                    child: Text(
                      widget.description,
                      style: themeData.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  nameWidth() {
    final textPainter = TextPainter(
      text: TextSpan(
        text: widget.name,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
      ),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();

    return textPainter.width;
  }
}