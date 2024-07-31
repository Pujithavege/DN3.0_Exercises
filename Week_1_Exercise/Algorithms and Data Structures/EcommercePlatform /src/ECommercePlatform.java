public class EcommercePlatform {
    public static void main(String[] args) {
        Product[] products = {
                new Product("1", "Laptop", "Electronics"),
                new Product("2", "Smartphone", "Electronics"),
                new Product("3", "Tablet", "Electronics"),
                new Product("4", "Headphones", "Accessories"),
                new Product("5", "Charger", "Accessories")
        };

        // Linear Search
        System.out.println("Linear Search:");
        Product foundProduct = Search.linearSearch(products, "3");
        System.out.println(foundProduct != null ? foundProduct : "Product not found");

        // Binary Search
        System.out.println("\nBinary Search:");
        foundProduct = Search.binarySearch(products, "3");
        System.out.println(foundProduct != null ? foundProduct : "Product not found");
    }
}
