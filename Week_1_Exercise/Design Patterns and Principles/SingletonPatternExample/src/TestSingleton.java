public class TestSingleton {
    public static void main(String[] args) {
        Logger logg1 = Logger.getInstance();
        Logger logg2 = Logger.getInstance();
        logg1.log("This is a log message from logger1.");
        logg2.log("This is a log message from logger2.");

        if (logg1 == logg2) {
            System.out.println("Both logger1 and logger2 are the same instance.");
        } else {
            System.out.println("logger1 and logger2 are different instances.");
        }
    }
}
