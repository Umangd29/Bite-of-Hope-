package model;

public class Donation {


private int donorId;
private String food;
private String description;
private int servings;
private String expiry;
private String address;

private int id;
public int getId() { return id; }
public void setId(int id) { this.id = id; }

private String status;
public String getStatus() {
    return status;
}
public void setStatus(String status) {
    this.status = status;
}

public int getDonorId() {
    return donorId;
}

public void setDonorId(int donorId) {
    this.donorId = donorId;
}

public String getFood() {
    return food;
}

public void setFood(String food) {
    this.food = food;
}

public String getDescription() {
    return description;
}

public void setDescription(String description) {
    this.description = description;
}

public int getServings() {
    return servings;
}

public void setServings(int servings) {
    this.servings = servings;
}

public String getExpiry() {
    return expiry;
}

public void setExpiry(String expiry) {
    this.expiry = expiry;
}

public String getAddress() {
    return address;
}

public void setAddress(String address) {
    this.address = address;
}


}
