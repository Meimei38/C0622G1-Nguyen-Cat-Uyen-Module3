package model;

public class Calculator {
    public static double calculate(double firstNumber, double secondNumber, char operator){
        switch (operator){
            case '+':
                return firstNumber+secondNumber;
            case '-':
                return firstNumber-secondNumber;
            case '*':
                return firstNumber*secondNumber;
            case '/':
                if(secondNumber ==0){
                    throw new RuntimeException("Cannot divide by zero");
                }else {
                    return firstNumber/secondNumber;
                }
            default:
                throw new RuntimeException("Invalid operator");
        }
    }
}
