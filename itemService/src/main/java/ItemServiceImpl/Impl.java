package ItemServiceImpl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.sql.DataSource;

import Service.ItemService;
import model.Item;
import model.ItemDetail;

public class Impl implements ItemService {

    private final DataSource datasource;

    public Impl(DataSource datasource) {
        this.datasource = datasource;
    }

    // ======================================================
    // ==================== ITEM CRUD =======================
    // ======================================================

    @Override
    public void saveItem(Item item) {
        String sql = "INSERT INTO item (NAME, PRICE, TOTAL_NUMBER) VALUES (?, ?, ?)";
        try (Connection connection = datasource.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, item.getName());
            ps.setDouble(2, item.getPrice());
            ps.setDouble(3, item.getTotal());
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error saving item: " + e.getMessage());
        }
    }

    @Override
    public Item getItemById(Long id) {
        String sql = "SELECT * FROM item WHERE ID = ?";
        try (Connection connection = datasource.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setLong(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new Item(
                        rs.getLong("ID"),
                        rs.getString("NAME"),
                        rs.getDouble("PRICE"),
                        rs.getDouble("TOTAL_NUMBER")
                );
            }
        } catch (SQLException e) {
            System.out.println("Error getting item by id: " + e.getMessage());
        }
        return null;
    }

    @Override
    public List<Item> getAllItems() {
        String sql = "SELECT * FROM item";
        List<Item> items = new ArrayList<>();

        try (Connection connection = datasource.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Item item = new Item(
                        rs.getLong("ID"),
                        rs.getString("NAME"),
                        rs.getDouble("PRICE"),
                        rs.getDouble("TOTAL_NUMBER")
                );
                items.add(item);
            }
        } catch (SQLException e) {
            System.out.println("Error fetching items: " + e.getMessage());
        }
        return items;
    }

    @Override
    public void updateItem(Item item) {
        String sql = "UPDATE item SET NAME = ?, PRICE = ?, TOTAL_NUMBER = ? WHERE ID = ?";
        try (Connection connection = datasource.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, item.getName());
            ps.setDouble(2, item.getPrice());
            ps.setDouble(3, item.getTotal());
            ps.setLong(4, item.getId());
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error updating item: " + e.getMessage());
        }
    }

    @Override
    public void deleteItemById(Long id) {
        String sql = "DELETE FROM item WHERE ID = ?";
        try (Connection connection = datasource.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setLong(1, id);
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error deleting item: " + e.getMessage());
        }
    }

    // ======================================================
    // ================= ITEM DETAIL CRUD ===================
    // ======================================================

    @Override
    public void addItemDetail(ItemDetail detail) {
        String sql = "INSERT INTO item_detail (ITEM_ID, DESCRIPTION, MANUFACTURER, WARRANTY) VALUES (?, ?, ?, ?)";
        try (Connection connection = datasource.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setLong(1, detail.getItemId());
            ps.setString(2, detail.getDescription());
            ps.setString(3, detail.getManufacturer());
            ps.setString(4, detail.getWarranty());
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error adding item detail: " + e.getMessage());
        }
    }

    @Override
    public void updateItemDetail(ItemDetail detail) {
        String sql = "UPDATE item_detail SET DESCRIPTION = ?, MANUFACTURER = ?, WARRANTY = ? WHERE ID = ?";
        try (Connection connection = datasource.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, detail.getDescription());
            ps.setString(2, detail.getManufacturer());
            ps.setString(3, detail.getWarranty());
            ps.setLong(4, detail.getId());
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error updating item detail: " + e.getMessage());
        }
    }

    @Override
    public void deleteItemDetailByItemId(Long itemId) {
        String sql = "DELETE FROM item_detail WHERE ITEM_ID = ?";
        try (Connection connection = datasource.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setLong(1, itemId);
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error deleting item detail: " + e.getMessage());
        }
    }

    @Override
    public void deleteItemDetailById(Long detailId) {
        String sql = "DELETE FROM item_detail WHERE ID = ?";
        try (Connection connection = datasource.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setLong(1, detailId);
            ps.executeUpdate();

        } catch (SQLException e) {
            System.out.println("Error deleting item detail by id: " + e.getMessage());
        }
    }

    @Override
    public ItemDetail getItemDetailByItemId(Long itemId) {
        String sql = "SELECT * FROM item_detail WHERE ITEM_ID = ?";
        try (Connection connection = datasource.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setLong(1, itemId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new ItemDetail(
                        rs.getLong("ID"),
                        rs.getLong("ITEM_ID"),
                        rs.getString("DESCRIPTION"),
                        rs.getString("MANUFACTURER"),
                        rs.getString("WARRANTY")
                );
            }
        } catch (SQLException e) {
            System.out.println("Error fetching item detail by itemId: " + e.getMessage());
        }
        return null;
    }

    @Override
    public ItemDetail getItemDetailById(Long detailId) {
        String sql = "SELECT * FROM item_detail WHERE ID = ?";
        try (Connection connection = datasource.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setLong(1, detailId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new ItemDetail(
                        rs.getLong("ID"),
                        rs.getLong("ITEM_ID"),
                        rs.getString("DESCRIPTION"),
                        rs.getString("MANUFACTURER"),
                        rs.getString("WARRANTY")
                );
            }
        } catch (SQLException e) {
            System.out.println("Error fetching item detail by detailId: " + e.getMessage());
        }
        return null;
    }
}
