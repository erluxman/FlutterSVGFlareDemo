# SVG and Flair Animation Demo app

## Using SVG

Even though flutter doesn't support any vector graphics out of the box, the package `flutter_svg` can render `svg` into Flutter app.

1. Add dependency :
        `flutter_svg: ^version`

2. Start using it like Flutter `Image` Widget.

        //load SVG from network
        SvgPicture.network("https://image.flaticon.com/icons/svg/124/124555.svg", height: 200)

        //load SVG from assets folder
        SvgPicture.asset("assets/ufo.svg", height: 200)

[visit flutter_svg](https://pub.dev/packages/flutter_svg#-readme-tab-)

![a](art/60svg.png)

## Using Flare/rive

Similar to vector graphics, Flutter doesn't support vector animation natively. [Rive (rive.app)](https://rive.app/explore) helps with amazing vector animations in Flutter.

1. Add flare in `pubspec.yaml`:

        flare_flutter: ^version

2. Download flare files from [rive.app](https://rive.app/explore) & put those `.flr` files into `assets/` folder:

        assets:
            - assets/

3. Start using `FlareActor` widget.

        FlareActor(
            "assets/world.flr",

            //🚨Caution🚨, you can find 👉 #animation name in
            //left bottom 👈👇 of rive.app designer tool when
            //Animation tab is selected

            animation: "world")

[visit library](https://pub.dev/packages/flare_flutter)

![a](art/61flare.gif)
