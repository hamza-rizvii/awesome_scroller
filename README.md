<p align='center'>
    <img src="https://firebasestorage.googleapis.com/v0/b/flutter-packages-e1b84.appspot.com/o/ezgif.com-optimize.gif?alt=media&token=2f5f5179-3518-47f9-b14a-7ef4e7126bee" />
</p>

## Features

Animated Flutter ScrollView package which synchronize Animations with PageView. You and add any
child widget inside Awesome Scroller and scroll the list.

## Usage

To use this package we must first define how our ListView Widget will look like.

Add `awesome_scroller` dependency to your `pubspec.yaml`:

```yaml
dependencies:
  awesome_scroller: 0.0.6
```

Don't forget to `flutter pub get`.

In your Dart code, import `'package:awesome_scroller/awesome_scroller.dart';`

```dart

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Awesome Scroller",
          style: TextStyle(fontWeight: FontWeight.w900, color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              ))
        ],
      ),
      body: AwesomeScroller(
          itemCount: 3,
          onPageChanged: (index) {
            setState(() {
              pageIndex = index;
              print(index.toString());
            });
          },
          widget: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "IMAGE_URL_HERE"),
                  fit: BoxFit.cover),
            ),
          )),
    );
  }
}
```

