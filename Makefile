MAIN_PROGRAM   := ./memory.server
DEBUG_PROGRAM  := ./memory.server.test

LIBS := 
SRC_FILES := main.cpp mem_web.cpp mem_db.cpp sqlite3.c mongoose.c

MAIN_CXXFLAGS  += -O2 -Wall
DEBUG_CXXFLAGS += -g -O0 -Wall

main:
	g++ -o $(MAIN_PROGRAM) $(MAIN_CXXFLAGS) $(SRC_FILES) $(LIBS)
debug:
	g++ -o $(DEBUG_PROGRAM) $(DEBUG_CXXFLAGS) $(SRC_FILES) $(LIBS)

clean:
	rm -rf $(MAIN_PROGRAM)
	rm -rf $(DEBUG_PROGRAM)
