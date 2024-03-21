package DB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@WebService(serviceName = "NewWebService")
public class NewWebService {

    ConnectionClass con = new ConnectionClass();

    @WebMethod(operationName = "LoginDetails")
    public String LoginDetails(@WebParam(name = "email") String email, @WebParam(name = "password") String password) {

        String sel = "select * from tbl_user where user_email='" + email + "' and user_password='" + password + "'";
        ResultSet rs = con.selectCommand(sel);
        System.out.println(sel);
        JSONArray j = new JSONArray();

        try {
            if (rs.next()) {
                JSONObject jo = new JSONObject();
                jo.put("id", rs.getString("user_id"));
                jo.put("name", rs.getString("user_name"));
                j.put(jo);
            }
        } catch (SQLException | JSONException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "MyProfile")
    public String MyProfile(@WebParam(name = "id") String id) {
        String sel = "select * from tbl_user where user_id='" + id + "'";
        ResultSet rs = con.selectCommand(sel);
        System.out.println(sel);
        JSONArray j = new JSONArray();

        try {
            if (rs.next()) {
                JSONObject jo = new JSONObject();
                jo.put("id", rs.getString("user_id"));
                jo.put("name", rs.getString("user_name"));
                jo.put("contact", rs.getString("user_contact"));
                jo.put("email", rs.getString("user_email"));
                jo.put("address", rs.getString("user_address"));
                jo.put("aadhar", rs.getString("user_aadhar_number"));
                jo.put("dob", rs.getString("user_dob"));
                String dob = rs.getString("user_dob");
                String[] parts = dob.split("-");
                String day = parts[2];      // "28"
                String month = parts[1];    // "10"
                String year = parts[0];     // "1999"
                jo.put("day", day);
                jo.put("month", month);
                jo.put("year", year);
                j.put(jo);
            }
        } catch (SQLException | JSONException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "getPassword")
    public String getPassword(@WebParam(name = "id") String id) {

        String password = "";

        String sel = "select * from tbl_user where user_id='" + id + "'";
        ResultSet rs = con.selectCommand(sel);
        try {
            if (rs.next()) {
                password = rs.getString("user_password");
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);

        }

        return password;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "ChangePassword")
    public String ChangePassword(@WebParam(name = "id") String id, @WebParam(name = "password") String password) {
        String check = "Password Not Updated";

        String upQry = "update tbl_user set "
                + "user_password='" + password + "' "
                + "where user_id='" + id + "'";
        if (con.executeCommand(upQry)) {
            check = "Password Updated";
        }
        return check;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "GetState")
    public String GetState() {
        //TODO write your implementation code here:
        String sel = "select * from tbl_state ";
        ResultSet rs = con.selectCommand(sel);
        System.out.println(sel);
        JSONArray j = new JSONArray();
        try {
            while (rs.next()) {
                JSONObject jo = new JSONObject();
                {
                    try {
                        jo.put("sid", rs.getString("state_id"));
                        jo.put("sname", rs.getString("state_name"));
                        j.put(jo);
                    } catch (JSONException ex) {
                        Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(j.toString());
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "GetDistrict")
    public String GetDistrict(@WebParam(name = "stateid") String stateid) {
        String sel = "select * from tbl_district where state_id='" + stateid + "'";
        ResultSet rs = con.selectCommand(sel);
        System.out.println(sel);
        JSONArray j = new JSONArray();
        try {
            while (rs.next()) {
                JSONObject jo = new JSONObject();
                {
                    try {
                        jo.put("did", rs.getString("district_id"));
                        jo.put("dname", rs.getString("district_name"));
                        j.put(jo);
                    } catch (JSONException ex) {
                        Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(j.toString());
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "GetPlace")
    public String GetPlace(@WebParam(name = "districtid") String districtid) {
        String sel = "select * from tbl_location where district_id='" + districtid + "'";
        ResultSet rs = con.selectCommand(sel);
        System.out.println(sel);
        JSONArray j = new JSONArray();
        try {
            while (rs.next()) {
                JSONObject jo = new JSONObject();
                {
                    try {
                        jo.put("lid", rs.getString("location_id"));
                        jo.put("lname", rs.getString("location_name"));
                        j.put(jo);
                    } catch (JSONException ex) {
                        Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(j.toString());
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "GetRequest")
    public String GetRequest(@WebParam(name = "id") String id) {
        //TODO write your implementation code here:
        return null;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "Viewcomplaint")
    public String Viewcomplaint(@WebParam(name = "id") String id) {
        //TODO write your implementation code here:
        String sel = "select * from tbl_complaint c inner join tbl_complainttype t on c.complainttype_id=t.complainttype_id where user_id='" + id + "' order by complaint_id desc";
        ResultSet rs = con.selectCommand(sel);
        System.out.println(sel);
        JSONArray j = new JSONArray();
        try {
            while (rs.next()) {
                JSONObject jo = new JSONObject();
                {

                    String reply = "Not yet Replyed";
                    if (rs.getString("complaint_reply") != "") {
                        reply = rs.getString("complaint_reply");
                    }
                    try {
                        jo.put("type", rs.getString("complainttype_name"));
                        jo.put("content", rs.getString("complaint_content"));
                        jo.put("reply", reply);
                        j.put(jo);
                    } catch (JSONException ex) {
                        Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(j.toString());
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "MyRequest")
    public String MyRequest(@WebParam(name = "id") String id) {
        //TODO write your implementation code here:
        String sel = "select * from tbl_transport_request t inner join tbl_company c on c.company_id=t.company_id where  user_id='" + id + "' and transport_request_status <= 3 order by transport_request_id desc";
        ResultSet rs = con.selectCommand(sel);
        System.out.println(sel);
        JSONArray j = new JSONArray();
        String url_of_logo = ":8084/GoBetween/Assets/Files/CompanyLogo/";
        try {
            while (rs.next()) {
                JSONObject jo = new JSONObject();
                {
                    try {
                        jo.put("company", rs.getString("company_name"));
                        jo.put("logo", rs.getString("company_logo"));
                        jo.put("time", rs.getString("transport_request_time"));
                        jo.put("logourl", url_of_logo);
                        j.put(jo);
                    } catch (JSONException ex) {
                        Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(j.toString());
        return j.toString();
    }

        //TODO write your implementation code here:
    /**
     * Web service operation
     */
    @WebMethod(operationName = "Search")
    public String Search(@WebParam(name = "did") String did, @WebParam(name = "lid") String lid, @WebParam(name = "sid") String sid) {
        System.out.println(did);
        System.out.println(lid);
        System.out.println(sid);
        String sel = "select * from tbl_company c inner join tbl_location l on l.location_id=c.location_id inner join tbl_district d on d.district_id=l.district_id inner join tbl_state s on s.state_id=d.state_id where true and";
        if (!lid.equals("0")) {
            sel += " l.location_id='" + lid + "'";
        }

        if (!did.equals("0")) {
            sel += " d.district_id='" + did + "'";
        }

        if (!sid.equals("0")) {
            sel += " s.state_id='" + sid + "'";
        }

        ResultSet rs = con.selectCommand(sel);
        System.out.println(sel);
        JSONArray j = new JSONArray();
        String url_of_logo = ":8084/GoBetween/Assets/Files/CompanyLogo/";
        try {
            while (rs.next()) {
                JSONObject jo = new JSONObject();
                {
                    try {
                        jo.put("cid", rs.getString("company_id"));
                        jo.put("company", rs.getString("company_name"));
                        jo.put("logo", rs.getString("company_logo"));
                        jo.put("logourl", url_of_logo);
                        j.put(jo);
                    } catch (JSONException ex) {
                        Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(j.toString());

        return j.toString();
//        return "";
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "Submitfeedback")
    public String Submitfeedback(@WebParam(name = "id") String id, @WebParam(name = "message") String message) {
        //TODO write your implementation code here:
        String insert = "insert into tbl_feedback(feedback_date,feedback_content,user_id) values(curdate(),'" + message + "','" + id + "')";
        con.executeCommand(insert);
        return null;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "Complainttype")
    public String Complainttype() {
        //TODO write your implementation code here:
        String sel = "select * from tbl_complainttype ";
        ResultSet rs = con.selectCommand(sel);
        System.out.println(sel);
        JSONArray j = new JSONArray();
        try {
            while (rs.next()) {
                JSONObject jo = new JSONObject();
                {
                    try {
                        jo.put("cid", rs.getString("complainttype_id"));
                        jo.put("cname", rs.getString("complainttype_name"));
                        j.put(jo);
                    } catch (JSONException ex) {
                        Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(j.toString());
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "GetCategory")
    public String GetCategory() {
        //TODO write your implementation code here:
        String sel = "select * from tbl_category ";
        ResultSet rs = con.selectCommand(sel);
        System.out.println(sel);
        JSONArray j = new JSONArray();
        try {
            while (rs.next()) {
                JSONObject jo = new JSONObject();
                {
                    try {
                        jo.put("cid", rs.getString("category_id"));
                        jo.put("cname", rs.getString("category_name"));
                        j.put(jo);
                    } catch (JSONException ex) {
                        Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(j.toString());
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "GettoState")
    public String GettoState() {
        //TODO write your implementation code here:
        String sel = "select * from tbl_state ";
        ResultSet rs = con.selectCommand(sel);
        System.out.println(sel);
        JSONArray j = new JSONArray();
        try {
            while (rs.next()) {
                JSONObject jo = new JSONObject();
                {
                    try {
                        jo.put("tsid", rs.getString("state_id"));
                        jo.put("tsname", rs.getString("state_name"));
                        j.put(jo);
                    } catch (JSONException ex) {
                        Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(j.toString());
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "GettoDistrict")
    public String GettoDistrict(@WebParam(name = "stateid") String stateid) {
        String sel = "select * from tbl_district where state_id='" + stateid + "'";
        ResultSet rs = con.selectCommand(sel);
        System.out.println(sel);
        JSONArray j = new JSONArray();
        try {
            while (rs.next()) {
                JSONObject jo = new JSONObject();
                {
                    try {
                        jo.put("tdid", rs.getString("district_id"));
                        jo.put("tdname", rs.getString("district_name"));
                        j.put(jo);
                    } catch (JSONException ex) {
                        Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(j.toString());
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "GettoPlace")
    public String GettoPlace(@WebParam(name = "districtid") String districtid) {
        String sel = "select * from tbl_location where district_id='" + districtid + "'";
        ResultSet rs = con.selectCommand(sel);
        System.out.println(sel);
        JSONArray j = new JSONArray();
        try {
            while (rs.next()) {
                JSONObject jo = new JSONObject();
                {
                    try {
                        jo.put("tlid", rs.getString("location_id"));
                        jo.put("tlname", rs.getString("location_name"));
                        j.put(jo);
                    } catch (JSONException ex) {
                        Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(j.toString());
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "EditProfile")
    public String EditProfile(@WebParam(name = "id") String id, @WebParam(name = "name") String name, @WebParam(name = "contact") String contact, @WebParam(name = "email") String email, @WebParam(name = "aadhar") String aadhar, @WebParam(name = "day") String day,@WebParam(name = "month") String month,@WebParam(name = "year") String year, @WebParam(name = "address") String address) {
        //TODO write your implementation code here:
        String check = "Profile Not Updated";

        String upQry = "update tbl_user set "
                + "user_name='" + name + "',user_contact='" + contact + "',user_email='" + email + "',user_aadhar_number='" + aadhar + "',user_dob='" + year+"-"+month+"-"+day + "',user_address='" + address + "'"
                + "where user_id='" + id + "'";
        if (con.executeCommand(upQry)) {
            check = "Profile Updated";
        }
        return check;
    }
     /**
     * Web service operation
     */
    @WebMethod(operationName = "Submitcomplaint")
    public String Submitcomplaint(@WebParam(name = "id") String id, @WebParam(name = "message") String message, @WebParam(name = "type") String type) {
        //TODO write your implementation code here:
        String insert = "insert into tbl_complaint(complaint_date,complaint_content,complainttype_id,user_id) values(curdate(),'" + message + "','" + type + "','" + id + "')";
        con.executeCommand(insert);
        return null;
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "CompanyDetails")
    public String CompanyDetails(@WebParam(name = "id") String id) {
        //TODO write your implementation code here:
         String sel = "select * from tbl_company c inner join tbl_location l on c.location_id=l.location_id where company_id='" + id + "'";
        ResultSet rs = con.selectCommand(sel);
        System.out.println(sel);
        JSONArray j = new JSONArray();
        String url_of_logo = ":8084/GoBetween/Assets/Files/CompanyLogo/";
        try {
            while (rs.next()) {
                JSONObject jo = new JSONObject();
                {
                    try {
                        jo.put("cid", rs.getString("company_id"));
                        jo.put("name", rs.getString("company_name"));
                        jo.put("contact", rs.getString("company_contact"));
                        jo.put("email", rs.getString("company_email"));
                        jo.put("address", rs.getString("company_address"));
                        jo.put("since", rs.getString("company_since"));
                        jo.put("logo", rs.getString("company_logo"));
                        jo.put("location", rs.getString("location_name"));
                        jo.put("logourl", url_of_logo);
                        j.put(jo);
                    } catch (JSONException ex) {
                        Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(NewWebService.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(j.toString());
        return j.toString();
    }

    /**
     * Web service operation
     */
    @WebMethod(operationName = "SignUp")
    public String SignUp(@WebParam(name = "name") String name, @WebParam(name = "contact") String contact, @WebParam(name = "email") String email, @WebParam(name = "aadhar") String aadhar, @WebParam(name = "location") String location, @WebParam(name = "day") String day, @WebParam(name = "month") String month, @WebParam(name = "year") String year, @WebParam(name = "password") String password, @WebParam(name = "address") String address) {
        //TODO write your implementation code here:
        String check = "Application Not Submitted";
        String insert = "insert into tbl_user(user_name,user_contact,user_dob,user_doj,user_address,user_password,user_aadhar_number,user_email,location_id)) values('" + name + "','" + contact + "','" + year+"-"+month+"-"+day + "',curdate(),'" + address + "','" + password + "','" + aadhar + "','" + email + "','" + location + "')";
       if (con.executeCommand(insert)) {
            check = "Application Submitted";
        }
        return check;
    }
    
}