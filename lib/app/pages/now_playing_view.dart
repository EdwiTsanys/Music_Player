import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NowPlayingView extends StatelessWidget {
  NowPlayingView({Key? key}) : super(key: key);

  final RxDouble _currentSliderValue = 0.0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_down),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple[900]!, Colors.black],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 15,
                            offset: Offset(0, 5),
                          ),
                        ],
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://picsum.photos/500',  // Placeholder image
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    Text(
                      'Song Title',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Artist Name',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(height: 24),
                    Obx(() => Column(
                      children: [
                        Slider(
                          value: _currentSliderValue.value,
                          max: 100,
                          activeColor: Colors.white,
                          inactiveColor: Colors.white24,
                          onChanged: (double value) {
                            _currentSliderValue.value = value;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '0:00',
                                style: TextStyle(color: Colors.white70),
                              ),
                              Text(
                                '3:45',
                                style: TextStyle(color: Colors.white70),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Icon(Icons.shuffle),
                          onPressed: () {},
                          color: Colors.white,
                          iconSize: 24,
                        ),
                        IconButton(
                          icon: Icon(Icons.skip_previous),
                          onPressed: () {},
                          color: Colors.white,
                          iconSize: 36,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(Icons.pause),
                            onPressed: () {},
                            color: Colors.black,
                            iconSize: 44,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.skip_next),
                          onPressed: () {},
                          color: Colors.white,
                          iconSize: 36,
                        ),
                        IconButton(
                          icon: Icon(Icons.repeat),
                          onPressed: () {},
                          color: Colors.white,
                          iconSize: 24,
                        ),
                      ],
                    ),
                    SizedBox(height: 32),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
