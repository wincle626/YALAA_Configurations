# 1. Compiler and Flags
CXX      := g++
CXXFLAGS := -Wall -Wextra -std=c++11 -O2

# 2. Header and Library Paths (UPDATE THESE PATHS)
# -I adds directories to search for header files
# -L adds directories to search for .so files
INCLUDES := -I/home/ubuntu/yalaa/yalaa-0.92/install/include -I/home/ubuntu/yalaa/cxsc-2-5-4/install/include -I/home/ubuntu/yalaa/boost_1_81_0/install/include
LIBPATHS := -L/home/ubuntu/yalaa/yalaa-0.92/install/lib -L/home/ubuntu/yalaa/cxsc-2-5-4/install/lib -L/home/ubuntu/yalaa/boost_1_81_0/install/lib

# 3. Library Names
# Specify names without the 'lib' prefix or '.so' extension
# e.g., libyalaa.so becomes -lyalaa
LDLIBS   := -lyalaa -lcxsc

# 4. Target Executable
TARGET   := function
SRC      := function.cpp
OBJ      := $(SRC:.cpp=.o)

# --- Build Rules ---

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LIBPATHS) $(LDLIBS)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

clean:
	rm -f $(TARGET) $(OBJ)

.PHONY: all clean
