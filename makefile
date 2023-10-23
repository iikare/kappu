CC=clang
CFLAGS=-std=c17 -O3 -Wall -Wextra
LFLAGS=-lX11

PREREQ_DIR=@mkdir -p $(@D)

SRCDIR=src
BUILDDIR=build
BINDIR=bin

NAME=$(addprefix $(BINDIR)/, kappu)

SRCS=$(wildcard $(SRCDIR)/*.c)
OBJS=$(patsubst $(SRCDIR)/%.c, $(BUILDDIR)/%.o, $(SRCS))

$(NAME): $(OBJS) | $(@D)
	$(PREREQ_DIR)
	$(CC) $(CFLAGS) -o $(NAME) $(OBJS) $(LFLAGS)

$(OBJS): $(BUILDDIR)/%.o: $(SRCDIR)/%.c
	$(PREREQ_DIR)
	$(CC) $(CFLAGS) -o $@ -c $<

re: clean
	@$(MAKE) --no-print-directory

clean:
	@echo
	@echo "cleaning old build files"
	@echo
	rm -f build/*.o
	rm -f $(NAME)

.PHONY: all clean

