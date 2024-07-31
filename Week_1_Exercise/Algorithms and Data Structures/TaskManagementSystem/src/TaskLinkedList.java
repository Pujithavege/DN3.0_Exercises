public class TaskLinkedList<TaskNode, Task> {
    private TaskNode head;

    public TaskLinkedList() {
        head = null;
    }

    public void addTask(Task task) {
        TaskNode newNode = new TaskNode(task);
        if (head == null) {
            head = newNode;
        } else {
            TaskNode current = head;
            while (current.next != null) {
                current = current.next;
            }
            current.next = newNode;
        }
    }

    public Task searchTask(int taskId) {
        TaskNode current = head;
        while (current != null) {
            if (current.task.getTaskId() == taskId) {
                return current.task;
            }
            current = current.next;
        }
        return null;
    }

    public void traverseTasks() {
        TaskNode current = head;
        while (current != null) {
            System.out.println(current.task);
            current = current.next;
        }
    }

    public boolean deleteTask(int taskId) {
        if (head == null) {
            return false;
        }

        if (head.task.getTaskId() == taskId) {
            head = head.next;
            return true;
        }

        TaskNode current = head;
        while (current.next != null) {
            if (current.next.task.getTaskId() == taskId) {
                current.next = current.next.next;
                return true;
            }
            current = current.next;
        }
        return false;
    }

    public static void main(String[] args) {
        TaskLinkedList taskList = new TaskLinkedList();

        taskList.addTask(new Task(1, "Task One", "Pending"));
        taskList.addTask(new Task(2, "Task Two", "Completed"));
        taskList.addTask(new Task(3, "Task Three", "In Progress"));

        System.out.println("All Tasks:");
        taskList.traverseTasks();

        System.out.println("\nSearch for Task with ID 2:");
        System.out.println(taskList.searchTask(2));

        System.out.println("\nDeleting Task with ID 1:");
        taskList.deleteTask(1);
        taskList.traverseTasks();
    }
}
