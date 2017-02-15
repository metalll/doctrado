package controller;

import com.mysql.jdbc.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;
import java.util.Properties;

/**
 * Created by NSD on 14.02.17.
 */
@WebServlet(name = "deleteTheme")
public class deleteTheme extends HttpServlet {
        String err = "";
    private Statement stmt;
    protected static final String databaseUrl = "jdbc:mysql://127.6.55.2:3306/doctrado?useUnicode=true&amp;characterEncoding=utf8";
    //private static final String databaseUrl = "jdbc:mysql://localhost:3307/tochka";
    protected static final String userName = "adminsBmIZAN";
    protected static final String password = "qIqWymbbb-hk";
    protected Connection conn = null;




    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {





        int internalDelID = -1;

        Map<String,String[]> paramMap = request.getParameterMap();
        String id  = paramMap.get("id")[0];
        String parent = paramMap.get("parent")[0];
        String number = paramMap.get("number")[0];

        ArrayList<ArrayList<String>> themes = new ArrayList<ArrayList<String>>();




        String sql = "SELECT * \n" +
                "FROM  `doctrado`.`subCourse` \n" +
                "WHERE  `parentCourse` =  '"+parent+"'";
        //query
        //todo conn do db
        try{
            Class.forName("com.mysql.jdbc.Driver");  }
        catch(Exception e){ e.printStackTrace(); }
        try {
            Properties connInfo = new Properties();
            connInfo.put("user",userName);
            connInfo.put("password",password);
            connInfo.put("useUnicode","true");
            connInfo.put("characterEncoding","UTF-8");
            Connection conn = DriverManager.getConnection(databaseUrl, connInfo);
            conn.setReadOnly(false);


            stmt = (Statement) conn.createStatement();
        }
        catch (Exception e){}
        try {
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {

                ArrayList<String> tempArr = new ArrayList<String>();
                for (int i = 1; i <= 6; i++) {

                    tempArr.add(rs.getString(i));


                }


                if (tempArr.get(4).equals(number)) {
                    internalDelID = Integer.parseInt(tempArr.get(5));
                    tempArr = new ArrayList<String>();
                    tempArr.add("DELETED");


                }


                themes.add(tempArr);

            }

        }catch (SQLException e){


        }finally {
            if(stmt!=null){try {
                stmt.close();
            }catch (Exception e){e.printStackTrace();}
            }
            if(conn!=null){try {
                conn.close();
            }catch (Exception e){e.printStackTrace();}
            }
        }



            //sort

            for (int i = themes.size() - 1; i >= 0; i--) {




                for (int j = 0; j < i; j++) {


                    try{
                    if (Integer.parseInt(themes.get(j).get(4)) > Integer.parseInt(themes.get(j + 1).get(4))) {
                        ArrayList<String> t = themes.get(j);
                        themes.set(j, themes.get(j + 1));
                        themes.set(j + 1, t);
                    }
                    }catch (Exception e){

                        if(themes.get(j).size()==1){
                            if (Integer.parseInt(number) > Integer.parseInt(themes.get(j + 1).get(4))) {
                                ArrayList<String> t = themes.get(j);
                                themes.set(j, themes.get(j + 1));
                                themes.set(j + 1, t);
                            }



                        }
                        if(themes.get(j+1).size()==1){
                            if (Integer.parseInt(themes.get(j).get(4)) > Integer.parseInt(number)) {
                                ArrayList<String> t = themes.get(j);
                                themes.set(j, themes.get(j + 1));
                                themes.set(j + 1, t);
                            }



                        }




                    }
                }
            }


//delete block

            sql = "DELETE FROM `doctrado`.`subCourse` WHERE `subCourse`.`internalID` = '"+internalDelID+"';";


            try {
                Properties connInfo1 = new Properties();
                connInfo1.put("user",userName);
                connInfo1.put("password",password);
                connInfo1.put("useUnicode","true");
                connInfo1.put("characterEncoding","UTF-8");
                Connection con = DriverManager.getConnection(databaseUrl,connInfo1);
                Statement s = (Statement) con.createStatement();

                s.execute(sql);


            } catch (Exception ex) {
                ex.printStackTrace();
            }
            finally {
                if(stmt!=null){try {
                    stmt.close();
                }catch (Exception e){e.printStackTrace();}
                }
                if(conn!=null){try {
                    conn.close();
                }catch (Exception e){e.printStackTrace();}
                }
            }


           //
            //
            // sql = "DELETE FROM  `subCourse` WHERE  `id` LIKE  '"+id+"'";
            //conn.nativeSQL(sql);

//            stmt.execute(sql);


 //update block
            ArrayList<ArrayList<String>> doUpdate = new ArrayList<ArrayList<String>>();

            for(int i=0;i<themes.size();i++){

                //self deleted item
                if(themes.get(i).size()==1){

                    if(i==(themes.size()-1)){/*do nothing*/ break; }
                    else{

                        for(int j = i+1;j<themes.size();i++){

                            int counter =  Integer.parseInt(themes.get(j).get(4));
                            counter -=1;
                            themes.get(j).set(4,""+counter);

                            doUpdate.add(themes.get(j));

                        }

                        break;


                    }




                }



            }



            for(int i=0;i<doUpdate.size();i++){
                String uID = doUpdate.get(i).get(5);
                String uNum = doUpdate.get(i).get(4);

                    sql = "UPDATE  `doctrado`.`subCourse` SET  `courseNumber` =  '" + uNum + "' WHERE `subCourse`.`internalID` = '" + uID + "';";

                    try {
                        Properties connInfo1 = new Properties();
                        connInfo1.put("user", userName);
                        connInfo1.put("password", password);
                        connInfo1.put("useUnicode", "true");
                        connInfo1.put("characterEncoding", "UTF-8");
                        Connection con = DriverManager.getConnection(databaseUrl, connInfo1);
                        Statement s = (Statement) con.createStatement();

                        s.execute(sql);
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    } finally {
                        if (stmt != null) {
                            try {
                                stmt.close();
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        }
                        if (conn != null) {
                            try {
                                conn.close();
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        }


                        response.setStatus(HttpServletResponse.SC_OK);
                        response.getWriter().write(doUpdate.size());
                        response.getWriter().flush();
                        response.getWriter().close();

                    }
            }
                    // conn.nativeSQL(sql);


                    //  conn.commit();

















        //check









        //delete





        //update



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
