CC=gcc
CFLAGS=-Wall `pkg-config --cflags gtk+-3.0`
LIBS=`pkg-config --libs gtk+-3.0`
DB_DIR=/var/lib/books_list

all: books_list

books_list: main.o
	$(CC) -o books_list main.o $(LIBS)

main.o: main.c
	$(CC) $(CFLAGS) -c main.c

install:
	install -m 755 books_list /usr/local/bin/
	install -m 644 books_list.desktop /usr/share/applications/
	install -m 644 Figures/books_list_icon.png /usr/share/icons/hicolor/48x48/apps/
	install -d $(DB_DIR)

clean:
	rm -f *.o books_list
