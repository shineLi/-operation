<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*" %>
<%@ page import="java.io.InputStreamReader"%>
<%@ page import="java.io.LineNumberReader"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.util.Date.*"%>
<%@ page import="org.apache.catalina.Context"%>

<%@ page import="org.apache.catalina.Manager"%>

<%@ page import="org.apache.catalina.connector.Request"%>

<%@ page import="org.apache.catalina.connector.RequestFacade"%>
<%@ page import="java.lang.reflect.Field"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>

<%

//时间 文件放入配置文件压缩包内，
java.text.SimpleDateFormat simpleDateFormat = new java.text.SimpleDateFormat( "yyyy-MM-dd HH:mm:ss");    
java.util.Date currentTime = new java.util.Date();    
String time = simpleDateFormat.format(currentTime).toString();  
	  
out.println("TIME:"+time+",");

//内存
double strTotlaMem = (Runtime.getRuntime().totalMemory()) / (1024.0 * 1024);
double strMaxMem = (Runtime.getRuntime().maxMemory()) / (1024.0 * 1024);
double strFreeMem = (Runtime.getRuntime().freeMemory()) / (1024.0 * 1024);
out.print("MaxMem:" + strMaxMem + ",TotalMem:" + strTotlaMem + ",FreeMem:" + strFreeMem);

/**
        begin to get db    
		查看jdbc.properties WEB-INF/config/
		dataSource.jndiName=java\:comp/env/jdbc/OracleDB替换脚本java:comp/env/jdbc/OracleDB
*/
javax.naming.Context initCtx = new javax.naming.InitialContext();
org.apache.tomcat.dbcp.dbcp2.BasicDataSource bds = (org.apache.tomcat.dbcp.dbcp2.BasicDataSource)initCtx.lookup("java:comp/env/jdbc/OracleDB");
out.print(",OracleDB:"+bds.getNumActive());
out.print(":"+bds.getMaxTotal());
bds = (org.apache.tomcat.dbcp.dbcp2.BasicDataSource)initCtx.lookup("java:comp/env/jdbc/Oracle01");
out.print(",Oracle01:"+bds.getNumActive() );
out.print(":"+bds.getMaxTotal());
bds = (org.apache.tomcat.dbcp.dbcp2.BasicDataSource)initCtx.lookup("java:comp/env/jdbc/Uniperm");
out.print(",Uniperm:"+bds.getNumActive());
out.print(":"+bds.getMaxTotal());
initCtx.close();

%>

