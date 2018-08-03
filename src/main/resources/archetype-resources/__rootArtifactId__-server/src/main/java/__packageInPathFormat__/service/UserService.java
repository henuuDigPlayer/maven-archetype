package ${groupId}.service;

import ${groupId}.model.User;

import java.util.List;



/**
 * @author: lindj
 * @date: 2018/5/4 15:27
 * @description: 用户接口
 */
public interface UserService {


    /**
     * 获取用户数量
     *
     */
    List<User> getList();
}
