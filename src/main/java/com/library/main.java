package com.library;


import org.apache.catalina.LifecycleException;
import org.apache.catalina.startup.Tomcat;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class main {
    public static void main(String[] args) throws LifecycleException {
        Tomcat tomcat = new Tomcat();
        tomcat.setPort(8080);
        tomcat.getConnector();

        tomcat.addWebapp("/", System.getProperty("user.dir") + "/src/main/webapp");
        tomcat.start();
        tomcat.getServer().await(); // Tomcat이 종료될 때까지 대기
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");

        System.out.println("Spring Framework Application Started!");
    }
}
