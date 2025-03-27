CXX = g++
CXXFLAGS = -Wall -std=c++11
TARGET = rideshare
SRCS = main.cpp Ride.cpp PremiumRide.cpp StandardRide.cpp Driver.cpp Rider.cpp

$(TARGET): $(SRCS)
	$(CXX) $(CXXFLAGS) $(SRCS) -o $(TARGET)

.PHONY: clean run

clean:
	rm -f $(TARGET)

run: $(TARGET)
	./$(TARGET)
