CXX=clang
C=clang
CFLAGS=-std=c2x -Og -g -Wall -Wextra
LFLAGS=-L/usr/X11R6/lib -lX11

PREREQ_DIR=@mkdir -p $(@D)

SRCDIR=src
BUILDDIR=build
BINDIR=bin

NAME=$(addprefix $(BINDIR)/, kappu)

SRCS=$(wildcard $(SRCDIR)/*.c)#$(wildcard $(SRCDIR)/*/*.c)
OBJS=$(patsubst $(SRCDIR)/%.c, $(BUILDDIR)/%.o, $(SRCS))

all:

	@$(MAKE) --no-print-directory $(NAME)

$(NAME): $(OBJS) | $(@D)
	$(PREREQ_DIR)
	$(CXX) $(CFLAGS) -o $(NAME) $(OBJS) $(LFLAGS)

$(OBJS): $(BUILDDIR)/%.o: $(SRCDIR)/%.c
	$(PREREQ_DIR)
	$(CXX) $(CFLAGS) -o $@ -c $<

re: clean
	@$(MAKE) --no-print-directory

clean:
	@echo
	@echo "cleaning old build files"
	@echo
	@$(MAKE) --no-print-directory cleanbuild
	@$(MAKE) --no-print-directory cleanexec

cleanbuild:
	rm -f build/*.o

cleanexec:
	rm -f $(NAME)

.PHONY: all clean

