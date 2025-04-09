package vn.edu.hcmuaf.fit.cuahanggachmen.controller;

import dev.samstevens.totp.exceptions.QrGenerationException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.UserDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;
import vn.edu.hcmuaf.fit.cuahanggachmen.utils.TOTPUtils;

import java.io.IOException;

@WebServlet(name = "TOTPController", value = "/totp")
public class TOTPController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("auth");
        if (u != null) {
            Handle handle = DBConect.get().open();
            String secretKey = new UserDao(handle).getSecretKey(u.getId());
            String dataUri = (String) session.getAttribute("dataUri");
            if(secretKey != null && !secretKey.isEmpty()) {
                response.sendRedirect(request.getContextPath() + "/");
                return;
            }
            secretKey = (String) session.getAttribute("secretKey");
            boolean verifyTotpState = session.getAttribute("verifyTotpState") != null && (boolean) session.getAttribute("verifyTotpState");
            // Vì reload lại trang nên vẫn giữ lại secretKey
            if (secretKey != null && !secretKey.isEmpty() && dataUri != null && !dataUri.isEmpty() && verifyTotpState) {
                request.setAttribute("dataUri", dataUri);
                request.getRequestDispatcher("WEB-INF/totp_register.jsp").forward(request, response);
                return;
            }
            secretKey = TOTPUtils.getGenerateKey();
            session.setAttribute("secretKey", secretKey);
            dataUri = null;
            try {
                dataUri = (String) session.getAttribute("dataUri") == null ? TOTPUtils.getQRCode(secretKey, u.getEmail()) : (String) session.getAttribute("dataUri");
                session.setAttribute("dataUri", dataUri);
            } catch (QrGenerationException e) {
                throw new RuntimeException(e);
            }
            session.setAttribute("verifyTotpState", true);
            request.setAttribute("dataUri", dataUri);
            request.getRequestDispatcher("WEB-INF/totp_register.jsp").forward(request, response);
            handle.close();
        } else {
            response.sendRedirect(request.getContextPath() + "/");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        boolean verifyTotpState = session.getAttribute("verifyTotpState") != null && (boolean) session.getAttribute("verifyTotpState");
        if (!verifyTotpState) {
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }
        User u = (User) session.getAttribute("auth");
        // TODO: Xác thực quyền người dùng
        if (u != null) {
            Handle handle = DBConect.get().open();
            String secretKey = (String) session.getAttribute("secretKey");
            String code = request.getParameter("code");
            if (TOTPUtils.verifyCode(secretKey, code)) {
                handle.begin();
                String[] recoverCodes = TOTPUtils.getRecoveryCode();
                StringBuilder codes = new StringBuilder();
                for (String rcCode : recoverCodes) {
                    codes.append(rcCode).append(", ");
                }
                session.removeAttribute("secretKey");
                session.removeAttribute("dataUri");
                session.setAttribute("recoveryCodes", codes.toString());
                UserDao dao = new UserDao(handle);

                int inSecret = dao.insertSecretKey(u.getId(), secretKey);
                int inRecovery = dao.insertRecoveryCode(u.getId(), codes.toString());
                if (inSecret == 0 || inRecovery == 0) {
                    handle.rollback();
                    request.setAttribute("error", "Đang có lỗi xảy ra, vui lòng thử lại sau");
                    doGet(request, response);
                    return;
                }

                handle.commit();
                response.sendRedirect("/totp-recovery-code");
            } else {
                request.setAttribute("error", "Mã xác thực không chính xác");
                doGet(request, response);
            }
            handle.close();
        } else {
            response.sendRedirect(request.getContextPath() + "/");
        }
    }
}