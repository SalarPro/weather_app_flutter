import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/src/helper/assets.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  int cSelect = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _bodyLayout,
    );
  }

  get _bodyLayout => Stack(
        children: [
          _background,
          _body,
        ],
      );

  get _body => SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              locationWidget(),
              weatherIcon(),
              temperature(),
              detailsWidget(),
              hourlyCastWidget(),
              windHumidityWidget(2, 100),
            ],
          ),
        ),
      );

  Center temperature() {
    return Center(
      child: Text(
        "28º",
        style: TextStyle(
          fontSize: 64,
          fontWeight: FontWeight.w700,
          fontFamily: GoogleFonts.ubuntu().fontFamily,
          color: Colors.white,
          height: 1.25,
        ),
      ),
    );
  }

  Center weatherIcon() {
    return Center(
      child: Stack(
        children: [
          CustomPaint(
            painter: _BackgroundPainter(),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.width * 0.5,
              child: Image.asset(
                Assets.assetsIconsW1,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding locationWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Row(
        children: [
          Image.asset(
            Assets.assetsIconsLocation,
            width: 24,
            height: 24,
          ),
          SizedBox(
            width: 4,
          ),
          Text(
            "Архангельск, Россия",
            style: TextStyle(
                fontFamily: GoogleFonts.roboto().fontFamily,
                fontSize: 17,
                color: Colors.white),
          )
        ],
      ),
    );
  }

  get _background => Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff0700FF),
              Color(0xff000000),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      );

  detailsWidget() {
    return Column(
      children: [
        Center(
          child: Text(
            "Гроза",
            style: TextStyle(
              fontFamily: GoogleFonts.roboto().fontFamily,
              fontSize: 17,
              color: Colors.white,
              height: 1.411,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: Text(
            "Макс.: 31º Мин: 25º",
            style: TextStyle(
              fontFamily: GoogleFonts.roboto().fontFamily,
              fontSize: 17,
              color: Colors.white,
              height: 1.411,
            ),
          ),
        ),
      ],
    );
  }

  hourlyCastWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                Text("Сегодня",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 17)),
                Spacer(),
                Text("20 марта",
                    style: TextStyle(color: Colors.white, fontSize: 15)),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              weatherDetails(
                "14:00",
                Assets.assetsIconsSun,
                "25º",
                0,
              ),
              weatherDetails(
                "15:00",
                Assets.assetsIconsCloudSun,
                "23º",
                1,
              ),
              weatherDetails(
                "16:00",
                Assets.assetsIconsCloudLightning,
                "17º",
                2,
              ),
              weatherDetails(
                "17:00",
                Assets.assetsIconsCloudMoon,
                "17º",
                3,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget weatherDetails(String time, String img, String temp, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          cSelect = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        width: MediaQuery.of(context).size.width * 0.2,
        decoration: index == cSelect
            ? BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.white.withOpacity(1),
                ),
              )
            : null,
        child: Column(children: [
          Text(
            time,
            style: TextStyle(
              fontFamily: GoogleFonts.roboto().fontFamily,
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Image.asset(
            img,
            width: 32,
            height: 32,
            fit: BoxFit.contain,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            temp,
            style: TextStyle(
              fontFamily: GoogleFonts.roboto().fontFamily,
              fontSize: 17,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ]),
      ),
    );
  }

  windHumidityWidget(int wind, int humidity) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(children: [
          Row(
            children: [
              Image.asset(
                Assets.assetsIconsWind,
                width: 24,
                height: 24,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 1,
                child: Text(
                  "$wind м/с",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.2),
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 5,
                child: const Text(
                  "Ветер северо-восточный",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Image.asset(
                Assets.assetsIconsDrop,
                width: 24,
                height: 24,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 1,
                child: Text(
                  "$humidity%",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.2),
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 5,
                child: const Text(
                  "Высокая влажность",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

class _BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final paint = Paint()..color = const Color(0xffBD87FF);

    paint.maskFilter = const MaskFilter.blur(BlurStyle.normal, 60);
    canvas.drawCircle(rect.center, rect.center.dx, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
