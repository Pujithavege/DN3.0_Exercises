public class TestStrategyPattern {
    public static void main(String[] args) {
        PaymentContext paymentContext = new PaymentContext();
        PaymentStrategy creditCardPayment = new CreditCardPayment("1234567890023456", "Inky Doe", "235", "12/28");
        paymentContext.setPaymentStrategy(creditCardPayment);
        paymentContext.executePayment(550.0);
        PaymentStrategy payPalPayment = new PayPalPayment("inkydoe@example.com", "helloworld");
        paymentContext.setPaymentStrategy(payPalPayment);
        paymentContext.executePayment(300.0);
    }
}
