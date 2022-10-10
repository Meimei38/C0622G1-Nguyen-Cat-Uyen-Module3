package service.validation;

public class Validation {
    private static final String REGEX_EMAIL = "^[([A-Za-z]+)([0-9]*)]{5,30}@[a-z]+(\\.[a-z]+)$";
    private static final String REGEX_NAME = "\\p{Lu}\\p{Ll}+(\\s\\p{Lu}\\p{Ll}+)*";
    private static final String PHONE_NUMBER_REGEX = "^09[01]\\d{7}|[(]84[)][+]9[01]\\d{7}$";

    public static boolean checkEmail(String email){
        return email.matches(REGEX_EMAIL);
    }
    public static boolean checkName(String name){
        return name.matches(REGEX_NAME);
    }
    public static boolean checkPhone(String phone){
        return phone.matches(PHONE_NUMBER_REGEX);
    }
}
