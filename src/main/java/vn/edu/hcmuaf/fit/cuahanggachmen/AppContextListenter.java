package vn.edu.hcmuaf.fit.cuahanggachmen;

import com.mysql.cj.jdbc.AbandonedConnectionCleanupThread;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;

public class AppContextListenter implements ServletContextListener, HttpSessionListener, HttpSessionAttributeListener {
    public AppContextListenter() {
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        DBConect.init();
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        AbandonedConnectionCleanupThread.checkedShutdown();
        System.out.println("AbandonedConnectionCleanupThread has been shutdown.");
    }

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        /* Session is created. */
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        /* Session is destroyed. */
    }

    @Override
    public void attributeAdded(HttpSessionBindingEvent sbe) {
        /* This method is called when an attribute is added to a session. */
    }

    @Override
    public void attributeRemoved(HttpSessionBindingEvent sbe) {
        /* This method is called when an attribute is removed from a session. */
    }

    @Override
    public void attributeReplaced(HttpSessionBindingEvent sbe) {
        /* This method is called when an attribute is replaced in a session. */
    }
}