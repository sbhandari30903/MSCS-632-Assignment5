Object subclass: #Driver
    instanceVariableNames: 'driverID name rating assignedRides'
    classVariableNames: ''
    package: 'RideShare'

"Initialize method"
Driver>>initialize
    super initialize.
    rating := 5.0.
    assignedRides := OrderedCollection new.

"Accessor methods"
Driver>>driverID
    ^driverID

Driver>>driverID: anInteger
    driverID := anInteger

Driver>>name
    ^name

Driver>>name: aString
    name := aString

Driver>>rating
    ^rating

Driver>>rating: aNumber
    (aNumber between: 0.0 and: 5.0)
        ifTrue: [rating := aNumber]
        ifFalse: [self error: 'Rating must be between 0 and 5']

"Business logic methods"
Driver>>addRide: aRide
    assignedRides add: aRide

Driver>>totalEarnings
    ^assignedRides sum: [:ride | ride fare]

Driver>>totalRides
    ^assignedRides size

Driver>>driverInfo
    ^String streamContents: [:stream |
        stream
            nextPutAll: '=== Driver Information ==='; cr;
            nextPutAll: 'Driver ID: '; print: driverID; cr;
            nextPutAll: 'Name: '; nextPutAll: name; cr;
            nextPutAll: 'Rating: '; print: rating; nextPutAll: ' stars'; cr;
            nextPutAll: 'Total Rides: '; print: self totalRides; cr;
            nextPutAll: 'Total Earnings: $'; print: self totalEarnings; cr; cr;
            nextPutAll: '=== Recent Rides ==='; cr.
        assignedRides doWithIndex: [:ride :index |
            stream
                nextPutAll: '--- Ride #'; print: index; nextPutAll: ' ---'; cr;
                nextPutAll: ride rideDetails;
                cr]]