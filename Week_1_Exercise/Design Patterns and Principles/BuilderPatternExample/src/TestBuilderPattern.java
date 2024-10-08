public class TestBuilderPattern {
    public static void main(String[] args) {
        Computer basicComputer = new Computer.Builder()
            .setCPU("Intel i5")
            .setRAM("16GB")
            .setStorage("256GB SSD")
            .build();

        System.out.println("Basic Computer Configuration:");
        System.out.println("CPU: " + basicComputer.getCPU());
        System.out.println("RAM: " + basicComputer.getRAM());
        System.out.println("Storage: " + basicComputer.getStorage());
        Computer gamingComputer = new Computer.Builder()
            .setCPU("Intel i7")
            .setRAM("32GB")
            .setStorage("1TB SSD")
            .build();

        System.out.println("\nHigh-End Gaming Computer Configuration:");
        System.out.println("CPU: " + gamingComputer.getCPU());
        System.out.println("RAM: " + gamingComputer.getRAM());
        System.out.println("Storage: " + gamingComputer.getStorage());
    }
}
