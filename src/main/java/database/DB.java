package database;

import java.sql.Connection;

/**
 * Created by NSD on 08.12.16.
 */
public abstract class DB {

    protected static final String databaseUrl = "jdbc:mysql://127.6.55.2:3306/doctrado?useUnicode=true&amp;characterEncoding=utf8";
    //private static final String databaseUrl = "jdbc:mysql://localhost:3307/tochka";
    protected static final String userName = "adminsBmIZAN";
    protected static final String password = "qIqWymbbb-hk";
    protected Connection conn = null;

}
