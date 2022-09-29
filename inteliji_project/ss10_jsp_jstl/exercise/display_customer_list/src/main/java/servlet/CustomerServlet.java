package servlet;

import model.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList = new ArrayList<>();
        customerList.add(new Customer(1, "Mai Văn Hoàn", "1983-08-20", "Hà Nội","img\\142774.jpg"));
        customerList.add(new Customer(2, "Nguyễn Văn Nam", "1983-08-21", "Bắc Giang","img\\cat-217679.jpg"));
        customerList.add(new Customer(3, "Nguyễn Thái Hòa", "1983-08-22", "Nam Định","img\\download.jfif"));
        customerList.add(new Customer(4, "Trần Đăng Khoa", "1983-08-17", "Hà Tây","img\\download (1).jfif"));
        customerList.add(new Customer(5, "Nguyễn  Đình Thi", "1983-08-19", "Hà Nội","img\\photo-1611915387288-fd8d2f5f928b.jfif"));
        request.setAttribute("customerList", customerList);
        request.getRequestDispatcher("customer.jsp").forward(request,response);
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
    }
}
