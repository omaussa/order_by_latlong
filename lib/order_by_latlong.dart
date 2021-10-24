library order_by_latlong;

import 'dart:math';

class OBLLocation {
  double lat;
  double long;
  OBLLocation(this.lat, this.long);
}

class OBLPackage {
  String id;
  OBLLocation location;
  OBLPackage(this.id, this.location);
}

class OBLHelper {
  static List<OBLPackage> ordererPackages = [];
  static List<OBLPackage> orderByDistance(
      OBLLocation initLocation, List<OBLPackage> packages) {
    ordererPackages = [];
    List<OBLPackage> packagesSource = [...packages];
    OBLPackage packageToAdd = closerPackage(initLocation, packagesSource)!;
    ordererPackages.add(packageToAdd);
    packagesSource.remove(packageToAdd);
    while (packagesSource.isNotEmpty) {
      packageToAdd = closerPackage(packageToAdd.location, packagesSource)!;
      ordererPackages.add(packageToAdd);
      packagesSource.remove(packageToAdd);
    }
    return ordererPackages;
  }

  static OBLPackage? closerPackage(
      OBLLocation sourceLocation, List<OBLPackage> packages) {
    double lowerDistance = double.infinity;
    OBLPackage? closerPackage;
    for (OBLPackage package in packages) {
      OBLLocation targetLocation = package.location;
      double distance = sqrt(pow(targetLocation.lat - sourceLocation.lat, 2) +
          pow(targetLocation.long - sourceLocation.long, 2));
      if (distance < lowerDistance) {
        lowerDistance = distance;
        closerPackage = package;
      }
    }
    return closerPackage;
  }
}
