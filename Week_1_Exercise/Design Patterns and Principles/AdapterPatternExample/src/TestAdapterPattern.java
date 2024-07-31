public class TestAdapterPattern {
    public static void main(String[] args) {
        PayPal payPal = new PayPal();
        PaymentProcessor payPalAdapter = new PayPalAdapter(payPal);
        payPalAdapter.processPayment(500.0);
        Square square = new Square();
        PaymentProcessor squareAdapter = new SquareAdapter(square);
        squareAdapter.processPayment(800.0);
    }
}