Object subclass: #Ride
    instanceVariableNames: 'rideID pickupLocation dropoffLocation distance fare'
    classVariableNames: ''
    package: 'RideShare'

"Initialize method"
Ride>>initialize
    super initialize.
    fare := 0.0.

"Accessor methods"
Ride>>rideID
    ^rideID

Ride>>rideID: anInteger
    rideID := anInteger

Ride>>pickupLocation
    ^pickupLocation

Ride>>pickupLocation: aString
    pickupLocation := aString

Ride>>dropoffLocation
    ^dropoffLocation

Ride>>dropoffLocation: aString
    dropoffLocation := aString

Ride>>distance
    ^distance

Ride>>distance: aNumber
    distance := aNumber

Ride>>fare
    ^fare

Ride>>fare: aNumber
    fare := aNumber

"Business logic methods"
Ride>>calculateFare
    "Abstract method - to be implemented by subclasses"
    self subclassResponsibility

Ride>>rideDetails
    ^String streamContents: [:stream |
        stream
            nextPutAll: 'Ride ID: '; print: rideID; cr;
            nextPutAll: 'Pickup: '; nextPutAll: pickupLocation; cr;
            nextPutAll: 'Dropoff: '; nextPutAll: dropoffLocation; cr;
            nextPutAll: 'Distance: '; print: distance; nextPutAll: ' miles'; cr;
            nextPutAll: 'Fare: $'; print: fare; cr]