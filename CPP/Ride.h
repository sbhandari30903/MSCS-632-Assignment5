#ifndef RIDE_H
#define RIDE_H

#include <string>
using namespace std;
#include <iostream>

class Ride {
private:
    int rideID;
    string pickupLocation;
    string dropoffLocation;
    double distance;
    double fare;
    const double RATE_PER_MILE = 1.0; // Default rate per mile

public:
    // Constructor
    Ride(int id, string pickup, string dropoff, double dist, double fareAmount = 0.0);

    // Getters
    int getRideID() const;
    string getPickupLocation() const;
    string getDropoffLocation() const;
    double getDistance() const;
    double getFare() const;

    // Setters
    void setRideID(int id);
    void setPickupLocation(const string& pickup);
    void setDropoffLocation(const string& dropoff);
    void setDistance(double dist);
    void setFare(double fareAmount);

    // Virtual methods
    virtual void calculateFare();
    virtual ~Ride();

    // Display ride details
    virtual void rideDetails() const;
};

#endif // RIDE_H