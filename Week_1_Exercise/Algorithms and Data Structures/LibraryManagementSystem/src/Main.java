import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        List<Book> bookList = new ArrayList<>();
        bookList.add(new Book(1, "The Great Gatsby", "F. Scott Fitzgerald"));
        bookList.add(new Book(2, "1984", "George Orwell"));
        bookList.add(new Book(3, "To Kill a Mockingbird", "Harper Lee"));
        bookList.add(new Book(4, "The Catcher in the Rye", "J.D. Salinger"));
        bookList.add(new Book(5, "Pride and Prejudice", "Jane Austen"));

        LibraryManagementSystem lms = new LibraryManagementSystem(bookList);

        // Linear Search Example
        System.out.println("Linear Search for '1984':");
        System.out.println(lms.linearSearchByTitle("1984"));

        // Binary Search Example
        System.out.println("\nBinary Search for 'To Kill a Mockingbird':");
        System.out.println(lms.binarySearchByTitle("To Kill a Mockingbird"));
    }
}
