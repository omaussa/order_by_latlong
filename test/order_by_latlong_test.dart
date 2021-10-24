import 'package:flutter_test/flutter_test.dart';

import 'package:order_by_latlong/order_by_latlong.dart';

void main() {
  test('test of distance order by lat lon tienda', () {
    List<OBLPackage> packages = [];
    OBLLocation initLocation = OBLLocation(11.0173852, -74.8019662);
    packages.add(OBLPackage("farmacap", OBLLocation(11.019464, -74.801829)));
    packages.add(OBLPackage(
        "tienda", OBLLocation(11.016950094901228, -74.80307652872365)));
    packages.add(OBLPackage(
        "parque", OBLLocation(11.014776761149234, -74.80728900574304)));
    List<OBLPackage> orderer =
        OBLHelper.orderByDistance(initLocation, packages);

    expect(orderer.length, 3);
    expect(orderer[0].id, "tienda");
    expect(orderer[1].id, "farmacap");
    expect(orderer[2].id, "parque");
  });

  test('test of distance order by lat lon mall', () {
    List<OBLPackage> packages = [];
    OBLLocation initLocation = OBLLocation(11.0173852, -74.8019662);
    packages.add(OBLPackage(
        "mall", OBLLocation(11.016119658455095, -74.83033512868042)));
    packages.add(OBLPackage(
        "auto", OBLLocation(11.001790191927041, -74.81927857290138)));
    packages.add(
        OBLPackage("far", OBLLocation(10.982230900203032, -74.83594978700286)));
    List<OBLPackage> orderer =
        OBLHelper.orderByDistance(initLocation, packages);

    expect(orderer.length, 3);
    expect(orderer[0].id, "auto");
    expect(orderer[1].id, "mall");
    expect(orderer[2].id, "far");
  });
}
