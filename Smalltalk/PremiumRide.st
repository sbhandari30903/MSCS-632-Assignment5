Ride subclass: #PremiumRide
    instanceVariableNames: ''
    classVariableNames: 'PremiumRate BaseFee LuxuryFee'
    package: 'RideShare'

"Class initialization"
PremiumRide class>>initialize
    PremiumRate := 3.5.  "$ per mile"
    BaseFee := 10.0.     "Base fee"
    LuxuryFee := 5.0.    "Additional luxury service fee"

"Business logic methods"
PremiumRide>>calculateFare
    fare := BaseFee + LuxuryFee + (distance * PremiumRate)

PremiumRide>>rideDetails
    ^String streamContents: [:stream |
        stream
            nextPutAll: 'Premium ';
            nextPutAll: (super rideDetails)]