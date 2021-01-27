package tk.monsh.springbootpractice.domain;

public class Item {

    // item ID number 
    private String itemId;
    // item name 
    private String name;
    private String image;
    private String thumbnail;
    // item description 
    private String description;
    // selling price 
    private Integer price;
    // production price 
    private Integer costPrice;
    private Integer stock;
    private Boolean onSale;
    private Boolean soldOut;

    public String getItemId() {
        return itemId;
    }

    public void setItemId(String itemId) {
        this.itemId = itemId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getThumbnail() {
    	return thumbnail;
    }
    
    public void setThumbnail(String thumbnail) {
    	this.thumbnail = thumbnail;
    }
    
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Integer getCostPrice() {
        return costPrice;
    }

    public void setCostPrice(Integer costPrice) {
        this.costPrice = costPrice;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public Boolean getOnSale() {
        return onSale;
    }

    public void setOnSale(Boolean onSale) {
        this.onSale = onSale;
    }

    public Boolean getSoldOut() {
        return soldOut;
    }

    public void setSoldOut(Boolean soldOut) {
        this.soldOut = soldOut;
    }

    // Item ¸ðµ¨ º¹»ç
    public void CopyData(Item param)
    {
        this.itemId = param.getItemId();
        this.name = param.getName();
        this.image = param.getImage();
        this.description = param.getDescription();
        this.price = param.getPrice();
        this.costPrice = param.getCostPrice();
        this.stock = param.getStock();
        this.onSale = param.getOnSale();
        this.soldOut = param.getSoldOut();
    }
}