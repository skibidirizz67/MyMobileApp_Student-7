CC = cc

SRCDIR = src
BLDDIR = build
BINDIR = bin

SRC = $(wildcard $(SRCDIR)/*.c)
OBJ = $(SRC:$(SRCDIR)/%.c=$(BLDDIR)/%.o)

CFLAGS = -O3 -Wall -Wextra -funroll-loops -march=native

TARGET = $(BINDIR)/a

all: $(TARGET)

$(TARGET): $(OBJ) | $(BINDIR)
	$(CC) $^ -o $@
$(OBJ): $(SRC) | $(BLDDIR)
	$(CC) $(CFLAGS) -c $(@:$(BLDDIR)/%.o=$(SRCDIR)/%.c) -o $@

$(BLDDIR) $(BINDIR):
	mkdir $@

check: $(TARGET)
	./tesh.sh

clean:
	rm -rf $(BLDDIR) $(BINDIR)
