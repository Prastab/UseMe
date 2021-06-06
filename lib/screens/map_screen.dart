import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MapScreen extends StatefulWidget {
  final List factories;
  MapScreen(this.factories);
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController _controller;

  List<Marker> allMarkers = [];

  PageController _pageController;

  int prevPage;

  @override
  void initState() {
    super.initState();
    widget.factories.forEach((element) {
      allMarkers.add(Marker(
          markerId: MarkerId(element.name),
          draggable: false,
          infoWindow: InfoWindow(title: element.name, snippet: element.address),
          position: element.locationCoords));
    });
    _pageController = PageController(initialPage: 1, viewportFraction: 1)
      ..addListener(_onScroll);
  }

  void _onScroll() {
    if (_pageController.page.toInt() != prevPage) {
      prevPage = _pageController.page.toInt();
      moveCamera();
    }
  }

  _coffeeShopList(index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return SizedBox(
          height: Curves.easeInOut.transform(value) * 150.0,
          width: Curves.easeInOut.transform(value) * 400.0,
          child: widget,
        );
      },
      child: SlidingUpPanel(
        slideDirection: SlideDirection.UP,
        panel: _floatingPanel(index),
        renderPanelSheet: false,
        collapsed: _floatingCollapsed(index),
      ),
    );
  }

  Widget _floatingCollapsed(int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        // borderRadius: BorderRadius.only(topRight: Radius.circular(24.0)),
      ),
      margin: const EdgeInsets.fromLTRB(20.0, 24.0, 20.0, 0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            widget.factories[index].name,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            widget.factories[index].address,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _floatingPanel(int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[600],
      ),
      margin: const EdgeInsets.all(24.0),
      child: Padding(
        padding: EdgeInsets.only(left: 20, top: 30, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.factories[index].name,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Address : " + widget.factories[index].address,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Phone : " + widget.factories[index].phone.toString(),
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              widget.factories[index].description,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Maps'),
          centerTitle: true,
        ),
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height - 50.0,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
                zoomControlsEnabled: false,
                initialCameraPosition: CameraPosition(
                    target: widget.factories[1].locationCoords, zoom: 25.0),
                markers: Set.from(allMarkers),
                onMapCreated: mapCreated,
              ),
            ),
            Positioned(
              bottom: 10.0,
              child: SingleChildScrollView(
                child: Container(
                  height: 500.0,
                  width: MediaQuery.of(context).size.width,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: widget.factories.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _coffeeShopList(index);
                    },
                  ),
                ),
              ),
            )
          ],
        ));
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }

  moveCamera() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: widget.factories[_pageController.page.toInt()].locationCoords,
        zoom: 16.0,
        bearing: 90.0,
        tilt: 45.0)));
  }
}

// Container(
//               margin: EdgeInsets.symmetric(
//                 horizontal: 10.0,
//                 vertical: 20.0,
//               ),
//               height: 500,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10.0),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black54,
//                       offset: Offset(0.0, 4.0),
//                       blurRadius: 10.0,
//                     ),
//                   ]),
//               child: Container(
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10.0),
//                       color: Colors.white),
//                   child: SingleChildScrollView(
//                     child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             factories[index].name,
//                             style: TextStyle(
//                                 fontSize: 18, fontWeight: FontWeight.bold),
//                           ),
//                           Text(
//                             factories[index].address,
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.w600),
//                           ),
//                           Container(
//                             width: 170.0,
//                             child: Text(
//                               factories[index].description,
//                               style: TextStyle(
//                                   fontSize: 16, fontWeight: FontWeight.w300),
//                             ),
//                           )
//                         ]),
//                   )));
