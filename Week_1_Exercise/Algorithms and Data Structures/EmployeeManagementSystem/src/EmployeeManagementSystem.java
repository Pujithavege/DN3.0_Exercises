import java.util.Arrays;

public class EmployeeManagementSystem {
    private Employee[] employees;
    private int size;

    public EmployeeManagementSystem(int capacity) {
        employees = new Employee[capacity];
        size = 0;
    }

    public void addEmployee(Employee employee) {
        if (size >= employees.length) {
            employees = Arrays.copyOf(employees, employees.length * 2);
        }
        employees[size++] = employee;
    }

    public Employee searchEmployee(int employeeId) {
        for (int i = 0; i < size; i++) {
            if (employees[i].getEmployeeId() == employeeId) {
                return employees[i];
            }
        }
        return null;
    }

    public void traverseEmployees() {
        for (int i = 0; i < size; i++) {
            System.out.println(employees[i]);
        }
    }

    public boolean deleteEmployee(int employeeId) {
        for (int i = 0; i < size; i++) {
            if (employees[i].getEmployeeId() == employeeId) {
                for (int j = i; j < size - 1; j++) {
                    employees[j] = employees[j + 1];
                }
                employees[--size] = null;
                return true;
            }
        }
        return false;
    }

    public static void main(String[] args) {
        EmployeeManagementSystem ems = new EmployeeManagementSystem(5);

        ems.addEmployee(new Employee(1, "John Doe", "Developer", 60000));
        ems.addEmployee(new Employee(2, "Jane Smith", "Manager", 80000));
        ems.addEmployee(new Employee(3, "Sam Brown", "Analyst", 50000));

        System.out.println("All Employees:");
        ems.traverseEmployees();

        System.out.println("\nSearch for Employee with ID 2:");
        System.out.println(ems.searchEmployee(2));

        System.out.println("\nDeleting Employee with ID 1:");
        ems.deleteEmployee(1);
        ems.traverseEmployees();
    }
}
