package utils;

public class JarCheck {
    public static void main(String[] args) {
        try {
            Class.forName("org.h2.Driver");
            System.out.println("✅ H2 Driver is present in classpath.");
        } catch (ClassNotFoundException e) {
            System.out.println("❌ H2 Driver NOT found in classpath.");
        }
    }
}
