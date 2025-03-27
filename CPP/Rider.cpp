#include <iostream>
#include <vector>
#include "Ride.h"
using namespace std;

class Rider {
private:
    int riderID;
    string name;
    vector<Ride*> requestedRides;  // List of requested rides

public:
    // Constructor
    Rider(int id, string riderName) 
        : riderID(id), name(riderName) {}

    // Getters
    int getRiderID() const { return riderID; }
    string getName() const { return name; }

    // Setters
    void setRiderID(int id) { riderID = id; }
    void setName(const string& riderName) { name = riderName; }

    // Request a new ride
    void requestRide(Ride* ride) {
        requestedRides.push_back(ride);
    }

    // Get total spent on rides
    double getTotalSpent() const {
        double total = 0.0;
        for (const Ride* ride : requestedRides) {
            total += ride->getFare();
        }
        return total;
    }

    // Get total number of rides
    int getTotalRides() const {
        return requestedRides.size();
    }

    // View ride history
    void viewRides() const {
        cout << "\nRider Information:" << endl;
        cout << "Rider ID: " << riderID << endl;
        cout << "Name: " << name << endl;
        cout << "Total Rides: " << getTotalRides() << endl;
        cout << "Total Spent: $" << getTotalSpent() << endl;

        cout << "\nRide History:" << endl;
        for (size_t i = 0; i < requestedRides.size(); i++) {
            cout << "\nRide #" << (i + 1) << ":" << endl;
            requestedRides[i]->rideDetails();
        }
    }

    // Destructor
    ~Rider() {
        // Note: We don't delete the Ride pointers here as they might be managed elsewhere
        requestedRides.clear();
    }
};