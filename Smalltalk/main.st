"Create a collection of rides to demonstrate polymorphism"
rides := OrderedCollection new.

"Create rides of different types"
ride1 := StandardRide new
    rideID: 1;
    pickupLocation: 'Downtown';
    dropoffLocation: 'Airport';
    distance: 10.0;
    yourself.

ride2 := StandardRide new
    rideID: 2;
    pickupLocation: 'Mall';
    dropoffLocation: 'Beach';
    distance: 5.0;
    yourself.

ride3 := PremiumRide new
    rideID: 3;
    pickupLocation: 'Airport';
    dropoffLocation: 'Hotel';
    distance: 15.0;
    yourself.

ride4 := PremiumRide new
    rideID: 4;
    pickupLocation: 'Hotel';
    dropoffLocation: 'Conference Center';
    distance: 8.0;
    yourself.

"Add rides to collection"
rides add: ride1; add: ride2; add: ride3; add: ride4.

"Create driver and rider"
driver := Driver new
    driverID: 1;
    name: 'John Doe';
    yourself.

rider := Rider new
    riderID: 1;
    name: 'Alice Smith';
    yourself.

"Demonstrate polymorphism by processing rides"
Transcript show: '===== Demonstrating Polymorphism with Different Ride Types ====='; cr.

rides do: [:ride |
    "Calculate fare (polymorphic call)"
    ride calculateFare.
    
    "Assign ride to driver and rider"
    driver addRide: ride.
    rider requestRide: ride.
    
    "Display ride details (polymorphic call)"
    Transcript show: ride rideDetails; cr.
    Transcript show: '------------------------'; cr].

"Display driver and rider summaries"
Transcript show: driver driverInfo; cr.
Transcript show: rider viewRides; cr.