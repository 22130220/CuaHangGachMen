package vn.edu.hcmuaf.fit.cuahanggachmen.api;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.TypeAdapter;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.jdbi.v3.core.Handle;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.RoleDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.UserDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.dao.UserRoleDao;
import vn.edu.hcmuaf.fit.cuahanggachmen.db.DBConect;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.Role;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.User;
import vn.edu.hcmuaf.fit.cuahanggachmen.model.UserRole;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;
import java.util.stream.Collectors;

@WebServlet(name = "GetSetUserRole", value = "/admin/user-role/api/*")
public class GetSetUserRole extends HttpServlet {
    private static final Logger LOGGER = Logger.getLogger(GetSetUserRole.class.getName());
    private final Gson gson;

    public GetSetUserRole() {
        // Cấu hình Gson để xử lý LocalDateTime
        this.gson = new GsonBuilder()
                .registerTypeAdapter(LocalDateTime.class, new TypeAdapter<LocalDateTime>() {
                    private final DateTimeFormatter formatter = DateTimeFormatter.ISO_LOCAL_DATE_TIME;

                    @Override
                    public void write(JsonWriter out, LocalDateTime value) throws IOException {
                        if (value == null) {
                            out.nullValue();
                        } else {
                            out.value(formatter.format(value));
                        }
                    }

                    @Override
                    public LocalDateTime read(JsonReader in) throws IOException {
                        if (in.peek() == com.google.gson.stream.JsonToken.NULL) {
                            in.nextNull();
                            return null;
                        }
                        String dateStr = in.nextString();
                        return LocalDateTime.parse(dateStr, formatter);
                    }
                })
                .create();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, Object> responseData = new HashMap<>();
        responseData.put("success", false); // Mặc định là false nếu có lỗi

        String pathInfo = request.getPathInfo();
        String userEmail = request.getParameter("userEmail");

        LOGGER.info("GET request received. Path: " + pathInfo + ", userEmail: " + userEmail);

        try (Handle handle = DBConect.get().open()) {
            UserDao userDao = new UserDao(handle);
            UserRoleDao userRoleDao = new UserRoleDao(handle);
            RoleDao roleDao = new RoleDao(handle);

            if (pathInfo == null || "/".equals(pathInfo)) {
                List<User> users = userDao.getAllUsers();
                if (users == null) {
                    LOGGER.severe("UserDao.getAllUsers() returned null");
                    responseData.put("error", "Không thể lấy danh sách người dùng");
                    sendResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, responseData);
                    return;
                }

                List<UserRole> userRoles;
                if (userEmail != null && !userEmail.isEmpty()) {
                    User user = userDao.findByEmail(userEmail);
                    if (user != null) {
                        LOGGER.info("Found user with email: " + userEmail + ", ID: " + user.getId());
                        userRoles = userRoleDao.getAllUserRoles().stream()
                                .filter(ur -> ur.getUserId() == user.getId())
                                .collect(Collectors.toList());
                    } else {
                        LOGGER.warning("User not found for email: " + userEmail);
                        userRoles = List.of();
                    }
                } else {
                    userRoles = userRoleDao.getAllUserRoles();
                    if (userRoles == null) {
                        LOGGER.severe("UserRoleDao.getAllUserRoles() returned null");
                        responseData.put("error", "Không thể lấy danh sách vai trò của người dùng");
                        sendResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, responseData);
                        return;
                    }
                }

                // Lấy danh sách role chi tiết
                List<Role> allRoles = roleDao.getAllRoles();
                if (allRoles == null) {
                    LOGGER.severe("RoleDao.getAllRoles() returned null");
                    responseData.put("error", "Không thể lấy danh sách vai trò");
                    sendResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, responseData);
                    return;
                }

                responseData.put("success", true);
                responseData.put("users", users);
                responseData.put("userRoles", userRoles);
                responseData.put("roles", allRoles); // Thêm danh sách role vào response
            } else if ("/roles".equals(pathInfo)) {
                List<Role> roles = roleDao.getAllRoles();
                if (roles == null) {
                    LOGGER.severe("RoleDao.getAllRoles() returned null");
                    responseData.put("error", "Không thể lấy danh sách vai trò");
                    sendResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, responseData);
                    return;
                }
                responseData.put("success", true);
                responseData.put("roles", roles);
            } else {
                responseData.put("error", "Đường dẫn không hợp lệ: " + pathInfo);
                sendResponse(response, HttpServletResponse.SC_BAD_REQUEST, responseData);
                return;
            }

            sendResponse(response, HttpServletResponse.SC_OK, responseData);
        } catch (Exception e) {
            LOGGER.severe("Error in doGet: " + e.getMessage());
            e.printStackTrace();
            responseData.put("error", "Lỗi server khi lấy dữ liệu: " + e.getMessage());
            sendResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, responseData);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, Object> responseData = new HashMap<>();
        responseData.put("success", false); // Mặc định là false nếu có lỗi

        String pathInfo = request.getPathInfo();
        LOGGER.info("POST request received. Path: " + pathInfo);

        try (Handle handle = DBConect.get().open()) {
            UserRoleDao userRoleDao = new UserRoleDao(handle);
            UserDao userDao = new UserDao(handle);
            RoleDao roleDao = new RoleDao(handle);

            if ("/create".equals(pathInfo)) {
                BufferedReader reader = request.getReader();
                StringBuilder jsonBuilder = new StringBuilder();
                String line;
                while ((line = reader.readLine()) != null) {
                    jsonBuilder.append(line);
                }

                if (jsonBuilder.length() == 0) {
                    responseData.put("error", "Dữ liệu JSON rỗng");
                    sendResponse(response, HttpServletResponse.SC_BAD_REQUEST, responseData);
                    return;
                }

                Map<String, Object> requestData;
                try {
                    requestData = gson.fromJson(jsonBuilder.toString(), Map.class);
                } catch (Exception e) {
                    LOGGER.severe("Invalid JSON data: " + e.getMessage());
                    responseData.put("error", "Dữ liệu JSON không hợp lệ: " + e.getMessage());
                    sendResponse(response, HttpServletResponse.SC_BAD_REQUEST, responseData);
                    return;
                }

                if (requestData == null || !requestData.containsKey("userId") || !requestData.containsKey("roleIds")) {
                    responseData.put("error", "Dữ liệu không đầy đủ: Thiếu userId hoặc roleIds");
                    sendResponse(response, HttpServletResponse.SC_BAD_REQUEST, responseData);
                    return;
                }

                String userIdStr = String.valueOf(requestData.get("userId"));
                List<String> roleIds = (List<String>) requestData.get("roleIds");

                int userId;
                try {
                    userId = Integer.parseInt(userIdStr);
                } catch (NumberFormatException e) {
                    LOGGER.severe("Invalid userId: " + userIdStr);
                    responseData.put("error", "userId không hợp lệ: " + userIdStr);
                    sendResponse(response, HttpServletResponse.SC_BAD_REQUEST, responseData);
                    return;
                }

                if (roleIds == null || roleIds.isEmpty()) {
                    responseData.put("error", "Dữ liệu không hợp lệ: roleIds rỗng");
                    sendResponse(response, HttpServletResponse.SC_BAD_REQUEST, responseData);
                    return;
                }

                handle.begin();
                try {
                    for (String roleIdStr : roleIds) {
                        int roleId;
                        try {
                            roleId = Integer.parseInt(roleIdStr);
                        } catch (NumberFormatException e) {
                            responseData.put("error", "roleId không hợp lệ: " + roleIdStr);
                            sendResponse(response, HttpServletResponse.SC_BAD_REQUEST, responseData);
                            return;
                        }

                        if (userDao.getUserById(userId) == null) {
                            throw new IllegalArgumentException("userId không tồn tại: " + userId);
                        }
                        if (roleDao.getRoleById(roleId).isEmpty()) {
                            throw new IllegalArgumentException("roleId không tồn tại: " + roleId);
                        }

                        if (userRoleDao.getUserRole(userId, roleId).isEmpty()) {
                            userRoleDao.insertUserRole(userId, roleId);
                        }
                    }

                    handle.commit();
                    responseData.put("success", true);
                    responseData.put("message", "Thêm vai trò cho người dùng thành công");
                } catch (IllegalArgumentException e) {
                    handle.rollback();
                    responseData.put("error", "Lỗi khi thêm dữ liệu: " + e.getMessage());
                    sendResponse(response, HttpServletResponse.SC_BAD_REQUEST, responseData);
                    return;
                }
            } else if ("/update".equals(pathInfo)) {
                BufferedReader reader = request.getReader();
                StringBuilder jsonBuilder = new StringBuilder();
                String line;
                while ((line = reader.readLine()) != null) {
                    jsonBuilder.append(line);
                }

                if (jsonBuilder.length() == 0) {
                    responseData.put("error", "Dữ liệu JSON rỗng");
                    sendResponse(response, HttpServletResponse.SC_BAD_REQUEST, responseData);
                    return;
                }

                Map<String, Object> requestData;
                try {
                    requestData = gson.fromJson(jsonBuilder.toString(), Map.class);
                } catch (Exception e) {
                    LOGGER.severe("Invalid JSON data: " + e.getMessage());
                    responseData.put("error", "Dữ liệu JSON không hợp lệ: " + e.getMessage());
                    sendResponse(response, HttpServletResponse.SC_BAD_REQUEST, responseData);
                    return;
                }

                if (requestData == null || !requestData.containsKey("userId") || !requestData.containsKey("roleIds")) {
                    responseData.put("error", "Dữ liệu không đầy đủ: Thiếu userId hoặc roleIds");
                    sendResponse(response, HttpServletResponse.SC_BAD_REQUEST, responseData);
                    return;
                }

                String userIdStr = String.valueOf(requestData.get("userId"));
                List<String> roleIds = (List<String>) requestData.get("roleIds");

                int userId;
                try {
                    userId = Integer.parseInt(userIdStr);
                } catch (NumberFormatException e) {
                    LOGGER.severe("Invalid userId: " + userIdStr);
                    responseData.put("error", "userId không hợp lệ: " + userIdStr);
                    sendResponse(response, HttpServletResponse.SC_BAD_REQUEST, responseData);
                    return;
                }

                handle.begin();
                try {
                    // Xóa tất cả vai trò hiện tại của user
                    List<UserRole> existingRoles = userRoleDao.getAllUserRoles().stream()
                            .filter(ur -> ur.getUserId() == userId)
                            .collect(Collectors.toList());
                    for (UserRole ur : existingRoles) {
                        userRoleDao.deleteUserRole(userId, ur.getRoleId());
                    }

                    // Thêm lại các vai trò mới
                    for (String roleIdStr : roleIds) {
                        int roleId;
                        try {
                            roleId = Integer.parseInt(roleIdStr);
                        } catch (NumberFormatException e) {
                            responseData.put("error", "roleId không hợp lệ: " + roleIdStr);
                            sendResponse(response, HttpServletResponse.SC_BAD_REQUEST, responseData);
                            return;
                        }

                        if (userDao.getUserById(userId) == null) {
                            throw new IllegalArgumentException("userId không tồn tại: " + userId);
                        }
                        if (roleDao.getRoleById(roleId).isEmpty()) {
                            throw new IllegalArgumentException("roleId không tồn tại: " + roleId);
                        }

                        userRoleDao.insertUserRole(userId, roleId);
                    }

                    handle.commit();
                    responseData.put("success", true);
                    responseData.put("message", "Cập nhật vai trò của người dùng thành công");
                } catch (IllegalArgumentException e) {
                    handle.rollback();
                    responseData.put("error", "Lỗi khi cập nhật dữ liệu: " + e.getMessage());
                    sendResponse(response, HttpServletResponse.SC_BAD_REQUEST, responseData);
                    return;
                }
            } else {
                responseData.put("error", "Đường dẫn không hợp lệ: " + pathInfo);
                sendResponse(response, HttpServletResponse.SC_BAD_REQUEST, responseData);
                return;
            }

            sendResponse(response, HttpServletResponse.SC_OK, responseData);
        } catch (Exception e) {
            LOGGER.severe("Error in doPost: " + e.getMessage());
            e.printStackTrace();
            responseData.put("error", "Lỗi server khi xử lý yêu cầu: " + e.getMessage());
            sendResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, responseData);
        }
    }

    private void sendResponse(HttpServletResponse response, int status, Map<String, Object> responseData) throws IOException {
        response.setStatus(status);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String jsonResponse = gson.toJson(responseData != null ? responseData : new HashMap<>());
            LOGGER.info("Sending response: " + jsonResponse);
            out.print(jsonResponse);
        } catch (Exception e) {
            LOGGER.severe("Error sending response: " + e.getMessage());
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            try (PrintWriter out = response.getWriter()) {
                Map<String, Object> errorResponse = new HashMap<>();
                errorResponse.put("success", false);
                errorResponse.put("error", "Lỗi khi gửi phản hồi: " + e.getMessage());
                out.print(gson.toJson(errorResponse));
            }
        }
    }
}