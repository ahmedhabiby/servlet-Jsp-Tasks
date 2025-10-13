package Service;

import java.util.List;
import model.Item;
import model.ItemDetail;

public interface ItemService {
    // CRUD for Item
    void saveItem(Item item);
    Item getItemById(Long id);
    List<Item> getAllItems();
    void updateItem(Item item);
    void deleteItemById(Long id);

    // CRUD for ItemDetail
    void addItemDetail(ItemDetail detail);
    ItemDetail getItemDetailByItemId(Long itemId);
    ItemDetail getItemDetailById(Long detailId);
    void updateItemDetail(ItemDetail detail);
    void deleteItemDetailById(Long detailId);

    // ✅ أضفناها هنا لتعمل بدون خطأ
    void deleteItemDetailByItemId(Long itemId);
}
