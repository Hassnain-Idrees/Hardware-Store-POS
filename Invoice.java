package com.hardwarestore.hardwarestore.All_Classes;


public class Invoice {
    private int invoiceId;
    private int productId;
    private String name;
    private int quantity;
    private String unit;
    private double gst;
    private double total;

    // Constructors
    public Invoice() {
    }

    public Invoice(int productId, String name, int quantity, String unit, double gst, double total) {
        this.productId = productId;
        this.name = name;
        this.quantity = quantity;
        this.unit = unit;
        this.gst = gst;
        this.total = total;
    }

    // Getters and setters
    public int getInvoiceId() {
        return invoiceId;
    }

    public void setInvoiceId(int invoiceId) {
        this.invoiceId = invoiceId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public double getGst() {
        return gst;
    }

    public void setGst(double gst) {
        this.gst = gst;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    // toString method
    @Override
    public String toString() {
        return "Invoice{" +
                "invoiceId=" + invoiceId +
                ", productId=" + productId +
                ", name='" + name + '\'' +
                ", quantity=" + quantity +
                ", unit='" + unit + '\'' +
                ", gst=" + gst +
                ", total=" + total +
                '}';
    }
}