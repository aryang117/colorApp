import 'package:flutter/material.dart';

// Visual Indicator between Slider and Text Display
class ExchangeIcon extends StatelessWidget {
  const ExchangeIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 1,
      child: IconTheme(
        data: Theme.of(context).iconTheme,
        child: Icon(
          Icons.sync_alt,
        ),
      ),
    );
  }
}
