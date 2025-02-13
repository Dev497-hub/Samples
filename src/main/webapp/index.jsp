import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class TodoApp {

    static class Task {
        String description;
        boolean isCompleted;

        public Task(String description) {
            this.description = description;
            this.isCompleted = false;
        }

        public void markAsCompleted() {
            this.isCompleted = true;
        }

        @Override
        public String toString() {
            return (isCompleted ? "[Completed] " : "[Pending] ") + description;
        }
    }

    private List<Task> tasks;

    public TodoApp() {
        tasks = new ArrayList<>();
    }

    public void addTask(String description) {
        tasks.add(new Task(description));
    }

    public void markTaskAsCompleted(int index) {
        if (index >= 0 && index < tasks.size()) {
            tasks.get(index).markAsCompleted();
        } else {
            System.out.println("Invalid task index!");
        }
    }

    public void viewTasks() {
        if (tasks.isEmpty()) {
            System.out.println("No tasks available.");
            return;
        }

        for (int i = 0; i < tasks.size(); i++) {
            System.out.println(i + 1 + ". " + tasks.get(i));
        }
    }

    public static void main(String[] args) {
        TodoApp todoApp = new TodoApp();
        Scanner scanner = new Scanner(System.in);

        while (true) {
            System.out.println("\nTo-Do List Application");
            System.out.println("1. Add Task");
            System.out.println("2. Mark Task as Completed");
            System.out.println("3. View Tasks");
            System.out.println("4. Exit");
            System.out.print("Choose an option: ");

            int choice = scanner.nextInt();
            scanner.nextLine();  // Consume the newline character left by nextInt()

            switch (choice) {
                case 1:
                    System.out.print("Enter task description: ");
                    String taskDescription = scanner.nextLine();
                    todoApp.addTask(taskDescription);
                    break;

                case 2:
                    System.out.print("Enter task number to mark as completed: ");
                    int taskNumber = scanner.nextInt();
                    todoApp.markTaskAsCompleted(taskNumber - 1);
                    break;

                case 3:
                    todoApp.viewTasks();
                    break;

                case 4:
                    System.out.println("Exiting the application. Goodbye!");
                    scanner.close();
                    return;

                default:
                    System.out.println("Invalid choice, please try again.");
            }
        }
    }
}

