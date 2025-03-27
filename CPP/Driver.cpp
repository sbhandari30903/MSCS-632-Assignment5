#include <iostream>
#include <vector>
#include "Ride.h"
using namespace std;

class Driver {
private:
    int driverID;
    string name;
    double rating;
    vector<Ride*> assignedRides;  // List of completed rides

public:
    // Constructor
    Driver(int id, string driverName, double initialRating = 5.0)
        : driverID(id), name(driverName), rating(initialRating) {}

    // Getters
    int getDriverID() const { return driverID; }
    string getName() const { return name; }
    double getRating() const { return rating; }
    
    // Setters
    void setDriverID(int id) { driverID = id; }
    void setName(const string& driverName) { name = driverName; }
    void setRating(double newRating) { 
        if (newRating >= 0.0 && newRating <= 5.0) {
            rating = newRating;
        }
    }

    // Add a ride to driver's history
    void addRide(Ride* ride) {
        assignedRides.push_back(ride);
    }

    // Get total earnings from all rides
    double getTotalEarnings() const {
        double total = 0.0;
        for (const Ride* ride : assignedRides) {
            total += ride->getFare();
        }
        return total;
    }

    // Get total number of rides
    int getTotalRides() const {
        return assignedRides.size();
    }

    // Display driver information
    void getDriverInfo() const {
        cout << "\nDriver Information:" << endl;
        cout << "Driver ID: " << driverID << endl;
        cout << "Name: " << name << endl;
        cout << "Rating: " << rating << " stars" << endl;
        cout << "Total Rides: " << getTotalRides() << endl;
        cout << "Total Earnings: $" << getTotalEarnings() << endl;
        
        // Display recent rides
        cout << "\nRecent Rides:" << endl;
        for (size_t i = 0; i < assignedRides.size(); i++) {
            cout << "\nRide #" << (i + 1) << ":" << endl;
            assignedRides[i]->rideDetails();
        }
    }

    // Destructor
    ~Driver() {
        // Note: We don't delete the Ride pointers here as they might be managed elsewhere
        assignedRides.clear();
    }
};