public class TestProxyPattern {
    public static void main(String[] args) {
        Image image1 = new ProxyImage("image1.jpg");
        Image image2 = new ProxyImage("image2.jpg");
        System.out.println("Displaying first image:");
        image1.display();
        System.out.println("\nDisplaying second image:");
        image2.display();
        System.out.println("\nDisplaying first image again:");
        image1.display();
    }
}