

<p align='center'>
    <img src="https://raw.githubusercontent.com/jonbhanson/flutter_native_splash/master/splash_demo.gif" />
    <img src="https://raw.githubusercontent.com/jonbhanson/flutter_native_splash/master/splash_demo_dark.gif" />
</p>

## Features

Customizable Flutter package which synchronize Animations with PageView.

## Usage

To use this package we must first define how our ListView Widget will look like.

Add `awesome_scroller` dependency to your `pubspec.yaml`:

```yaml
dependencies:
  awesome_scroller: 0.0.6
```


In your Dart code, import `'package:awesome_scroller/awesome_scroller.dart';`
```dart

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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

