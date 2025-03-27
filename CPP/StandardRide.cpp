#include "Ride.h"
using namespace std;

class StandardRide : public Ride {
private:
    const double BASE_RATE = 2.0;  // $2 per mile for standard rides
    const double BASE_FEE = 5.0;   // $5 base fee

public:
    StandardRide(int id, string pickup, string dropoff, double dist)
        : Ride(id, pickup, dropoff, dist) {}

    void calculateFare() override {
        // Standard fare calculation: base fee + (distance * rate)
        setFare(BASE_FEE + (getDistance() * BASE_RATE));
    }

    void rideDetails() const override {
        cout << "Standard Ride Details:" << endl;
        Ride::rideDetails();  // Call base class method to display common details
    }
};