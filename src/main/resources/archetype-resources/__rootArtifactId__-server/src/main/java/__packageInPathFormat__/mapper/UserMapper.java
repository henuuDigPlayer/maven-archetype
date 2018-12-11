package ${groupId}.mapper;

import ${groupId}.model.User;

import java.util.List;

/**
 * @author: lindj
 * @date: 2018/5/4 15:27
 * @description:
 */
public interface UserMapper {

    /**
     * 获取用户列表
     *
     * @return list
     */
    List<User> getList();
}