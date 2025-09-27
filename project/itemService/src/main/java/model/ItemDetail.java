package model;

public class ItemDetail {
    private Long id;
    private Long itemId;
    private String description;
    private String manufacturer;
    private String warranty;

    public ItemDetail() {}

    public ItemDetail(Long id, Long itemId, String description, String manufacturer, String warranty) {
        this.id = id;
        this.itemId = itemId;
        this.description = description;
        this.manufacturer = manufacturer;
        this.warranty = warranty;
    }

    // Getters & Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public Long getItemId() { return itemId; }
    public void setItemId(Long itemId) { this.itemId = itemId; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getManufacturer() { return manufacturer; }
    public void setManufacturer(String manufacturer) { this.manufacturer = manufacturer; }

    public String getWarranty() { return warranty; }
    public void setWarranty(String warranty) { this.warranty = warranty; }
}
