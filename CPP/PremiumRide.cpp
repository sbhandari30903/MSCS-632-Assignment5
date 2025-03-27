#include "Ride.h"
using namespace std;

class PremiumRide : public Ride {
private:
    const double PREMIUM_RATE = 3.5;    // $3.50 per mile for premium rides
    const double BASE_FEE = 10.0;       // $10 base fee
    const double LUXURY_SERVICE_FEE = 5.0; // Additional luxury service fee

public:
    PremiumRide(int id, string pickup, string dropoff, double dist)
        : Ride(id, pickup, dropoff, dist) {}

    void calculateFare() override {
        // Premium fare calculation: base fee + luxury fee + (distance * premium rate)
        setFare(BASE_FEE + LUXURY_SERVICE_FEE + (getDistance() * PREMIUM_RATE));
    }

    void rideDetails() const override {
        cout << "Premium Ride Details:" << endl;
        Ride::rideDetails();  // Call base class method to display common details
    }
};