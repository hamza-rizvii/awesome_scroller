## Features

Customizable Flutter package which synchronize Animations with PageView.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

To use this package we must first define how our ListView Widget will look like.

```dart
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AwesomeScroller(
      itemCout: _itemCount,
      pageController: _controller,
      widget: child,
    );
  }
}
```

