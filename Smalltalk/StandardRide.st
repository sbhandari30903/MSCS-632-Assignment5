Ride subclass: #StandardRide
    instanceVariableNames: ''
    classVariableNames: 'BaseRate BaseFee'
    package: 'RideShare'

"Class initialization"
StandardRide class>>initialize
    BaseRate := 2.0.  "$ per mile"
    BaseFee := 5.0.   "Base fee"

"Business logic methods"
StandardRide>>calculateFare
    fare := BaseFee + (distance * BaseRate)

StandardRide>>rideDetails
    ^String streamContents: [:stream |
        stream
            nextPutAll: 'Standard ';
            nextPutAll: (super rideDetails)]