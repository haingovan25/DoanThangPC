package model;

public class Product {
    private int productID;
    private int categoryID;
    private String productName;
    private String description;
    private double price;
    private String imageURL;

    // Constructors, Getters & Setters
    public Product() {}

    public Product(int productID, int categoryID, String productName, String description, double price, String imageURL) {
        this.productID = productID;
        this.categoryID = categoryID;
        this.productName = productName;
        this.description = description;
        this.price = price;
        this.imageURL = imageURL;
    }

    // Getters and setters...
    public int getProductID() { return productID; }
    public void setProductID(int productID) { this.productID = productID; }

    public int getCategoryID() { return categoryID; }
    public void setCategoryID(int categoryID) { this.categoryID = categoryID; }

    public String getProductName() { return productName; }
    public void setProductName(String productName) { this.productName = productName; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public String getImageURL() { return imageURL; }
    public void setImageURL(String imageURL) { this.imageURL = imageURL; }
}
