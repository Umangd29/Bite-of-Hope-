package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.Donation;
import util.DBConnection;

public class DonationDAO {

    //ADD DONATION
    public static boolean addDonation(Donation d) {

        boolean status = false;

        try {
            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO donations(donor_id, food_name, description, servings, expiry_time, address, status) VALUES(?,?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, d.getDonorId());
            ps.setString(2, d.getFood());
            ps.setString(3, d.getDescription());
            ps.setInt(4, d.getServings());
            ps.setString(5, d.getExpiry());
            ps.setString(6, d.getAddress());
            ps.setString(7, "available");

            int i = ps.executeUpdate();

            if (i > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    //GET ALL AVAILABLE DONATIONS
    public static List<Donation> getAllDonations() {

        List<Donation> list = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM donations WHERE status='available'";
            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Donation d = new Donation();

                d.setId(rs.getInt("id"));
                d.setDonorId(rs.getInt("donor_id"));
                d.setFood(rs.getString("food_name"));
                d.setDescription(rs.getString("description"));
                d.setServings(rs.getInt("servings"));
                d.setExpiry(rs.getString("expiry_time"));
                d.setAddress(rs.getString("address"));
                d.setStatus(rs.getString("status"));
                list.add(d);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    //GET DONATIONS BY DONOR
    public static List<Donation> getDonationsByDonor(int donorId) {

        List<Donation> list = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM donations WHERE donor_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, donorId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Donation d = new Donation();

                d.setId(rs.getInt("id"));
                d.setFood(rs.getString("food_name"));
                d.setDescription(rs.getString("description"));
                d.setServings(rs.getInt("servings"));
                d.setExpiry(rs.getString("expiry_time"));
                d.setAddress(rs.getString("address"));
                d.setStatus(rs.getString("status"));
                list.add(d);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    //CLAIM DONATION
    public static boolean claimDonation(int donationId, int ngoId) {

        boolean status = false;

        try {
            Connection con = DBConnection.getConnection();

            // Insert into claims table
            String sql1 = "INSERT INTO claims(donation_id, ngo_id) VALUES(?,?)";
            PreparedStatement ps1 = con.prepareStatement(sql1);
            ps1.setInt(1, donationId);
            ps1.setInt(2, ngoId);
            ps1.executeUpdate();

            // Update donation status
            String sql2 = "UPDATE donations SET status='claimed' WHERE id=?";
            PreparedStatement ps2 = con.prepareStatement(sql2);
            ps2.setInt(1, donationId);

            int i = ps2.executeUpdate();

            if (i > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
    
    public static boolean deleteDonation(int id) {

        boolean status = false;

        try {
            Connection con = DBConnection.getConnection();

            // only delete if still available
            String sql = "DELETE FROM donations WHERE id=? AND status='available'";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            int i = ps.executeUpdate();

            if (i > 0) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
    
    public static Donation getDonationById(int id) {

        Donation d = null;

        try {
            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM donations WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                d = new Donation();

                d.setId(rs.getInt("id"));
                d.setFood(rs.getString("food_name"));
                d.setDescription(rs.getString("description"));
                d.setServings(rs.getInt("servings"));
                d.setExpiry(rs.getString("expiry_time"));
                d.setAddress(rs.getString("address"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return d;
    }
    public static boolean updateDonation(Donation d) {

        boolean status = false;

        try {
            Connection con = DBConnection.getConnection();

            String sql = "UPDATE donations SET food_name=?, description=?, servings=?, expiry_time=?, address=? WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, d.getFood());
            ps.setString(2, d.getDescription());
            ps.setInt(3, d.getServings());
            ps.setString(4, d.getExpiry());
            ps.setString(5, d.getAddress());
            ps.setInt(6, d.getId());

            int i = ps.executeUpdate();

            if (i > 0) status = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
}