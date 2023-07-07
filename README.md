## Features

Animated Flutter ScrollView package which synchronize Animations with PageView. You and add any
child widget inside Awesome Scroller and scroll the list.

<p>
<img style="margin-right:20px;" src="https://firebasestorage.googleapis.com/v0/b/flutter-packages-e1b84.appspot.com/o/vertical.gif?alt=media&token=615aa81e-67ef-4dcc-81f1-0ce55b104f37" />
<img src="https://firebasestorage.googleapis.com/v0/b/flutter-packages-e1b84.appspot.com/o/horizontal.gif?alt=media&token=9242beb5-eba8-46c4-ae2a-8b62219d157b" />

</p>

## Usage

To use this package we must first define how our ListView Widget will look like.

Add `awesome_scroller` dependency to your `pubspec.yaml`:

```yaml
dependencies:
  awesome_scroller: 0.0.14
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
          scrollDirection: Axis.verticle,
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

