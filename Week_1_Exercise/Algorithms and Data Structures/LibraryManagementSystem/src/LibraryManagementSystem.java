import java.util.List;

public class LibraryManagementSystem<Book> {
    private List<Book> books;

    public LibraryManagementSystem(List<Book> books) {
        this.books = books;
    }
    public Book linearSearchByTitle(String title) {
        for (Book book : books) {
            if (book.getTitle().equalsIgnoreCase(title)) {
                return book;
            }
        }
        return null;
    }
    public Book findBookByTitleBinary(String title) {
        int low = 0;
        int high = books.size() - 1;
        while (low <= high) {
            int mid = low + (high - low) / 2;
            Book midBook = books.get(mid);
            int comparison = midBook.getTitle().compareToIgnoreCase(title);

            if (comparison == 0) {
                return midBook;
            } else if (comparison < 0) {
                low = mid + 1;
            } else {
                high = mid - 1;
            }
        }
        return null;
    }
    public void sortBooksByTitle() {
        books.sort((b1, b2) -> b1.getTitle().compareToIgnoreCase(b2.getTitle()));
    }
    public void displayAllBooks() {
        for (Book book : books) {
            System.out.println(book);
        }
    }
}
