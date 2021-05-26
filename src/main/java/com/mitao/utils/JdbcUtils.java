package com.mitao.utils;


import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidDataSourceFactory;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

public class JdbcUtils {

    private static DruidDataSource dataSource;

    private static final com.alibaba.druid.pool.DruidDataSourceFactory DruidDataSourceFactory = null;
    private static ThreadLocal<Connection> connThread = new ThreadLocal<Connection>();

    static {
        try {
            Properties properties = new Properties();
            //!!!!!!!Very Important
            //Always put jdbc.properties under src/main/resources folder. idea will copy it to target/classes/

            InputStream inputStream = JdbcUtils.class.getClassLoader().getResourceAsStream("jdbc.properties");
            properties.load(inputStream);
            dataSource = (DruidDataSource) DruidDataSourceFactory.createDataSource(properties);

//            System.out.println(dataSource.getConnection());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * connect
     * @return
     */
    public static Connection getConnection(){
        Connection conn = connThread.get();

        if(conn == null){
            try {
                conn = dataSource.getConnection();
                connThread.set(conn);
                conn.setAutoCommit(false);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return conn;
//        Connection conn = null;
//        try {
//            conn = dataSource.getConnection();
//        } catch (SQLException throwables) {
//            throwables.printStackTrace();
//        }
    }

    public static void commitAndClose(){
        Connection conn = connThread.get();
        if(conn != null ){
            try {
                conn.commit();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }finally{
                try {
                    conn.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        }
        connThread.remove();
    }

    public static void rollbackAndClose(){
        Connection conn = connThread.get();
        if(conn != null ) {
            try {
                conn.rollback();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    conn.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        }
        connThread.remove();
    }

    /**
     *end connection
     * @param conn
     */
    public static void close(Connection conn){
        if(conn != null){
            try {
                conn.close();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }


    }
}
