public class TaskNode<Task> {
    Task task;
    @SuppressWarnings("rawtypes")
    TaskNode next;

    public TaskNode(Task task) {
        this.task = task;
        this.next = null;
    }
}
