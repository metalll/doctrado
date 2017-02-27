package database;

import java.sql.Connection;

/**
 * Created by NSD on 08.12.16.
 */
public abstract class DB {
    public static final String databaseUrl = "jdbc:mysql://127.6.55.2:3306/doctrado?useUnicode=true&amp;characterEncoding=utf8";
    //private static final String databaseUrl = "jdbc:mysql://localhost:3307/tochka";
    public static final String userName = "adminsBmIZAN";
    public static final String password = "qIqWymbbb-hk";
    public Connection conn = null;
}
