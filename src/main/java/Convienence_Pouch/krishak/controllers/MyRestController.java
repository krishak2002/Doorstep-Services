/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package Convienence_Pouch.krishak.controllers;
import Convienence_Pouch.krishak.vmm.DBLoader;
import Convienence_Pouch.krishak.vmm.RDBMS_TO_JSON;
import Convienence_Pouch.krishak.vmm.sendWA;
import static com.mysql.cj.MysqlType.JSON;
import jakarta.servlet.http.HttpSession;
import static java.awt.SystemColor.window;
import java.io.FileOutputStream;
import java.sql.ResultSet;
import java.util.StringTokenizer;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
public class MyRestController {

    @PostMapping("/userSignup")
    String userSignup(@RequestParam String username, @RequestParam String password, @RequestParam String email, @RequestParam String phone, @RequestPart MultipartFile f1) {
        String ans = "";

        long size = f1.getSize();
        String type = f1.getContentType();
        String orig_name = f1.getOriginalFilename();

        ans = ans + "<h3>File Received</h3>" + "<br>";
        ans = ans + "SIZE: " + size + "<br>";
        ans = ans + "type: " + type + "<br>";
        ans = ans + "orig name: " + orig_name + "<br>";

        try {

            byte b[] = f1.getBytes();

            String abspath = "src/main/webapp/myuploads";

            FileOutputStream fos = new FileOutputStream(abspath + "/" + orig_name);

            fos.write(b);

            ResultSet rs = DBLoader.executeSQL("select * from users where email='" + email + "'");

            if (rs.next()) {

                ans = "</h2> Already Registered with this Email-Id </h2>";
                return ans;
            } else {
                rs.moveToInsertRow();
                rs.updateString("username", username);
                rs.updateString("email", email);
                rs.updateString("password", password);
                rs.updateString("phoneno", phone);
                rs.updateString("photo", "../myuploads/" + f1.getOriginalFilename());
                rs.insertRow();

                ans = "success";
                return ans;
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return ans;
    }

    @PostMapping("/login")
    String userlogin(@RequestParam String email, @RequestParam String password, HttpSession session) throws Exception {

        var ans = "";

        ResultSet rs = DBLoader.executeSQL("select * from users where email= '" + email + "' and password= '" + password + "'");
        if (rs.next()) {
            session.setAttribute("useremail", email);

            ans = "success";

        } else {
            ans = "fail";
        }

        return ans;
    }

    @GetMapping("/userShowService")
    String userShowService() {
        String ans = new RDBMS_TO_JSON().generateJSON("select * from services");
        return ans;
    }

    @GetMapping("/userShowAllSubService")
    String userShowAllSubService(@RequestParam String serviceid) {
        int id = Integer.parseInt(serviceid);
        String ans = new RDBMS_TO_JSON().generateJSON("select * from subservices where serviceid=" + id);

        return ans;
    }

    @GetMapping("/showAllVendors")
    String showAllVendors(@RequestParam String name) {
        String ans = new RDBMS_TO_JSON().generateJSON("select * from vendor_table where subservice='" + name + "' and status ='Approved'");

        return ans;
    }

    @GetMapping("/showVendorDescription")
    String showVendorDescription(@RequestParam String email) {

        String ans = new RDBMS_TO_JSON().generateJSON("select * from vendor_table where Vendor_Email='" + email + "'");

        return ans;
    }

    @GetMapping("/fetchdate")
    String fetchdate(@RequestParam String date, @RequestParam String email) {

        try {
            String ans = "fail";
            int starttime = 0;
            int endtime = 0;
            String slot_amount = null;
            System.out.println(date);
            ResultSet rs = DBLoader.executeSQL("select * from vendor_table where Vendor_Email='" + email + "'");
            JSONObject mainobj = new JSONObject();
            JSONArray arr = new JSONArray();
            if (rs.next()) {

                starttime = Integer.parseInt(rs.getString("start_time"));
                endtime = Integer.parseInt(rs.getString("end_time"));
                slot_amount = rs.getString("slot_amount");

            }

            for (int i = starttime; i < endtime; i++) {
                JSONObject subobj = new JSONObject();

                ResultSet rs2 = DBLoader.executeSQL("select * from booking_detail_table where start_slot ='" + i + "' and bookingid in (select bookingid from booking where date='"+date+"' and vendoremail ='"+email+"' ); ");

                if (rs2.next()) {
                    subobj.put("status", "Booked");
                    System.out.println("booked");
                } else {
                    System.out.println("available");
                    subobj.put("status", "Available");
                }

                subobj.put("start_slot", i);
                subobj.put("end_slot", i + 1);
                subobj.put("slot_amount", slot_amount);
                arr.add(subobj);

            }
            mainobj.put("ans", arr);
            // mainobj.put("slot-amount", slot_amount);
            return mainobj.toJSONString();
        } catch (Exception e) {
            return (e.toString());
        }

    }

    @GetMapping("/bookslot")
    String bookslot(@RequestParam String email, @RequestParam String date, @RequestParam String allslots, @RequestParam String total) {

        String ans = "";
        return ans;
    }

    @GetMapping("/COD")
    String COD(@RequestParam String date, @RequestParam String allslots, @RequestParam String email, @RequestParam String grandtotal, HttpSession session) {
        String ans = "";
        try {
            String phoneno = "";
            String subservice = "";
            
            String useremail = (String) session.getAttribute("useremail");
            
            ResultSet rs10 = DBLoader.executeSQL("select * from users where email = '"+useremail+"' ");
            if(rs10.next()){
                phoneno = rs10.getString("phoneno");
            }
            
            ResultSet rs11 = DBLoader.executeSQL("select * from vendor_table where Vendor_Email = '"+email+"'");
            if(rs11.next()){
                subservice = rs11.getString("subservice");
            }
                    
            
            
            ResultSet rs = DBLoader.executeSQL("select * from booking");

            rs.moveToInsertRow();
            rs.updateString("date", date);
            rs.updateString("vendoremail", email);
            rs.updateString("totalprice", grandtotal);
            rs.updateString("paymenttype", "COD");
            rs.updateString("status", "pending");
            rs.updateString("useremail", useremail);
            rs.insertRow();

            int bookingid = 0;
            ResultSet rs2 = DBLoader.executeSQL("select MAX(bookingid) as booking_detail_id from booking");
            if (rs2.next()) {
                bookingid = rs2.getInt("booking_detail_id");
                System.out.println(bookingid);
            }

            StringTokenizer st = new StringTokenizer(allslots, ",");
            while (st.hasMoreTokens()) {
                int stSlot = Integer.parseInt(st.nextToken());
                int endslot = stSlot + 1;

                System.out.println(stSlot + "*");
                System.out.println(endslot);

                ResultSet rs3 = DBLoader.executeSQL("select * from booking_detail_table");
                rs3.moveToInsertRow();
                rs3.updateInt("start_slot", stSlot);
                rs3.updateInt("end_slot", endslot);
                rs3.updateInt("bookingid", bookingid);
                rs3.insertRow();
            }
            
            sendWA.sendWA(phoneno,"Payment Done Successfull. Your Booking-id is "+bookingid+". Your Grand Total is "+grandtotal+". You have made Cash Payment. You can contact vendor on "+email+". You have Booked slots on "+date+" , and slots are "+allslots+". You have booked "+subservice+" service. ");

            return "Added";
        } catch (Exception ex) {
            return ex.toString();
        }

    }

    @GetMapping("/onlinepayment")
    String onlinepayment(@RequestParam String date, @RequestParam String allslots, @RequestParam String email, @RequestParam String grandtotal, HttpSession session) {
        String ans = "";
        try {
            
            
            String phoneno = "";
            String subservice = "";
            
            String useremail = (String) session.getAttribute("useremail");
            
            ResultSet rs10 = DBLoader.executeSQL("select * from users where email = '"+useremail+"' ");
            if(rs10.next()){
                phoneno = rs10.getString("phoneno");
            }
            
            ResultSet rs11 = DBLoader.executeSQL("select * from vendor_table where Vendor_Email = '"+email+"'");
            if(rs11.next()){
                subservice = rs11.getString("subservice");
            }
            
            
            
            
            ResultSet rs = DBLoader.executeSQL("select * from booking");
            rs.moveToInsertRow();
            rs.updateString("date", date);
            rs.updateString("vendoremail", email);
            rs.updateString("totalprice", grandtotal);
            rs.updateString("status", "pending");
            rs.updateString("paymenttype", "OnlinePayment");
            rs.updateString("useremail", useremail);
            rs.insertRow();

            int bookingid = 0;
            ResultSet rs2 = DBLoader.executeSQL("select MAX(bookingid) as booking_detail_id from booking");
            if (rs2.next()) {
                bookingid = rs2.getInt("booking_detail_id");
                System.out.println(bookingid);
            }

            StringTokenizer st = new StringTokenizer(allslots, ",");
            while (st.hasMoreTokens()) {
                int stSlot = Integer.parseInt(st.nextToken());
                int endslot = stSlot + 1;

                System.out.println(stSlot);
                System.out.println(endslot);

                ResultSet rs3 = DBLoader.executeSQL("select * from booking_detail_table");
                rs3.moveToInsertRow();
                rs3.updateInt("start_slot", stSlot);
                rs3.updateInt("end_slot", endslot);
                rs3.updateInt("bookingid", bookingid);
                rs3.insertRow();
            }
sendWA.sendWA(phoneno,"Payment Done Successfull. Your Booking-id is "+bookingid+". Your Grand Total is "+grandtotal+". You have made Online Payment. You can contact vendor on "+email+". You have Booked slots on "+date+" , and slots are "+allslots+". You have booked "+subservice+" service. ");
            return "Added";
        } catch (Exception ex) {
            return "Failed";
        }

    }

    @PostMapping("/login_service_servlet")
    String login_service_servlet() {

        String ans = new RDBMS_TO_JSON().generateJSON("select * from services");
        return ans;
    }

    @PostMapping("/login_subservice_servlet")
    String login_subservice_servlet(@RequestParam int serviceid) {

        String ans = new RDBMS_TO_JSON().generateJSON("select * from subservices where serviceid=" + serviceid);
        return ans;
    }

    @PostMapping("/vendorSignup")
    String vendorSignup(@RequestParam String username, @RequestParam String password, @RequestParam String email, @RequestParam String subservices, @RequestParam int services, @RequestParam String description, @RequestParam String start_slot, @RequestParam String end_slot, @RequestParam String slot_amount, @RequestParam String latitute, @RequestParam String longitute, @RequestParam String address,HttpSession session) {

        String ans = "";
        try {

            ResultSet rs = DBLoader.executeSQL("select * from vendor_table where Vendor_Email='" + email + "'");

            if (!rs.next()) {
                rs.moveToInsertRow();

                rs.updateInt("serviceid", services);
                rs.updateString("subservice", subservices);
                rs.updateString("Vendorname", username);
                rs.updateString("Vendor_Email", email);
                rs.updateString("Password", password);
                rs.updateString("Description", description);
                rs.updateString("Address", address);
                rs.updateString("slot_amount", slot_amount);
                rs.updateString("status", "Pending");
                rs.updateString("start_time", start_slot);
                rs.updateString("end_time", end_slot);
                rs.updateString("latitute", latitute);
                rs.updateString("longitute", longitute);

                rs.insertRow();
                session.setAttribute("vendor_user_email", email);
                ans = "success";
            } else {
                ans = "vendor_email already registered";
            }

        } catch (Exception ex) {
            return ex.toString();
        }

        return ans;

    }

    @PostMapping("/vendorLogin")
    String vendorlogin(@RequestParam String email, @RequestParam String password, HttpSession session) throws Exception {

        var ans = "";

        ResultSet rs = DBLoader.executeSQL("select * from vendor_table where Vendor_Email= '" + email + "' and Password= '" + password + "'");
        if (rs.next()) {
            session.setAttribute("vendor_user_email", email);

            ans = "success";

        } else {
            ans = "fail";
        }

        return ans;
    }

    @GetMapping("/getvendordata")
    String getvendordata(@RequestParam String email) {

        String ans = new RDBMS_TO_JSON().generateJSON("select * from vendor_table where Vendor_Email= '" + email + "'");

        return ans;
    }

    @GetMapping("/vendor_edit_profile")
    String vendor_edit_profile(@RequestParam String email, @RequestParam String name, @RequestParam String description, @RequestParam String slot_amount) {

        String ans = "";

        try {
            ResultSet rs = DBLoader.executeSQL("select * from vendor_table where Vendor_Email='" + email + "'");

            if (rs.next()) {
                
                rs.updateString("Vendorname", name);
                rs.updateString("Description", description);
                rs.updateString("slot_amount", slot_amount);
                
                rs.updateRow();
                ans = "edit successfull";
            } else {
                ans = "edit failed";
            }
        } catch (Exception ex) {
            return ex.toString();
        }
        return ans;
    }

    
     @GetMapping("/vendorShowPhotos")
    String vendorShowPhotos(@RequestParam String email) {

        String ans = new RDBMS_TO_JSON().generateJSON("select * from photo_gallery where vendor_email= '" + email + "'");

        return ans;
    }
    
     @GetMapping("/deleteVendorPhoto")
    String deleteVendorPhoto(@RequestParam int photoid) {
             
        String ans="";
        
        try{
        ResultSet rs = DBLoader.executeSQL("select * from  photo_gallery where photoid="+photoid);
         
        if(rs.next())
        {
            rs.deleteRow();
            ans="success";
            
        }
        else{
            ans="photo with photoid  not present";
        }
        
        }
        catch(Exception ex)
        {
            return ex.toString();
        }
        return ans;
    }
    
    
     @PostMapping("/vendorAddPhotos")
    String vendorAddPhotos(@RequestParam String vendoremail,@RequestPart MultipartFile photo) {
             
        String ans = "";

        long size = photo.getSize();
        String type = photo.getContentType();
        String orig_name = photo.getOriginalFilename();

        ans = ans + "<h3>File Received</h3>" + "<br>";
        ans = ans + "SIZE: " + size + "<br>";
        ans = ans + "type: " + type + "<br>";
        ans = ans + "orig name: " + orig_name + "<br>";

        try {

            byte b[] = photo.getBytes();

            String abspath = "src/main/webapp/myuploads";

            FileOutputStream fos = new FileOutputStream(abspath + "/" + orig_name);

            fos.write(b);

            ResultSet rs = DBLoader.executeSQL("select * from photo_gallery");

 
                rs.moveToInsertRow();
               
                rs.updateString("vendor_email", vendoremail);
              
                rs.updateString("photo", "../myuploads/" + photo.getOriginalFilename());
                rs.insertRow();

                ans = "success";
                return ans;
            }

        
catch (Exception ex) {
            return ex.toString();
        }

       
    }
    
     @GetMapping("/rendering_gallery")
    String rendering_gallery(@RequestParam String vendoremail) {

        String ans = new RDBMS_TO_JSON().generateJSON("select * from photo_gallery where vendor_email= '" + vendoremail + "'");

        return ans;
    }
    
     @GetMapping("/show_vendorslots_status")
    String show_vendorslots_status(@RequestParam String vendoremail) {

        String ans = new RDBMS_TO_JSON().generateJSON("select * from booking where vendoremail= '" + vendoremail + "'");

        return ans;
    }
    
      @GetMapping("/slotApproval")
    String slotApproval(@RequestParam int bookingid) {

        String ans="";
        
        try{
            
            ResultSet rs=DBLoader.executeSQL("select * from booking where bookingid="+bookingid);
            if(rs.next())
            {
                rs.updateString("status","Approved");
                rs.updateRow();
                ans="success";
            }
            else{
                ans="bookinid not present";
            }
        }
        catch(Exception ex)
        {
           return ex.toString();
        }
       
        return ans;
    }
    
     @GetMapping("/pendingslot")
    String pendingslot(@RequestParam int bookingid) {

        String ans="";
        
        try{
            
            ResultSet rs=DBLoader.executeSQL("select * from booking where bookingid="+bookingid);
            if(rs.next())
            {
                rs.updateString("status","pending");
                rs.updateRow();
                ans="success";
            }
            else{
                ans="bookinid not present";
            }
        }
        catch(Exception ex)
        {
           return ex.toString();
        }
       
        return ans;
    }
    
     @PostMapping("/admin_login")
    String admin_login(@RequestParam String email, @RequestParam String password, HttpSession session) throws Exception {

        var ans = "";

        ResultSet rs = DBLoader.executeSQL("select * from admin where email= '" + email + "' and password= '" + password + "'");
        if (rs.next()) {
            session.setAttribute("admin_user", email);

            ans = "success";

        } else {
            ans = "fail";
        }

        return ans;
    }
    
    
     @PostMapping("/addService")
    String addService(@RequestParam String service_name, @RequestParam String description,@RequestPart MultipartFile f1)  {

        var ans = "";
           
        
        try{
         long size = f1.getSize();
        String type = f1.getContentType();
        String orig_name = f1.getOriginalFilename();

        ans = ans + "<h3>File Received</h3>" + "<br>";
        ans = ans + "SIZE: " + size + "<br>";
        ans = ans + "type: " + type + "<br>";
        ans = ans + "orig name: " + orig_name + "<br>";

       

            byte b[] = f1.getBytes();

            String abspath = "src/main/webapp/myuploads";

            FileOutputStream fos = new FileOutputStream(abspath + "/" + orig_name);

            fos.write(b);
        
        
        
        ResultSet rs = DBLoader.executeSQL("select * from services");
        rs.moveToInsertRow();
        rs.updateString("categoryname", service_name);
        rs.updateString("description", description);
       
         rs.updateString("photo", "../myuploads/" + f1.getOriginalFilename());
          rs.insertRow();
         ans="success";
        }
        
        catch (Exception ex)
        {
            return ex.toString();
        }
         
         
        return ans;
    }

    
     @PostMapping("/addSubService")
    String addSubService(@RequestParam int serviceid, @RequestParam String subservicename,@RequestParam String description,@RequestPart MultipartFile f1)  {

        var ans = "";
           
        
        try{
         long size = f1.getSize();
        String type = f1.getContentType();
        String orig_name = f1.getOriginalFilename();

        ans = ans + "<h3>File Received</h3>" + "<br>";
        ans = ans + "SIZE: " + size + "<br>";
        ans = ans + "type: " + type + "<br>";
        ans = ans + "orig name: " + orig_name + "<br>";

       

            byte b[] = f1.getBytes();

            String abspath = "src/main/webapp/myuploads";

            FileOutputStream fos = new FileOutputStream(abspath + "/" + orig_name);

            fos.write(b);
        
        
        
        ResultSet rs = DBLoader.executeSQL("select * from subservices");
        rs.moveToInsertRow();
        rs.updateInt("serviceid", serviceid);
        rs.updateString("description", description);
        rs.updateString("name", subservicename);
         rs.updateString("photo", "../myuploads/" + f1.getOriginalFilename());
          rs.insertRow();
         ans="success";
        }
        
        catch (Exception ex)
        {
            return ex.toString();
        }
         
         
        return ans;
    }

    
     @PostMapping("/show_services_servlet")
    String show_services_servlet()
    {

       String ans=new RDBMS_TO_JSON().generateJSON("select * from services");

        return ans;
    }
   
    @PostMapping("/delete_services_servlet")
    String delete_services_servlet(@RequestParam int serviceid) {
             
        String ans="";
        
        try{
        ResultSet rs = DBLoader.executeSQL("select * from  services where id="+serviceid);
         
        if(rs.next())
        {
            rs.deleteRow();
            ans="success";
            
        }
        else{
            ans="Service  not present";
        }
        
        }
        catch(Exception ex)
        {
            return ex.toString();
        }
        return ans;
    }
    
    
     @PostMapping("/delete_sub_services_servlet")
    String delete_sub_services_servlet(@RequestParam String subservicename) {
             
        String ans="";
        
        try{
        ResultSet rs = DBLoader.executeSQL("select * from  subservices where name='"+subservicename+"'");
         
        if(rs.next())
        {
            rs.deleteRow();
            ans="success";
            
        }
        else{
            ans="Service  not present";
        }
        
        }
        catch(Exception ex)
        {
            return ex.toString();
        }
        return ans;
    }
     
    
     @PostMapping("/showVendors")
    String showVendors() {
             
       String ans=new RDBMS_TO_JSON().generateJSON("select * from vendor_table");
       return ans;
       
    }
    
     @PostMapping("/pending_vendors_servlet")
    String pending_vendors_servlet(@RequestParam String email) {
             
        String ans="";
        try{
            
        
       ResultSet rs=DBLoader.executeSQL("select * from vendor_table where Vendor_Email='"+email+"'");
       
       if(rs.next())
       {
           rs.updateString("status","Pending");
           rs.updateRow();
           ans="success";
       }
       else{
            ans="failed";
        }
       
        }
        
        catch(Exception ex)
        {
            return ex.toString();
        }
       return ans;
       
    }
    
    
     @PostMapping("/approve_vendors_servlet")
    String approve_vendors_servlet(@RequestParam String email) {
             
        String ans="";
        try{
            
        
       ResultSet rs=DBLoader.executeSQL("select * from vendor_table where Vendor_Email='"+email+"'");
       
       if(rs.next())
       {
         rs.updateString("status","Approved");
           rs.updateRow();
           ans="success";
       }
       else{
            ans="failed";
        }
       
        }
        
        catch(Exception ex)
        {
            return ex.toString();
        }
       return ans;
       
    }
    
    
    
    
    
     @GetMapping("/getuserdata")
    String getuserdata(@RequestParam String email) {

        String ans = new RDBMS_TO_JSON().generateJSON("select * from users where email= '" + email + "'");

        return ans;
    }
    
    
    @GetMapping("/user_edit_profile")
    String user_edit_profile(@RequestParam String email, @RequestParam String username, @RequestParam String phoneno) {

        String ans = "";

        try {
            ResultSet rs = DBLoader.executeSQL("select * from users where email='" + email + "'");

            if (rs.next()) {
                
                rs.updateString("username", username);
                rs.updateString("phoneno", phoneno);
               
                
                rs.updateRow();
                ans = "edit successfull";
            } else {
                ans = "edit failed";
            }
        } catch (Exception ex) {
            return ex.toString();
        }
        return ans;
    }

    
    
     @GetMapping("/user_change_password")
    String user_change_password(@RequestParam String email, @RequestParam String oldpassword, @RequestParam String newpassword) {

        String ans = "";

        try {
            ResultSet rs = DBLoader.executeSQL("select * from users where email='" + email + "'and password='"+oldpassword+"'");

            if (rs.next()) {
                
                rs.updateString("password", newpassword);
               
               
                
                rs.updateRow();
                ans = "success";
            } else {
                ans = "edit failed";
            }
        } catch (Exception ex) {
            return ex.toString();
        }
        return ans;
    }
    
    @GetMapping("/userAddReview_Servlet")
    public String userAddReview_Servlet(@RequestParam String comment, @RequestParam String vendoremail, @RequestParam int rating,@RequestParam String useremail, HttpSession session) {

        //String useremail = (String) session.getAttribute("email");

        System.out.println(useremail);

        try {

          
            ResultSet rs = DBLoader.executeSQL("select * from review");

            rs.moveToInsertRow();
            rs.updateString("useremail", useremail);
            rs.updateString("comment", comment);
            rs.updateString("vendoremail", vendoremail);
            rs.updateInt("rating", rating);

            rs.insertRow();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "success";
    }
    
    @GetMapping("/userShowRatingsServlet")
    String userShowRatingsServlet(@RequestParam String vendoremail) {
        
        String ans = new RDBMS_TO_JSON().generateJSON("select * from review where vendoremail='"+vendoremail+"' ");
        return ans;
    }
    
    @GetMapping("/userShowAverageRatingsServlet")
    String userShowAverageRatingsServlet(@RequestParam String vendoremail) {
        
        String ans = new RDBMS_TO_JSON().generateJSON("select avg(rating) as r1 from review where vendoremail='"+vendoremail+"' ");
        return ans;
    }
    
     @GetMapping("/viewbookings")
    String viewbookings(@RequestParam String useremail) {
        
        String ans = new RDBMS_TO_JSON().generateJSON("select * from booking where useremail='"+useremail+"'");
        return ans;
    }
    
    

}
