
public class MVCPatternExample {
    public static void main(String[] args) {

        Student student = new Student("16", "Ram Chandra", "A");
        StudentView view = new StudentView();
        StudentController controller = new StudentController(student, view);
        controller.updateView();
        controller.setStudentName("Rama Chandra");
        controller.setStudentGrade("A+");
        controller.updateView();
    }
}
