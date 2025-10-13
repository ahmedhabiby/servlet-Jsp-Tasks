package model;

public class Item {
    private Long id;
    private String name;
    private Double price;
    private Double total;

    // علاقة One-to-One مع ItemDetail
    private ItemDetail itemDetail;

    public Item() {}

    public Item(Long id, String name, Double price, Double total) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.total = total;
    }

    public Item(String name, Double price, Double total) {
        this.name = name;
        this.price = price;
        this.total = total;
    }

    // Getters & Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public Double getPrice() { return price; }
    public void setPrice(Double price) { this.price = price; }

    public Double getTotal() { return total; }
    public void setTotal(Double total) { this.total = total; }

    public ItemDetail getItemDetail() { return itemDetail; }
    public void setItemDetail(ItemDetail itemDetail) { this.itemDetail = itemDetail; }
}
