import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;

@WebServlet(name = "DiscountServlet",urlPatterns = "/discount")
public class DiscountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    double price = Double.parseDouble(request.getParameter("price"));
        BigDecimal finalPrice = new BigDecimal(price);
    double percent = Double.parseDouble(request.getParameter("percent"));
    BigDecimal discount = finalPrice.multiply(BigDecimal.valueOf(percent)).multiply(BigDecimal.valueOf(0.01));
    request.setAttribute("discount_amount",discount);
    request.getRequestDispatcher("index.jsp").forward(request,response);
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
