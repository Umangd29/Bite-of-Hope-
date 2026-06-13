package dao;

import model.User;

public class TestUserDAO {

    public static void main(String[] args) {

        User user = new User();
        user.setName("Test User");
        user.setEmail("test@gmail.com");
        user.setPassword("123");
        user.setRole("donor");

        boolean result = UserDAO.registerUser(user);

        if (result) {
            System.out.println("User inserted successfully!");
        } else {
            System.out.println("Insertion failed!");
        }
    }
}