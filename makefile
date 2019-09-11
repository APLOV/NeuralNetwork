###############################################
# Program name
APP_NAME= app

# Compiler and Linker
CXX		= g++

# Flags
CXXFLAGS= -Wall -pedantic

# Object files
OBJECTS	= main.o

# Directories
SRC_DIR	= src
INC_DIR = inc
TEMP_DIR= temp

###############################################
# Automated capturing dependencies
$(TEMP_DIR)/%.d: %.cpp
	$(CXX) -M $(CXXFLAGS) $< > $@
include $(TEMP_DIR)/$(OBJECTS:.o=.d)

###############################################
# assembler
$(TEMP_DIR)/%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

###############################################
# Makes
all: clean $(APP_NAME)

clean:
	rm -f $(TEMP_DIR)/*.o

cleanall: clean
	rm -f $(TEMP_DIR)/*.d

###############################################