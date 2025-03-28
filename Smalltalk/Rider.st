Object subclass: #Rider
    instanceVariableNames: 'riderID name requestedRides'
    classVariableNames: ''
    package: 'RideShare'

"Initialize method"
Rider>>initialize
    super initialize.
    requestedRides := OrderedCollection new.

"Accessor methods"
Rider>>riderID
    ^riderID

Rider>>riderID: anInteger
    riderID := anInteger

Rider>>name
    ^name

Rider>>name: aString
    name := aString

"Business logic methods"
Rider>>requestRide: aRide
    requestedRides add: aRide

Rider>>totalSpent
    ^requestedRides sum: [:ride | ride fare]

Rider>>totalRides
    ^requestedRides size

Rider>>viewRides
    ^String streamContents: [:stream |
        stream
            nextPutAll: '=== Rider Information ==='; cr;
            nextPutAll: 'Rider ID: '; print: riderID; cr;
            nextPutAll: 'Name: '; nextPutAll: name; cr;
            nextPutAll: 'Total Rides: '; print: self totalRides; cr;
            nextPutAll: 'Total Spent: $'; print: self totalSpent; cr; cr;
            nextPutAll: '=== Ride History ==='; cr.
        requestedRides doWithIndex: [:ride :index |
            stream
                nextPutAll: '--- Ride #'; print: index; nextPutAll: ' ---'; cr;
                nextPutAll: ride rideDetails;
                cr]]