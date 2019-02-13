SRC_DIR := ./src
OBJ_DIR := ./obj
SRC_FILES := $(wildcard $(SRC_DIR)/*.cpp)
OBJ_FILES := $(patsubst $(STC_DIR)/%.cpp,$(OBJ_DIR)/%.0,$(SRC_FILES))

CPPFLAGS= -c -std=c++11

# Creates the output (program) file
output: $(OBJ_FILES)
	@echo ---------------
	@echo Compile and run
	@echo 
	g++ -std=c++11 -o $@ $^
	@echo ---------------
	@./output

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	g++ $(CPPFLAGS) -c -o $@ $<

compile: output

run:
	@echo -------------------
	@echo Running program with make 
	@echo -------------------
	@./output

clean:
	@echo ----------
	@echo Cleaning up
	@rm output*
	@echo ----------
