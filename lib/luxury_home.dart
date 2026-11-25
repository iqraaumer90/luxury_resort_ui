import 'package:flutter/material.dart';

class LuxuryHome extends StatefulWidget {
  const LuxuryHome({super.key});

  @override
  State<LuxuryHome> createState() => _LuxuryHomeState();
}

class _LuxuryHomeState extends State<LuxuryHome> with TickerProviderStateMixin {
  bool isSelected = false;
  bool isFavorite = false;

  late AnimationController priceController;
  late Animation<double> priceAnimation;

  late AnimationController locationController;
  late Animation<Alignment> locationAnimation;

  late AnimationController controller;
  late Animation<double> animation;

  late AnimationController buttonController;
  late Animation<Offset> buttonAnimation;

  late AnimationController amenitiesController;
  late Animation<double> roomAnimation;
  late Animation<double> poolAnimation;
  late Animation<double> wifiAnimation;

  @override
  void initState() {
    super.initState();

    priceController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 700),
    );

    priceAnimation = Tween<double>(begin: 0.7, end: 1.0).animate(
      CurvedAnimation(parent: priceController, curve: Curves.easeOutBack),
    );

    priceController.forward();

    locationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    );

    locationAnimation =
        AlignmentTween(
          begin: Alignment.bottomLeft,
          end: Alignment.bottomRight,
        ).animate(
          CurvedAnimation(parent: locationController, curve: Curves.easeInOut),
        );

    locationController.repeat(reverse: true);

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    animation = Tween<double>(begin: 0, end: 1).animate(controller);

    controller.forward();

    buttonController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    buttonAnimation = Tween<Offset>(
      begin: Offset(0, 0.8),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(parent: buttonController, curve: Curves.easeOut));

    buttonController.forward();

    amenitiesController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    );

    roomAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: amenitiesController,
        curve: Interval(0.0, 0.5, curve: Curves.easeOutBack),
      ),
    );

    poolAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: amenitiesController,
        curve: Interval(0.25, 0.75, curve: Curves.easeOutBack),
      ),
    );

    wifiAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: amenitiesController,
        curve: Interval(0.5, 1.0, curve: Curves.easeOutBack),
      ),
    );

    amenitiesController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Color(0x18FFF8F0), BlendMode.srcOver),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(22, 30, 22, 16),
          child: Column(
            children: [
              SizedBox(height: 30),

              // TOP HEADING
              AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  return Opacity(
                    opacity: animation.value,
                    child: Transform.translate(
                      offset: Offset(0, 25 - (25 * animation.value)),
                      child: child,
                    ),
                  );
                },
                child: Text(
                  'LUXURY ESCAPE',
                  style: TextStyle(
                    fontFamily: 'serif',
                    fontSize: 19,
                    letterSpacing: 3,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Color(0xFF59351F),
                  ),
                ),
              ),

              SizedBox(height: 7),

              Text(
                'Discover Your Perfect Stay',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'serif',
                  fontSize: 27,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF332C28),
                ),
              ),

              SizedBox(height: 17),

              // RESORT IMAGE
              Container(
                height: 185,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.8),
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.13),
                      blurRadius: 20,
                      offset: Offset(0, 9),
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage('assets/image.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(28),
                  child: Stack(
                    clipBehavior: Clip.hardEdge,
                    children: [
                      // FAVORITE BUTTON
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(14),
                            height: 43,
                            width: 43,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.94),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.10),
                                  blurRadius: 8,
                                ),
                              ],
                            ),
                            child: AnimatedSwitcher(
                              duration: Duration(milliseconds: 400),
                              child: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                key: ValueKey(isFavorite),
                                color: Color(0xFF806D60),
                                size: 23,
                              ),
                            ),
                          ),
                        ),
                      ),

                      // LOCATION ANIMATION
                      Positioned.fill(
                        child: AnimatedBuilder(
                          animation: locationAnimation,
                          builder: (context, child) {
                            return Align(
                              alignment: locationAnimation.value,
                              child: Padding(
                                padding: EdgeInsets.all(13),
                                child: child,
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 13,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.94),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  size: 17,
                                  color: Color(0xFF806D60),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  'Rangali Island • Maldives',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF594B42),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 14),

              // HOTEL DETAILS CARD
              GestureDetector(
                onTap: () {
                  setState(() {
                    isSelected = !isSelected;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 700),
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: isSelected ? Color(0xFFE9DED4) : Color(0xFFF3F0EC),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: Color(0xFFE1D8CF), width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.07),
                        blurRadius: 17,
                        offset: Offset(0, 7),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // HOTEL NAME AND RATING
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Conrad Maldives Rangali Island',
                              style: TextStyle(
                                fontFamily: 'serif',
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF332C28),
                              ),
                            ),
                          ),
                          SizedBox(width: 7),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 7,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFFE8E0D7),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star_rounded,
                                  size: 17,
                                  color: Color(0xFF806D60),
                                ),
                                SizedBox(width: 3),
                                Text(
                                  '4.9',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF594B42),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 8),

                      // HOTEL LOCATION
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 18,
                            color: Color(0xFF806D60),
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Maldives • 5-Star Resort',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF594B42),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 10),

                      // ANIMATED DESCRIPTION
                      AnimatedCrossFade(
                        duration: Duration(milliseconds: 700),
                        crossFadeState: isSelected
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        firstChild: Text(
                          'A luxury resort with private villas, clear '
                          'waters, and breathtaking ocean views.',
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.5,
                            color: Color(0xFF594B42),
                          ),
                        ),
                        secondChild: Text(
                          'Enjoy a peaceful private villa, beautiful '
                          'ocean views, and an unforgettable luxury stay.',
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.5,
                            color: Color(0xFF594B42),
                          ),
                        ),
                      ),

                      SizedBox(height: 13),

                      // PRICE AND VILLA TAG
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ScaleTransition(
                            scale: priceAnimation,
                            child: Text(
                              '\$420 / night',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF594B42),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFFE3EAE1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'Private Villa',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF59665B),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 12),

              // AMENITIES HEADING
              Text(
                'Amenities',
                style: TextStyle(
                  fontFamily: 'serif',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF332C28),
                ),
              ),

              SizedBox(height: 9),

              // AMENITIES CARDS
              Row(
                children: [
                  // ROOM
                  Expanded(
                    child: AnimatedPadding(
                      duration: Duration(milliseconds: 500),
                      padding: isSelected
                          ? EdgeInsets.only(top: 0)
                          : EdgeInsets.only(top: 7),
                      child: Container(
                        height: 62,
                        decoration: BoxDecoration(
                          color: Color(0xFFF8F5F1).withOpacity(0.90),
                          borderRadius: BorderRadius.circular(17),
                          border: Border.all(color: Color(0xFFE5DCD2)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ScaleTransition(
                              scale: roomAnimation,
                              child: Icon(
                                Icons.bed_outlined,
                                size: 23,
                                color: Color(0xFF806D60),
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Room',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF594B42),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 9),

                  // POOL
                  Expanded(
                    child: AnimatedPadding(
                      duration: Duration(milliseconds: 500),
                      padding: isSelected
                          ? EdgeInsets.only(top: 0)
                          : EdgeInsets.only(top: 7),
                      child: Container(
                        height: 62,
                        decoration: BoxDecoration(
                          color: Color(0xFFF8F5F1).withOpacity(0.90),
                          borderRadius: BorderRadius.circular(17),
                          border: Border.all(color: Color(0xFFE5DCD2)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ScaleTransition(
                              scale: poolAnimation,
                              child: Icon(
                                Icons.pool_outlined,
                                size: 23,
                                color: Color(0xFF806D60),
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Pool',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF594B42),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 9),

                  // WIFI
                  Expanded(
                    child: AnimatedPadding(
                      duration: Duration(milliseconds: 500),
                      padding: isSelected
                          ? EdgeInsets.only(top: 0)
                          : EdgeInsets.only(top: 7),
                      child: Container(
                        height: 62,
                        decoration: BoxDecoration(
                          color: Color(0xFFF8F5F1).withOpacity(0.90),
                          borderRadius: BorderRadius.circular(17),
                          border: Border.all(color: Color(0xFFE5DCD2)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ScaleTransition(
                              scale: wifiAnimation,
                              child: Icon(
                                Icons.wifi_rounded,
                                size: 23,
                                color: Color(0xFF806D60),
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Wi-Fi',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF594B42),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),

              // WHY YOU'LL LOVE THIS STAY
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Color(0xFF594B42).withOpacity(0.65),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "A Stay Worth Remembering",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(height: 6),

                    Text(
                      "Discover the beauty of island living and enjoy every moment in paradise.",
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.5,
                        color: Colors.white70,
                      ),
                    ),

                    SizedBox(height: 16),

                    Row(
                      children: [
                        Icon(Icons.waves, color: Color(0xFFE5C9A8), size: 21),
                        SizedBox(width: 8),
                        Text(
                          'Breathtaking Ocean Views',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),

                    SizedBox(height: 11),

                    Row(
                      children: [
                        Icon(
                          Icons.beach_access,
                          color: Color(0xFFE5C9A8),
                          size: 21,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Your Own Private Paradise',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),

                    SizedBox(height: 11),

                    Row(
                      children: [
                        Icon(
                          Icons.spa_outlined,
                          color: Color(0xFFE5C9A8),
                          size: 21,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Peaceful Luxury Experience',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 21),

              // BOOK NOW BUTTON ANIMATION
              SlideTransition(
                position: buttonAnimation,
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: Color(0xFFF8F5F1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          title: Row(
                            children: [
                              Icon(
                                Icons.hotel_outlined,
                                color: Color(0xFF594B42),
                                size: 27,
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  'Book Your Stay',
                                  style: TextStyle(
                                    fontFamily: 'serif',
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF332C28),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          content: Text(
                            'Do you want to book your private villa '
                            'at Conrad Maldives Rangali Island?',
                            style: TextStyle(
                              fontSize: 15,
                              height: 1.5,
                              color: Color(0xFF594B42),
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Booking cancelled.'),
                                    backgroundColor: Color(0xFF594B42),
                                    duration: Duration(seconds: 1),
                                    behavior: SnackBarBehavior.floating,
                                  ),
                                );
                              },
                              child: Text(
                                'CANCEL',
                                style: TextStyle(
                                  color: Color(0xFF806D60),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Your luxury stay has been booked!',
                                    ),
                                    backgroundColor: Color(0xFF594B42),
                                    behavior: SnackBarBehavior.floating,
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF594B42),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                'CONFIRM',
                                style: TextStyle(
                                  fontSize: 13,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 54,
                    decoration: BoxDecoration(
                      color: Color(0xFF594B42),
                      borderRadius: BorderRadius.circular(19),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF594B42).withOpacity(0.25),
                          blurRadius: 15,
                          offset: Offset(0, 7),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'BOOK NOW',
                        style: TextStyle(
                          fontFamily: 'serif',
                          color: Colors.white,
                          fontSize: 15,
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    locationController.dispose();
    controller.dispose();
    priceController.dispose();
    buttonController.dispose();
    amenitiesController.dispose();
    super.dispose();
  }
}
