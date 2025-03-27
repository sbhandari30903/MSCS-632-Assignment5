#include "Ride.h"
#include <iostream>

// Constructor implementation
Ride::Ride(int id, string pickup, string dropoff, double dist, double fareAmount)
    : rideID(id), pickupLocation(pickup), dropoffLocation(dropoff), 
      distance(dist), fare(fareAmount) {}

// Getter implementations
int Ride::getRideID() const { return rideID; }
string Ride::getPickupLocation() const { return pickupLocation; }
string Ride::getDropoffLocation() const { return dropoffLocation; }
double Ride::getDistance() const { return distance; }
double Ride::getFare() const { return fare; }

// Setter implementations
void Ride::setRideID(int id) { rideID = id; }
void Ride::setPickupLocation(const string& pickup) { pickupLocation = pickup; }
void Ride::setDropoffLocation(const string& dropoff) { dropoffLocation = dropoff; }
void Ride::setDistance(double dist) { distance = dist; }
void Ride::setFare(double fareAmount) { fare = fareAmount; }

// Virtual method implementations
void Ride::calculateFare() {
    fare = distance * RATE_PER_MILE;
}

Ride::~Ride() {}

// Display method implementation
void Ride::rideDetails() const {
    cout << "Ride Details:" << endl;
    cout << "Ride ID: " << rideID << endl;
    cout << "Pickup Location: " << pickupLocation << endl;
    cout << "Dropoff Location: " << dropoffLocation << endl;
    cout << "Distance: " << distance << " mile" << endl;
    cout << "Fare: $" << fare << endl;
}