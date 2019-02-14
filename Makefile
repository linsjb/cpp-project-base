SRC_DIR := ./src
OBJ_DIR := ./obj
SRC_FILES := $(wildcard $(SRC_DIR)/*.cpp)
OBJ_FILES := $(patsubst $(STC_DIR)/%.cpp,$(OBJ_DIR)/%.0,$(SRC_FILES))
CPPFLAGS= -c -std=c++11

# Print variables
DELIMITER ?= --------------- 

compile: program
clean: clean-files
run: run-program
compile-run: program run-program

# Creates the output (program) file
program: $(OBJ_FILES)
	@echo Compiling
	@echo $(DELIMITER)
	g++ -std=c++11 -o $@ $^

# Running program
run-program:
	@echo Running 
	@echo $(DELIMITER)
	@./program

# Build project structure
build-structure:
	@echo Building structure
	@echo $(DELIMITER)
	mkdir src
	rm -rf .git
	rm README.MD

# Clean output files
clean-files:
	@echo Cleaning up
	@rm program*
	@echo $(DELIMITER)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	g++ $(CPPFLAGS) -c -o $@ $<

