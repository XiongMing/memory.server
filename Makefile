###########################################################
## Usage:
## make       : make memory.server
## make clean : clean all
###########################################################

PROGRAM       := memory.server
CFLAGS        += -O2 -Wall

SRC_DIRS      := .
INCLUDE_DIRS  := -I.
LIBS          := 
OBJS_DIR      := ./objs

## source file ##
C_SRC_FILES   := $(foreach srcdir, $(SRC_DIRS), $(wildcard $(srcdir)/*.c))
CXX_SRC_FILES := $(foreach srcdir, $(SRC_DIRS), $(wildcard $(srcdir)/*.cpp))

## objects ##
C_OBJS   := $(patsubst %.c, $(OBJS_DIR)/%.c.o, $(C_SRC_FILES))
CXX_OBJS := $(patsubst %.cpp, $(OBJS_DIR)/%.cxx.o, $(CXX_SRC_FILES))

## depends ##
C_DEPS   := $(patsubst %.o, %.d, $(C_OBJS))
CXX_DEPS := $(patsubst %.o, %.d, $(CXX_OBJS))

main: $(C_OBJS) $(CXX_OBJS)
	@echo LD $(PROGRAM)
	@g++ $(CFLAGS) $(C_OBJS) $(CXX_OBJS) $(LIBS) -o $(PROGRAM)
$(C_OBJS): $(OBJS_DIR)/%.c.o: %.c
	@echo CC $<
	@mkdir -p `dirname $@`
	@g++ -c $(CFLAGS) $(INCLUDE_DIRS) -x c $< -o $@
$(CXX_OBJS): $(OBJS_DIR)/%.cxx.o: %.cpp
	@echo CC $<
	@mkdir -p `dirname $@`
	@g++ -c $(CFLAGS) $(INCLUDE_DIRS) -x c++ $< -o $@

-include $(C_DEPS)
-include $(CXX_DEPS)

clean:
	@echo clean $(PROGRAM)
	@rm -rf $(PROGRAM)
	@echo clean objs
	@rm -rf $(OBJS_DIR)
