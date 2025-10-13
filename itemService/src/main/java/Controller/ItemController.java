package Controller;

import java.io.IOException;
import java.util.List;
import java.util.Objects;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.sql.DataSource;

import ItemServiceImpl.Impl;
import Service.ItemService;
import model.Item;
import model.ItemDetail;

@WebServlet("/ItemController")
public class ItemController extends HttpServlet {

    @Resource(name = "jdbc/connection")
    private DataSource datasource;

    private ItemService getItemService() {
        return new Impl(datasource);
    }

    private void forward(HttpServletRequest request, HttpServletResponse response, String page)
            throws ServletException, IOException {
        request.getRequestDispatcher(page).forward(request, response);
    }

    // ======= Check if User is Logged In =======
    private boolean isLoggedIn(HttpServletRequest request) {
        HttpSession session = request.getSession(false);

        if (session != null && session.getAttribute("loggedUser") != null) {
            return true;
        }

        if (request.getCookies() != null) {
            for (Cookie cookie : request.getCookies()) {
                if ("user".equals(cookie.getName()) && cookie.getValue() != null && !cookie.getValue().isEmpty()) {
                    return true;
                }
            }
        }
        return false;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ✅ Prevent unauthorized access
        if (!isLoggedIn(request)) {
            response.sendRedirect("AuthController?action=loginPage");
            return;
        }

        String action = request.getParameter("action");
        if (Objects.isNull(action)) action = "show-items";

        switch (action) {
            case "show-items":
                getAllItems(request, response);
                break;
            case "add-item":
                addItem(request, response);
                break;
            case "update-item":
                updateItem(request, response);
                break;
            case "delete-item":
                deleteItem(request, response);
                break;
            case "show-item":
                getItem(request, response);
                break;

            // ===== Item Detail Actions =====
            case "add-item-detail":
                addItemDetail(request, response);
                break;
            case "show-item-detail":
                getItemDetail(request, response);
                break;
            case "update-item-detail":
                updateItemDetail(request, response);
                break;
            case "delete-item-detail":
                deleteItemDetail(request, response);
                break;

            default:
                getAllItems(request, response);
        }
    }

    // ========== Show All Items ==========
    private void getAllItems(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ItemService service = getItemService();
        List<Item> items = service.getAllItems();

        if (items != null) {
            for (Item item : items) {
                ItemDetail detail = service.getItemDetailByItemId(item.getId());
                item.setItemDetail(detail);
            }
        }

        request.setAttribute("items1", items);
        forward(request, response, "/showItems.jsp");
    }

    // ========== Show Single Item ==========
    private void getItem(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Long id = Long.parseLong(request.getParameter("id"));
            ItemService service = getItemService();

            Item item = service.getItemById(id);
            if (item != null) {
                ItemDetail detail = service.getItemDetailByItemId(id);
                item.setItemDetail(detail);
                request.setAttribute("item1", item);
                forward(request, response, "/update-data.jsp");
            } else {
                response.sendRedirect("ItemController?action=show-items");
            }

        } catch (NumberFormatException e) {
            response.sendRedirect("ItemController?action=show-items&error=invalid_id");
        }
    }

    // ========== Add Item ==========
    private void addItem(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            String name = request.getParameter("name");
            Double price = Double.parseDouble(request.getParameter("price"));
            Double total = Double.parseDouble(request.getParameter("total"));

            Item item = new Item(name, price, total);
            getItemService().saveItem(item);

        } catch (NumberFormatException e) {
            response.sendRedirect("ItemController?action=show-items&error=invalid_number");
            return;
        }
        response.sendRedirect("ItemController?action=show-items");
    }

    // ========== Update Item ==========
    private void updateItem(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            Long id = Long.parseLong(request.getParameter("id"));
            String name = request.getParameter("name");
            Double price = Double.parseDouble(request.getParameter("price"));
            Double total = Double.parseDouble(request.getParameter("total"));

            Item item = new Item(id, name, price, total);
            getItemService().updateItem(item);
        } catch (NumberFormatException e) {
            response.sendRedirect("ItemController?action=show-items&error=invalid_number");
            return;
        }

        response.sendRedirect("ItemController?action=show-items");
    }

    // ========== Delete Item ==========
    private void deleteItem(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            Long id = Long.parseLong(request.getParameter("id"));

            if (getItemService().getItemDetailByItemId(id) != null) {
                response.sendRedirect("ItemController?action=show-items&error=details_exist");
                return;
            }

            getItemService().deleteItemById(id);
        } catch (NumberFormatException e) {
            response.sendRedirect("ItemController?action=show-items&error=invalid_id");
            return;
        }

        response.sendRedirect("ItemController?action=show-items");
    }

    // ========== Add Item Detail ==========
    private void addItemDetail(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            Long itemId = Long.parseLong(request.getParameter("itemId"));
            String description = request.getParameter("description");
            String manufacturer = request.getParameter("manufacturer");
            String warranty = request.getParameter("warranty");

            ItemDetail detail = new ItemDetail(null, itemId, description, manufacturer, warranty);
            getItemService().addItemDetail(detail);

        } catch (NumberFormatException e) {
            response.sendRedirect("ItemController?action=show-items&error=invalid_id");
            return;
        }

        response.sendRedirect("ItemController?action=show-items");
    }

    // ========== Show Item Detail for Update ==========
    private void getItemDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Long detailId = Long.parseLong(request.getParameter("detailId"));
            ItemService service = getItemService();

            ItemDetail detail = service.getItemDetailById(detailId);
            if (detail != null) {
                request.setAttribute("detail", detail);
                forward(request, response, "/update-item-detail-form.jsp");
            } else {
                response.sendRedirect("ItemController?action=show-items&error=detail_not_found");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("ItemController?action=show-items&error=invalid_id");
        }
    }

    // ========== Update Item Detail ==========
    private void updateItemDetail(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            Long detailId = Long.parseLong(request.getParameter("detailId"));
            String description = request.getParameter("description");
            String manufacturer = request.getParameter("manufacturer");
            String warranty = request.getParameter("warranty");

            ItemDetail existing = getItemService().getItemDetailById(detailId);
            if (existing != null) {
                existing.setDescription(description);
                existing.setManufacturer(manufacturer);
                existing.setWarranty(warranty);
                getItemService().updateItemDetail(existing);
            }

        } catch (NumberFormatException e) {
            response.sendRedirect("ItemController?action=show-items&error=invalid_id");
            return;
        }

        response.sendRedirect("ItemController?action=show-items");
    }

    // ========== Delete Item Detail ==========
    private void deleteItemDetail(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            Long detailId = Long.parseLong(request.getParameter("detailId"));
            getItemService().deleteItemDetailById(detailId);
        } catch (NumberFormatException e) {
            response.sendRedirect("ItemController?action=show-items&error=invalid_id");
            return;
        }

        response.sendRedirect("ItemController?action=show-items");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
