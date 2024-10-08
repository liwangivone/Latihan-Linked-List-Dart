class Book {
  String title;
  String author;
  Book? next; // Tautan ke buku berikutnya

  Book(this.title, this.author);
}

class BookLinkedList {
  Book? head; // Buku pertama di rak

  // Menambahkan buku di akhir rak
  void addBook(String title, String author) {
    Book newBook = Book(title, author);
    if (head == null) {
      head = newBook;
      return;
    }
    Book current = head!;
    while (current.next != null) {
      current = current.next!;
    }
    current.next = newBook;
  }

  // Menampilkan semua buku
  void displayBooks() {
    Book? current = head;
    while (current != null) {
      print('Judul: ${current.title}, Penulis: ${current.author}');
      current = current.next;
    }
  }

  // Menghapus buku berdasarkan judul
  void deleteBook(String title) {
    if (head == null) return;

    // Jika buku yang akan dihapus adalah buku pertama
    if (head!.title == title) {
      head = head!.next;
      return;
    }

    Book? current = head;
    Book? previous;

    while (current != null && current.title != title) {
      previous = current;
      current = current.next;
    }

    // Jika buku tidak ditemukan
    if (current == null) return;

    previous!.next = current.next; // Menghapus buku
  }
}

void main() {
  BookLinkedList bookList = BookLinkedList();

  bookList.addBook('Harry Potter', 'J.K. Rowling');
  bookList.addBook('The Hobbit', 'J.R.R. Tolkien');
  bookList.addBook('Pride and Prejudice', 'Jane Austen');

  print("Rak Buku:");
  bookList.displayBooks();

  bookList.deleteBook('The Hobbit');
  print("\nSetelah menghapus 'The Hobbit':");
  bookList.displayBooks();
}
