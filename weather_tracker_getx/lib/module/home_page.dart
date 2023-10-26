import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:weather_tracker_getx/module/home_controller.dart';
import 'package:weather_tracker_getx/widgets/whether_item.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController _controller = Get.find<HomeController>();

  String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('EEEE d MMMM y');
    return formatter.format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: Column(
          children: [
            Text(
              "Today",
              style: GoogleFonts.ubuntu(
                fontWeight: FontWeight.w500,
                fontSize: 30,
                color: Colors.black,
              ),
            ),
            Text(
              formatDate(DateTime.now()),
              style: GoogleFonts.ubuntu(
                fontWeight: FontWeight.w400,
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
      body: Obx(
        () => SafeArea(
          child: SizedBox.expand(
            child: _controller.weatherData.value == null
                ? Center(
                    child: LoadingAnimationWidget.halfTriangleDot(
                      size: 40,
                      color: Colors.black,
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      WhetherItem(
                        icon: 'assets/loc.json',
                        text: "Your location is ",
                        subText: _controller.address,
                      ),
                      const SizedBox(height: 18),
                      WhetherItem(
                        icon: 'assets/temp.json',
                        text: "The temperature is ",
                        subText: "${_controller.temperature}°C",
                      ),
                      const SizedBox(height: 18),
                      WhetherItem(
                        icon: 'assets/thums_up.json',
                        text: "You should ",
                        subText: _controller.infoText.value,
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
