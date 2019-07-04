package ${groupId}.service.impl;

import ${groupId}.service.UserService;
import ${groupId}.mapper.UserMapper;
import ${groupId}.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author lindj
 * @date 2018/5/4 15:48
 * @description 用户模块操作
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    /**
     * 获取用户数量
     *
     * @return User 对象列表
     */
    @Override
    public List<User> getList() {
        return this.userMapper.getList();
    }


}
