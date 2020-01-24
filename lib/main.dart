import 'package:flutter/material.dart';
import 'package:ui_shoes_ecommerce/data.dart' as prefix0;
import 'package:ui_shoes_ecommerce/utils.dart';
import 'data.dart';

/* https://www.youtube.com/watch?v=dMLreUXpSQ0 */

void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFF696d77), Color(0xff292c36)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.clamp)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, size: screenAwareSize(20, context)),
            onPressed: () {},
          ),
          title: Text(
            'Telegram @kenbo',
            style: TextStyle(
                color: Colors.white,
                fontSize: screenAwareSize(18, context),
                fontFamily: "Montserrat-Bold"),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.favorite_border,
                size: screenAwareSize(20, context),
                color: Colors.white,
              ),
              onPressed: () {},
            )
          ],
        ),
        body: Column(
          children: <Widget>[ProductScreenTopPart(), ProductScreenBottomPart()],
        ),
      ),
    );
  }
}

class ProductScreenTopPart extends StatefulWidget {
  ProductScreenTopPart({Key key}) : super(key: key);

  _ProductScreenTopPartState createState() => _ProductScreenTopPartState();
}

class _ProductScreenTopPartState extends State<ProductScreenTopPart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: screenAwareSize(245, context),
      child: Stack(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                child: Image.asset(
                  'assets/adidas.png',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60, right: 35),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: screenAwareSize(50, context),
                    height: screenAwareSize(50, context),
                    decoration: BoxDecoration(
                        color: Colors.black26, shape: BoxShape.circle),
                    child: Image.asset('assets/360.png'),
                  ),
                ),
              )
            ],
          ),
          Positioned(
            left: screenAwareSize(18, context),
            bottom: screenAwareSize(15, context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Rating',
                    style: TextStyle(
                        color: Color(0xff949598),
                        fontSize: screenAwareSize(10, context),
                        fontFamily: "Montserrat-SemiBold")),
                SizedBox(
                  height: screenAwareSize(8, context),
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 8,
                    ),
                    Icon(Icons.star, color: Color(0xffFFE600)),
                    SizedBox(
                      width: screenAwareSize(5, context),
                    ),
                    Text(
                      '4.5',
                      style: TextStyle(color: Color(0xffFFE600)),
                    ),
                    SizedBox(
                      width: screenAwareSize(5, context),
                    ),
                    Text('(378 People)',
                        style: TextStyle(color: Colors.white, fontSize: 14)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProductScreenBottomPart extends StatefulWidget {
  ProductScreenBottomPart({Key key}) : super(key: key);

  _ProductScreenBottomPartState createState() =>
      _ProductScreenBottomPartState();
}

class _ProductScreenBottomPartState extends State<ProductScreenBottomPart> {
  bool isExpanded = false;
  int currentSizeIndex = 0;
  int currentColorIndex = 0;
  int _counter = 0;

  void _increase() {
    setState(() {
      _counter++;
    });
  }

  void _decrease() {
    setState(() {
      _counter--;
    });
  }

  void _expand() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  List<Widget> colorSelector() {
    List<Widget> colorItemList = List();

    for (var i = 0; i < colors.length; i++) {
      colorItemList
          .add(colorItem(colors[i], i == currentColorIndex, context, () {
        setState(() {
          currentColorIndex = i;
        });
      }));
    }

    return colorItemList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: screenAwareSize(18, context)),
            child: Text('Product Description',
                style: TextStyle(
                    color: Color(0xFF949598),
                    fontSize: screenAwareSize(10, context),
                    fontFamily: "Montserrat-Semibold")),
          ),
          SizedBox(
            height: screenAwareSize(8, context),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenAwareSize(26, context),
                right: screenAwareSize(18, context)),
            child: AnimatedCrossFade(
              firstChild: Text(
                desc,
                maxLines: 2,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: screenAwareSize(10, context),
                    fontFamily: "Montserrat-Medium"),
              ),
              secondChild: Text(
                desc,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: screenAwareSize(10, context),
                    fontFamily: "Montserrat-Medium"),
              ),
              crossFadeState: isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: kThemeAnimationDuration,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenAwareSize(26, context),
                right: screenAwareSize(18, context)),
            child: GestureDetector(
              onTap: _expand,
              child: Text(
                isExpanded ? 'less' : 'more..',
                style: TextStyle(
                    color: Color(0xFFfb382f), fontWeight: FontWeight.w700),
              ),
            ),
          ),
          SizedBox(
            height: screenAwareSize(8, context),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: screenAwareSize(15, context),
                right: screenAwareSize(75, context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Size',
                  style: TextStyle(
                      color: Color(0xFF949598),
                      fontFamily: "Montserrat-SemiBold",
                      fontSize: screenAwareSize(10, context)),
                ),
                Text(
                  'Quantity',
                  style: TextStyle(
                      color: Color(0xFF949598),
                      fontFamily: "Montserrat-SemiBold",
                      fontSize: screenAwareSize(10, context)),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenAwareSize(8, context),
          ),
          Padding(
            padding: EdgeInsets.only(left: screenAwareSize(20, context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: screenAwareSize(38, context),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: sizeNumlist.map((item) {
                      var index = prefix0.sizeNumlist.indexOf(item);
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            currentSizeIndex = index;
                          });
                        },
                        child:
                            sizeItem(item, index == currentSizeIndex, context),
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(screenAwareSize(6, context)),
                  child: Container(
                    width: screenAwareSize(100, context),
                    height: screenAwareSize(30, context),
                    decoration: BoxDecoration(
                        color: Color(0xFF525663),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Flexible(
                          flex: 3,
                          child: GestureDetector(
                            onTap: _decrease,
                            child: Container(
                              height: double.infinity,
                              child: Center(
                                child: Text('-',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: "Montserrat-Bold")),
                              ),
                            ),
                          ),
                        ),
                        divider(),
                        Flexible(
                          flex: 3,
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: double.infinity,
                              child: Center(
                                child: Text(_counter.toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: "Montserrat-Bold")),
                              ),
                            ),
                          ),
                        ),
                        divider(),
                        Flexible(
                          flex: 3,
                          child: GestureDetector(
                            onTap: _increase,
                            child: Container(
                              height: double.infinity,
                              child: Center(
                                child: Text('+',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: "Montserrat-Bold")),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: screenAwareSize(18, context),
            ),
            child: Text(
              'Select Color',
              style: TextStyle(
                color: Color(0xFF949598),
                fontSize: screenAwareSize(10, context),
                fontFamily: "Montserrat-SemiBold",
              ),
            ),
          ),
          SizedBox(
            height: screenAwareSize(12, context),
          ),
          Container(
            margin: EdgeInsets.only(left: screenAwareSize(20, context)),
            width: double.infinity,
            height: screenAwareSize(34, context),
            child: Row(
              children: colorSelector(),
            ),
          ),
          SizedBox(
            height: screenAwareSize(8, context),
          ),
          Padding(
            padding: EdgeInsets.only(left: screenAwareSize(20, context)),
            child: Text(
              'Price',
              style: TextStyle(
                color: Color(0xFF949598),
                fontFamily: "Montserrat-SemiBold",
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: screenAwareSize(110, context),
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: screenAwareSize(22, context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.only(left: screenAwareSize(18, context)),
                        child: Row(
                          children: <Widget>[
                            Text(
                              '\$',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenAwareSize(16, context),
                                  fontFamily: 'Montserrat-Medium'),
                            ),
                            SizedBox(
                              width: screenAwareSize(2, context),
                            ),
                            Text(
                              '80',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenAwareSize(22, context),
                                  fontFamily: 'Montserrat-Medium'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: screenAwareSize(6, context),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: MaterialButton(
                          color: Color(0xFFfb382f),
                          padding: EdgeInsets.symmetric(
                              vertical: screenAwareSize(10, context)),
                          onPressed: () {},
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: screenAwareSize(35, context)),
                              child: Text('Add to Cart',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenAwareSize(15, context))),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: screenAwareSize(-40, context),
                  bottom: screenAwareSize(-45, context),
                  child: Image.asset(
                    'assets/cart.png',
                    width: screenAwareSize(190, context),
                    height: screenAwareSize(155, context),
                    fit: BoxFit.cover,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget sizeItem(String size, bool isSelected, BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(left: screenAwareSize(8, context)),
    child: Container(
      width: screenAwareSize(30, context),
      height: screenAwareSize(30, context),
      decoration: BoxDecoration(
          color: isSelected ? Color(0xFFFC3930) : Color(0xFF525663),
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: isSelected ? 
                Colors.black.withOpacity(.5) : 
                Colors.black12,
              offset: Offset(0.0, 10.0),
              blurRadius: 10,
            )
          ]),
      child: Center(
        child: Text(
          size,
          style: TextStyle(color: Colors.white, fontFamily: "Montserrat-Bold"),
        ),
      ),
    ),
  );
}

Widget colorItem(
    Color color, bool isSelected, BuildContext context, VoidCallback _onTap) {
  return GestureDetector(
    onTap: _onTap,
    child: Padding(
      padding: EdgeInsets.only(left: screenAwareSize(10, context)),
      child: Container(
        width: screenAwareSize(30, context),
        height: screenAwareSize(30, context),
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(5),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                        color: Colors.black.withOpacity(.8),
                        blurRadius: 10,
                        offset: Offset(0, 10)),
                  ]
                : []),
        child: ClipPath(
          clipper: MClipper(),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: color),
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
    ),
  );
}

class MClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width * 0.2, size.height);
    path.lineTo(size.width, size.height * 0.2);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

Widget divider() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
    child: Container(
      width: 0.8,
      color: Colors.black.withOpacity(.3),
    ),
  );
}
