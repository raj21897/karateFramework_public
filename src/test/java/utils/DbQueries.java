package utils;
public class DbQueries {

    public static String getStudentById(int id) {
        return "SELECT * FROM STUDENTS WHERE STUDENT_ID = " + id;
    }
    public static String getStudentByFullName(String fullName) {
        return "SELECT * FROM STUDENTS WHERE FULL_NAME = '" + fullName + "'";
    }

    public static String getAllActiveStudents() {
        return "SELECT * FROM STUDENTS WHERE IS_ACTIVE = true";
    }

    public static String getTopper() {
        return "SELECT * FROM STUDENTS ORDER BY CGPA DESC LIMIT 1";
    }

    // Add more queries as needed
}
