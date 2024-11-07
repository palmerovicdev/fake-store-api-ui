import 'package:flutter/material.dart';

class CustomSearch extends StatefulWidget {
  const CustomSearch({
    super.key,
    this.leading,
    this.shouldChangeMouseCursorOnHover,
    this.suffix,
    this.height,
    this.width,
    this.onFieldSubmitted,
    this.onChanged,
  })  : assert(height == null || height >= 68),
        assert(width == null || width >= 200);

  final Widget? suffix;
  final Widget? leading;
  final bool? shouldChangeMouseCursorOnHover;
  final double? height;
  final double? width;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;

  @override
  State<CustomSearch> createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return MouseRegion(
      cursor: widget.shouldChangeMouseCursorOnHover ?? true
          ? _isHover
              ? SystemMouseCursors.click
              : SystemMouseCursors.basic
          : SystemMouseCursors.basic,
      onHover: (_) => setState(() => _isHover = true),
      onExit: (_) => setState(() => _isHover = false),
      child: AnimatedContainer(
        height: widget.height ?? 68,
        width: widget.width ?? 200,
        padding: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        duration: const Duration(milliseconds: 200),
        child: TextFormField(
          mouseCursor: widget.shouldChangeMouseCursorOnHover ?? true
              ? _isHover
                  ? SystemMouseCursors.click
                  : SystemMouseCursors.basic
              : SystemMouseCursors.basic,
          onFieldSubmitted: widget.onFieldSubmitted,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            hintText: 'Search',
            border: InputBorder.none,
            hoverColor: colorScheme.primary,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                width: 2,
                color: colorScheme.primary,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                width: 2,
                color: _isHover ? colorScheme.primary : colorScheme.surface,
              ),
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: widget.leading,
            ),
            suffixIcon: widget.suffix,
          ),
        ),
      ),
    );
  }
}