# Ride-Sharing System Implementation

This project implements a ride-sharing system in both C++ and Smalltalk, demonstrating object-oriented programming concepts including inheritance, polymorphism, and encapsulation.

## Project Structure

```bash
MSCS-632-Assignment5/
├── CPP/
│   │── Ride.h
│   │── Ride.cpp
│   │── StandardRide.cpp
│   │── PremiumRide.cpp
│   │── Driver.cpp
│   │── Rider.cpp
│   ├── main.cpp
│   └── Makefile
└── Smalltalk/
    ├── ride-sharing.st
```

## Features

- Base `Ride` class with core functionality
- `StandardRide` and `PremiumRide` subclasses with different pricing models
- `Driver` class managing assigned rides and earnings
- `Rider` class handling ride requests and history
- Polymorphic behavior through virtual methods/message passing
- Memory management and encapsulation

## C++ Implementation

### Prerequisites
- C++11 compatible compiler
- GNU Make

### Building and Running
```bash
# Navigate to CPP directory
cd CPP

# Build the project
make

# Run the program
make run

# Clean build files
make clean
```

### Key C++ Features Used
- Virtual functions for polymorphism
- Smart pointers for memory management
- STL containers (vector)
- Access control for encapsulation

## Smalltalk Implementation

### Prerequisites
- Pharo Smalltalk environment

### Running the Code
1. Open Pharo Smalltalk
2. Load the class files in order:
```bash 
smalltalk
FileStream fileIn: 'ride-sharing.st'.
```
### Running Smalltalk using online compiler
1. open https://www.jdoodle.com/execute-smalltalk-online 
2. copy code from ride-sharing.st to the IDE
3. Click on Execute button on the top right

### Key Smalltalk Features Used
- Message passing for polymorphism
- Dynamic typing
- Collection protocols
- Object composition

## Class Hierarchy

```
Ride (abstract)
├── StandardRide ($2/mile + $5 base fee)
└── PremiumRide ($3.50/mile + $10 base fee + $5 luxury fee)

Driver
└── Manages ride assignments and earnings

Rider
└── Manages ride requests and spending
```

## Sample Output for CPP

```
===== Demonstrating Polymorphism with Different Ride Types =====
Standard Ride Details:
Ride ID: 1
Pickup: Downtown
Dropoff: Airport
Distance: 10.0 miles
Fare: $25.00
------------------------
... (more ride details) ...

Driver Information:
Driver ID: 1
Name: John Doe
Rating: 5.0 stars
Total Rides: 4
Total Earnings: $137.50
...
```

## Sample Output for SmallTalk
```
'===== Demonstrating Polymorphism with Different Ride Types ====='
'Ride Details:'
'Ride ID: 1From: Main StTo: BroadwayDistance: 5 milesFare: $15.0 (Standard)'
'Ride ID: 2From: AirportTo: DowntownDistance: 15 milesFare: $67.5 (Premium)'
'Ride ID: 3From: UniversityTo: MallDistance: 8 milesFare: $21.0 (Standard)'
''
'Total fare for all rides: $103.5'
''
'Driver Information:'
'Driver ID: 101 Name: John Doe Rating: 4.8 Completed Rides: 3'
''
'Rider History:'
'Ride history for Alice Smith:
Ride ID: 1From: Main StTo: BroadwayDistance: 5 milesFare: $15.0 (Standard)
Ride ID: 2From: AirportTo: DowntownDistance: 15 milesFare: $67.5 (Premium)
Ride ID: 3From: UniversityTo: MallDistance: 8 milesFare: $21.0 (Standard)'
```

## Testing

The system demonstrates:
- Creation of different ride types
- Fare calculation based on ride type
- Driver and rider interactions
- Polymorphic behavior through collections
- Memory management (C++)

