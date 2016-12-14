package database;

import java.sql.Connection;

/**
 * Created by NSD on 08.12.16.
 */
public abstract class DB {

    protected static final String databaseUrl = "jdbc:mysql://127.2.159.2:3306/doctrade";
    //private static final String databaseUrl = "jdbc:mysql://localhost:3307/tochka";
    protected static final String userName = "adminsBmIZAN";
    protected static final String password = "qIqWymbbb-hk";
    protected Connection conn = null;

}
