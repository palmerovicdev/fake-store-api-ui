import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SocialNetworkIcon extends StatefulWidget {
  const SocialNetworkIcon({
    super.key,
    required this.url,
    this.shape = BoxShape.circle,
    this.iconSize,
  });

  final double? iconSize;
  final String url;
  final BoxShape shape;

  @override
  State<SocialNetworkIcon> createState() => _SocialNetworkIconState();
}

class _SocialNetworkIconState extends State<SocialNetworkIcon> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    var icon = widget.url.contains('facebook')
        ? Icons.facebook
        : widget.url.contains('twitter')
            ? const FaIcon(FontAwesomeIcons.twitter)
            : widget.url.contains('instagram')
                ? const FaIcon(FontAwesomeIcons.instagram)
                : widget.url.contains('linkedin')
                    ? const FaIcon(FontAwesomeIcons.linkedin)
                    : widget.url.contains('gmail.com')
                        ? const FaIcon(FontAwesomeIcons.envelope)
                        : widget.url.contains('github')
                            ? const FaIcon(FontAwesomeIcons.github)
                            : widget.url.contains('youtube')
                                ? const FaIcon(FontAwesomeIcons.youtube)
                                : widget.url.contains('whatsapp')
                                    ? const FaIcon(FontAwesomeIcons.whatsapp)
                                    : widget.url.contains('t.me')
                                        ? const FaIcon(FontAwesomeIcons.telegram)
                                        : widget.url.contains('snapchat')
                                            ? const FaIcon(FontAwesomeIcons.snapchat)
                                            : widget.url.contains('pinterest')
                                                ? const FaIcon(FontAwesomeIcons.pinterest)
                                                : widget.url.contains('tiktok')
                                                    ? const FaIcon(FontAwesomeIcons.tiktok)
                                                    : widget.url.contains('reddit')
                                                        ? const FaIcon(FontAwesomeIcons.reddit)
                                                        : widget.url.contains('tumblr')
                                                            ? const FaIcon(FontAwesomeIcons.tumblr)
                                                            : widget.url.contains('slack')
                                                                ? const FaIcon(FontAwesomeIcons.slack)
                                                                : widget.url.contains('discord')
                                                                    ? const FaIcon(FontAwesomeIcons.discord)
                                                                    : widget.url.contains('skype')
                                                                        ? const FaIcon(FontAwesomeIcons.skype)
                                                                        : widget.url.contains('viber')
                                                                            ? const FaIcon(FontAwesomeIcons.viber)
                                                                            : widget.url.contains('line')
                                                                                ? const FaIcon(FontAwesomeIcons.line)
                                                                                : widget.url.contains('signal')
                                                                                    ? const FaIcon(FontAwesomeIcons.signal)
                                                                                    : widget.url.contains('messenger')
                                                                                        ? const FaIcon(FontAwesomeIcons.facebookMessenger)
                                                                                        : Icons.link;
    return GestureDetector(
      onTap: () => launchUrlString(widget.url.contains('gmail.com') ? 'mailto:${widget.url}' : widget.url),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onHover: (_) => setState(() => _isHover = true),
        onExit: (_) => setState(() => _isHover = false),
        child: Material(
          elevation: _isHover ? 6 : 0,
          shape: widget.shape == BoxShape.circle ? const CircleBorder() : RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          borderRadius: widget.shape == BoxShape.circle ? null : BorderRadius.circular(8),
          child: AnimatedContainer(
            padding: EdgeInsets.all((widget.iconSize ?? 24) / 3),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(_isHover ? 1.0 : 0.7),
              shape: widget.shape,
              borderRadius: widget.shape == BoxShape.circle ? null : BorderRadius.circular(8),
            ),
            duration: const Duration(milliseconds: 200),
            child: icon is IconData
                ? Icon(
                    icon,
                    color: Theme.of(context).colorScheme.onSecondary,
                    size: widget.iconSize,
                  )
                : icon is FaIcon
                    ? FaIcon(
                        icon.icon,
                        color: Theme.of(context).colorScheme.onSecondary,
                        size: widget.iconSize,
                      )
                    : const SizedBox(),
          ),
        ),
      ),
    );
  }
}