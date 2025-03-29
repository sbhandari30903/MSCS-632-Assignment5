"Ride Sharing System Implementation in Smalltalk"

"1. Ride Base Class"
Object subclass: Ride [
    | rideID pickupLocation dropoffLocation distance fare |

    Ride class >> newWithID: anID pickup: pickup dropoff: dropoff distance: dist [
        ^self new
            rideID: anID;
            pickupLocation: pickup;
            dropoffLocation: dropoff;
            distance: dist;
            yourself
    ]

    rideID: anID [ rideID := anID ]
    pickupLocation: aLocation [ pickupLocation := aLocation ]
    dropoffLocation: aLocation [ dropoffLocation := aLocation ]
    distance: aDistance [ distance := aDistance ]

    fare [
        "Base fare calculation - $1 per mile"
        fare := distance * 1.
        ^fare
    ]

    rideDetails [
        ^'Ride ID: ', rideID asString, 
        'From: ', pickupLocation, 
        'To: ', dropoffLocation, 
        'Distance: ', distance asString, ' miles', 
        'Fare: $', self fare asString
    ]

    printOn: aStream [
        aStream nextPutAll: self rideDetails
    ]
].

"2. StandardRide Subclass"
Ride subclass: StandardRide [
    | surgeMultiplier |

    StandardRide class >> newWithID: anID pickup: pickup dropoff: dropoff distance: dist [
        ^self new
            rideID: anID;
            pickupLocation: pickup;
            dropoffLocation: dropoff;
            distance: dist;
            yourself
    ]

    initialize [
        surgeMultiplier := 1.0.
    ]

    fare [
        "Standard fare is base fare with possible surge pricing"
        ^super fare * 2.0 + 5.0
    ]

    setSurgeMultiplier: multiplier [
        surgeMultiplier := multiplier
    ]

    rideDetails [
        ^super rideDetails, ' (Standard)'
    ]
].

"3. PremiumRide Subclass"
Ride subclass: PremiumRide [
    fare [
        "Premium fare is base fare + 50%"
        ^super fare * 3.5 + 10.0 + 5
    ]

    rideDetails [
        ^super rideDetails, ' (Premium)'
    ]
].

"4. Driver Class"
Object subclass: Driver [
    | driverID name rating assignedRides |

    Driver class >> newWithID: anID name: aName rating: aRating [
        ^self new
            driverID: anID;
            name: aName;
            rating: aRating;
            initialize;
            yourself
    ]

    initialize [
        assignedRides := OrderedCollection new.
    ]

    driverID: anID [ driverID := anID ]
    name: aName [ name := aName ]
    rating: aRating [ rating := aRating ]

    addRide: aRide [
        assignedRides add: aRide.
    ]

    assignedRides [
        ^assignedRides
    ]

    getDriverInfo [
        ^'Driver ID: ', driverID asString, 
        ' Name: ', name, 
        ' Rating: ', rating asString, 
        ' Completed Rides: ', assignedRides size asString
    ]

    printOn: aStream [
        aStream nextPutAll: self getDriverInfo
    ]
].

"5. Rider Class"
Object subclass: Rider [
    | riderID name requestedRides |

    Rider class >> newWithID: anID name: aName [
        ^self new
            riderID: anID;
            name: aName;
            initialize;
            yourself
    ]

    initialize [
        requestedRides := OrderedCollection new.
    ]

    riderID: anID [ riderID := anID ]
    name: aName [ name := aName ]

    requestRide: aRide [
        requestedRides add: aRide.
        ^aRide
    ]

    viewRides [
        | details |
        details := 'Ride history for ', name, ':'.
        requestedRides do: [:ride | 
            details := details, '
', ride rideDetails.
        ].
        ^details
    ]

    printOn: aStream [
        aStream nextPutAll: 'Rider ID: ', riderID asString, ' Name: ', name
    ]
].

"Demonstration Code"
| ride1 ride2 ride3 driver rider rides total |
"Create some rides"
ride1 := StandardRide newWithID: 1 pickup: 'Main St' dropoff: 'Broadway' distance: 5.
ride2 := PremiumRide newWithID: 2 pickup: 'Airport' dropoff: 'Downtown' distance: 15.
ride3 := StandardRide newWithID: 3 pickup: 'University' dropoff: 'Mall' distance: 8.
ride3 setSurgeMultiplier: 1.2. "Add surge pricing"

"Create a driver"
driver := Driver newWithID: 101 name: 'John Doe' rating: 4.8.
driver addRide: ride1.
driver addRide: ride2.
driver addRide: ride3.

"Create a rider"
rider := Rider newWithID: 501 name: 'Alice Smith'.
rider requestRide: ride1.
rider requestRide: ride2.
rider requestRide: ride3.

"Demonstrate polymorphism"
rides := OrderedCollection with: ride1 with: ride2 with: ride3.

'===== Demonstrating Polymorphism with Different Ride Types =====' printNl.
"Print all ride details polymorphically"
'Ride Details:' printNl.
rides do: [:ride |
    ride rideDetails printNl.
].

"Print total fares"
total := 0.
rides do: [:ride |
    total := total + ride fare.
].
'' printNl.
('Total fare for all rides: $', total asString) printNl.

"Print driver info"
'' printNl.
'Driver Information:' printNl.
driver getDriverInfo printNl.

"Print rider's ride history"
'' printNl.
'Rider History:' printNl.
rider viewRides printNl.