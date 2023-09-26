CC=gcc
CFLAGS= -Wall `pkg-config --cflags gtk+-3.0`
LDFLAGS= -lm -lsqlite3 `pkg-config --libs gtk+-3.0`
DB_DIR=$(HOME)/.books_list

all: books_list

books_list: main.o
	$(CC) -o $@ $^ $(LDFLAGS)

main.o: main.c
	$(CC) $(CFLAGS) -c $<

install:
	install -m 755 books_list /usr/local/bin/
	install -m 644 books_list.desktop /usr/share/applications/
	install -m 644 Figures/books_list_icon.png /usr/share/icons/hicolor/48x48/apps/
	mkdir -p $(DB_DIR)
	install -m 644 Figures/books.png $(DB_DIR)

clean:
	rm -f *.o books_list
