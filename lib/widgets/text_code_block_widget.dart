import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextCodeBlockWidget extends StatefulWidget {
  const TextCodeBlockWidget({
    super.key,
    required this.text,
    this.isParagraph,
    this.textStyle,
    this.textAlign,
  });

  final TextAlign? textAlign;
  final String text;
  final bool? isParagraph;
  final TextStyle? textStyle;

  @override
  State<TextCodeBlockWidget> createState() => _TextCodeBlockWidgetState();
}

class _TextCodeBlockWidgetState extends State<TextCodeBlockWidget> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return buildCodeParagraph(context);
  }

  buildCodeParagraph(BuildContext context) {
    List<InlineSpan> spans = [];
    var characters = widget.text.characters;
    var length = characters.length;

    for (int i = 0; i < length; i++) {
      if (characters.elementAt(i) == '`' && i != length - 1) {
        if (characters.elementAt(i + 1) == '`' && i != length - 2) {
          if (characters.elementAt(i + 2) == '`') {
            var codeBlockString = characters.skip(i + 3);
            int codeBlockLength = 0;
            for (var char in codeBlockString) {
              if (char == '`' && codeBlockString.skip(codeBlockLength + 1).take(2).join() == '``') {
                var codeBlock = codeBlockString.take(codeBlockLength + 1).join();
                spans.add(WidgetSpan(child: buildCodeBlock(context, codeBlock)));
                i += codeBlockLength + 5;
                break;
              }
              codeBlockLength++;
            }
          } else {
            var codeLine = characters.skip(i + 2).takeWhile((char) => char != '`').join();
            spans.add(WidgetSpan(child: buildCodeLine(context, codeLine)));
            i += codeLine.length + 3;
          }
        } else {
          var codeLine = characters.skip(i + 1).takeWhile((char) => char != '`').join();
          spans.add(WidgetSpan(child: buildCodeLine(context, codeLine)));
          i += codeLine.length + 2;
        }
      } else if (characters.elementAt(i) != '\n') {
        var normalText = characters.skip(i).takeWhile((char) => char != '`' && char != '\n').join();
        spans.add(WidgetSpan(child: buildNormalText(context, normalText)));
        i += normalText.length - 1;
      } else {
        spans.add(const TextSpan(text: '\n'));
      }
    }

    return RichText(
      textAlign: widget.textAlign ?? TextAlign.start,
      text: TextSpan(
        children: spans,
        style: widget.textStyle ?? DefaultTextStyle.of(context).style,
      ),
    );
  }

  buildCodeBlock(BuildContext context, String line) {
    var themeData = Theme.of(context);
    var textTheme = themeData.textTheme;
    return Padding(
      padding: const EdgeInsets.only(
        top: 8.0,
        bottom: 8.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: themeData.colorScheme.secondary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 8.0,
            right: 8.0,
            top: 8.0,
          ),
          child: Stack(
            children: [
              Positioned(
                right: 4,
                top: 4,
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  onEnter: (_) => setState(() => isHover = true),
                  onExit: (_) => setState(() => isHover = false),
                  child: Material(
                    elevation: isHover ? 4 : 0,
                    borderRadius: BorderRadius.circular(4),
                    child: GestureDetector(
                      onTap: () {
                        Clipboard.setData(ClipboardData(text: line.substring(3, line.length - 3)));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Copied to clipboard'),
                            duration: Duration(milliseconds: 500),
                          ),
                        );
                      },
                      child: AnimatedContainer(
                        decoration: BoxDecoration(
                          color: themeData.colorScheme.secondary.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        duration: const Duration(milliseconds: 200),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            'Copy',
                            style: widget.textStyle?.copyWith(
                                  color: themeData.colorScheme.secondary,
                                ) ??
                                textTheme.bodyLarge?.copyWith(
                                  color: themeData.colorScheme.secondary,
                                  fontSize: 12,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32, right: 50),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SelectableText(
                      line.substring(3, line.length - 3),
                      style: widget.textStyle?.copyWith(
                            color: themeData.colorScheme.secondary,
                          ) ??
                          textTheme.bodyLarge?.copyWith(
                            color: themeData.colorScheme.secondary,
                            fontSize: 12,
                          ),
                    ),
                    const SizedBox(width: 42),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildCodeLine(BuildContext context, String line) {
    return Padding(
      padding: const EdgeInsets.only(right: 4.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: SelectableText(
            line,
            style: widget.textStyle?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ) ??
                Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 14,
                    ),
          ),
        ),
      ),
    );
  }

  buildNormalText(BuildContext context, String normalText) {
    return SelectableText(
      normalText,
      style: widget.textStyle ??
          Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 14,
              ),
    );
  }
}