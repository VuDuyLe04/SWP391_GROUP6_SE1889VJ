package com.se1889_jv.swp391.swpstart.config;

import com.se1889_jv.swp391.swpstart.domain.User;
import com.se1889_jv.swp391.swpstart.service.implementservice.UserService;
import com.se1889_jv.swp391.swpstart.util.Utility;
import com.se1889_jv.swp391.swpstart.util.validator.annotation.CheckPermission;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.nio.file.AccessDeniedException;

@Aspect
@Component
public class PermissionCheckAspect {

    @Autowired
    private HttpSession session;

    @Autowired
    private HttpServletResponse response;

    @Autowired
    private UserService userService;

    @Before("@annotation(checkPermission)")  // Lắng nghe các phương thức có annotation @CheckPermission
    public void checkPermission(JoinPoint joinPoint, CheckPermission checkPermission) throws Throwable {
        // Lấy người dùng từ session
        User user = Utility.getUserInSession();

        // Lấy điều kiện từ annotation
        String condition = checkPermission.condition();

        // Kiểm tra quyền dựa trên điều kiện tùy chỉnh
        if (user == null || !hasPermission(user, condition)) {
            response.sendRedirect("/access-deny");  // Hoặc /login nếu bạn muốn chuyển về trang đăng nhập
            return;
        }
    }

    private boolean hasPermission(User user, String condition) {
        // Kiểm tra điều kiện quyền truy cập
        // Bạn có thể thay đổi logic này theo yêu cầu của bạn
        if ("statusService".equals(condition)) {
            // Kiểm tra nếu khách hàng có tồn tại trong hệ thống
            return this.userService.findById(user.getId()).isStatusService();
        }

        // Nếu không có điều kiện nào phù hợp, trả về false
        return false;
    }
}

