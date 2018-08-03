package ${groupId}.controller;


import ${groupId}.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


/**
 * @author: lindj
 * @date: 2018/5/4 17:02
 * @description: 账单模块
 */
@RestController
@RequestMapping("/api/user")
public class UserController{

    @Autowired
    private UserService userService;

    /**
     * 获取用户数量
     *
     * @return Object
     */
    @PostMapping(value = "/list", name = "获取用户数量")
    public Object getList() {

        return this.userService.getList();
    }

}
