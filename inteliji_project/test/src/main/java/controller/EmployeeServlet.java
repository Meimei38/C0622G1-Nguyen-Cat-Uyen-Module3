package controller;

import model.employee.Employee;
import model.employee.EmployeeDto;
import service.employee.IEmployeeService;
import service.employee.impl.EmployeeService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "EmployeeServlet", urlPatterns = "/employee")
public class EmployeeServlet extends HttpServlet {
    private IEmployeeService employeeService = new EmployeeService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "add":

                    addEmployee(request, response);

                    break;
                case "edit":
                    editEmployee(request, response);
                    break;
                case "search":
                    searchEmployee(request, response);
                    break;
                default:
                    findAll(request, response);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    private void searchEmployee(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        String searchName = request.getParameter("searchName");
        String searchDateOfBirth = request.getParameter("searchDateOfBirth");
        String searchPositionId = request.getParameter("searchPositionId");
        List<Employee> employeeList = employeeService.searchEmployee(searchName,searchDateOfBirth,searchPositionId);
        Map<Integer, String> positionMap = employeeService.selectAllPosition();
        Map<Integer, String> educationDegreeMap = employeeService.selectAllEducationDegree();
        Map<Integer, String> divisionMap = employeeService.selectAllDivision();
        request.setAttribute("employeeList", employeeList);
        request.setAttribute("positionMap", positionMap);
        request.setAttribute("educationDegreeMap", educationDegreeMap);
        request.setAttribute("divisionMap", divisionMap);
        try {
            request.getRequestDispatcher("employee/list.jsp").forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void addEmployee(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        // Th??m v??o ????? hi???n th??? position, division, edu
        Map<Integer, String> positionMap = employeeService.selectAllPosition();
        Map<Integer, String> educationDegreeMap = employeeService.selectAllEducationDegree();
        Map<Integer, String> divisionMap = employeeService.selectAllDivision();
        //
        String name = request.getParameter("employeeName");
        String dateOfBirth = request.getParameter("dateOfBirth");
        String idCard = request.getParameter("idCard");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int positionId = Integer.parseInt(request.getParameter("position"));
        int educationDegreeId = Integer.parseInt(request.getParameter("educationDegree"));
        int divisionId = Integer.parseInt(request.getParameter("division"));
        Employee employee = new Employee(name, dateOfBirth, idCard, salary, phoneNumber, email, address, positionId, educationDegreeId, divisionId);

        Map<String, String> map = employeeService.addEmployee(employee);
        if (map.size() != 0) {
            request.setAttribute("mess", "Th??m m???i kh??ng th??nh c??ng. Th??? l???i!");
            request.setAttribute("map", map);
            request.setAttribute("employee", employee);
            //
            request.setAttribute("positionMap", positionMap);
            request.setAttribute("educationDegreeMap", educationDegreeMap);
            request.setAttribute("divisionMap", divisionMap);
            //
            request.getRequestDispatcher("employee/create.jsp").forward(request,response);
        } else {
            request.setAttribute("mess", "Th??m m???i th??nh c??ng!");
            request.getRequestDispatcher("employee?action").forward(request,response);
        }

    }

    private void editEmployee(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        // Th??m v??o ????? hi???n th??? position, division, edu

        Map<Integer, String> positionMap = employeeService.selectAllPosition();
        Map<Integer, String> educationDegreeMap = employeeService.selectAllEducationDegree();
        Map<Integer, String> divisionMap = employeeService.selectAllDivision();
        //
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String dateOfBirth = request.getParameter("dateOfBirth");
        String idCard = request.getParameter("idCard");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int positionId = Integer.parseInt(request.getParameter("position"));
        int educationDegreeId = Integer.parseInt(request.getParameter("educationDegree"));
        int divisionId = Integer.parseInt(request.getParameter("division"));
        Employee employee = new Employee(id, name, dateOfBirth, idCard, salary, phoneNumber, email, address, positionId, educationDegreeId, divisionId);
        Map<String, String> map = employeeService.editEmployee(employee);
        if (map.size() != 0) {
            request.setAttribute("mess", "S???a kh??ng th??nh c??ng. Th??? l???i!");
            request.setAttribute("map", map);
            request.setAttribute("employee", employee);
            //
            request.setAttribute("positionMap", positionMap);
            request.setAttribute("educationDegreeMap", educationDegreeMap);
            request.setAttribute("divisionMap", divisionMap);
            //
            request.getRequestDispatcher("employee/edit.jsp").forward(request,response);
        } else {
            request.setAttribute("mess", "S???a th??nh c??ng");
            request.getRequestDispatcher("employee?action").forward(request,response);
        }

    }


    private void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Employee> employeeList = employeeService.findAll();
        Map<Integer, String> positionMap = employeeService.selectAllPosition();
        Map<Integer, String> educationDegreeMap = employeeService.selectAllEducationDegree();
        Map<Integer, String> divisionMap = employeeService.selectAllDivision();
        request.setAttribute("employeeList", employeeList);
        request.setAttribute("positionMap", positionMap);
        request.setAttribute("educationDegreeMap", educationDegreeMap);
        request.setAttribute("divisionMap", divisionMap);
        request.getRequestDispatcher("employee/list.jsp").forward(request, response);
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "list":
                findAll(request, response);
                break;
            case "add":
                showAddForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                try {
                    delete(request, response);
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                break;
            default:
                findAll(request, response);

        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        employeeService.deleteEmployee(id);

        List<Employee> employeeList = employeeService.findAll();
        request.setAttribute("employeeList", employeeList);
        request.setAttribute("mess", "X??a th??nh c??ng");
        RequestDispatcher dispatcher = request.getRequestDispatcher("employee?action");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee existingEmployee = employeeService.findById(id);
        Map<Integer, String> positionMap = employeeService.selectAllPosition();
        Map<Integer, String> educationDegreeMap = employeeService.selectAllEducationDegree();
        Map<Integer, String> divisionMap = employeeService.selectAllDivision();
        request.setAttribute("positionMap", positionMap);
        request.setAttribute("educationDegreeMap", educationDegreeMap);
        request.setAttribute("divisionMap", divisionMap);
        request.setAttribute("employee", existingEmployee);
        RequestDispatcher dispatcher = request.getRequestDispatcher("employee/edit.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<Integer, String> positionMap = employeeService.selectAllPosition();
        Map<Integer, String> educationDegreeMap = employeeService.selectAllEducationDegree();
        Map<Integer, String> divisionMap = employeeService.selectAllDivision();
        request.setAttribute("positionMap", positionMap);
        request.setAttribute("educationDegreeMap", educationDegreeMap);
        request.setAttribute("divisionMap", divisionMap);
        request.getRequestDispatcher("employee/create.jsp").forward(request, response);

    }

}
