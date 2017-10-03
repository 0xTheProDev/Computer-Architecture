# RISC: Makefile
# Author: Progyan Bhattacharya <progyanb@acm.org>
#
# This file contains target rules and dependencies for compilation of simulator.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to use,
# copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the
# Software, and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
# INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
# PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
# CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
# OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# Compiler/Simulator
CC=iverilog

# Compiler Flag
CFLAGS=

# Binary Executable
EXE=main

# Directories
SRC=src
LIB=lib
BIN=bin

# Source(s)
SRCS=$(wildcard $(SRC)/*.v $(LIB)/*.v)

# Default Target
$(BIN)/$(EXE): $(SRCS)
	@mkdir -p $(BIN)
	$(CC) $(CFLAGS) $^ -o $@

# Help Option
help:
	@echo "Target Binary: $(BIN)/$(EXE)"
	@echo "Source File(s): $(SRCS)"

# House-keeping
clean:
	@rm -rf core $(EXE) $(BIN) *.out *.exe

.PHONY: clean help
