#include <iostream>
#include <vector>
#include <string>
#include "StandardRide.cpp"
#include "PremiumRide.cpp"
#include "Driver.cpp"
#include "Rider.cpp"
#include "Ride.h"


using namespace std;

int main() {
    // Create a vector to store different types of rides
    vector<Ride*> rides;

    // Create rides of different types
    StandardRide* ride1 = new StandardRide(1, "Downtown", "Airport", 10.0);
    StandardRide* ride2 = new StandardRide(2, "Mall", "Beach", 5.0);
    PremiumRide* ride3 = new PremiumRide(3, "Airport", "Hotel", 15.0);
    PremiumRide* ride4 = new PremiumRide(4, "Hotel", "Conference Center", 8.0);

    // Add rides to the vector
    rides.push_back(ride1);
    rides.push_back(ride2);
    rides.push_back(ride3);
    rides.push_back(ride4);

    // Create a driver and rider
    Driver driver(1, "John Doe");
    Rider rider(1, "Alice Smith");

    // Calculate fares and display details for all rides polymorphically
    cout << "===== Demonstrating Polymorphism with Different Ride Types =====" << endl;
    
    for (Ride* ride : rides) {
        // Calculate fare (polymorphic call)
        ride->calculateFare();
        
        // Assign ride to driver and rider
        driver.addRide(ride);
        rider.requestRide(ride);
        
        // Display ride details (polymorphic call)
        ride->rideDetails();
        cout << "\n------------------------\n";
    }

    // Display driver and rider summaries
    driver.getDriverInfo();
    rider.viewRides();

    // Clean up memory
    for (Ride* ride : rides) {
        delete ride;
    }
    rides.clear();

    return 0;
}