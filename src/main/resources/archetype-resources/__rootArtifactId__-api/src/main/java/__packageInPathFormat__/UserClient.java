package ${groupId};

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;

/**
 * @author: lindj
 * @date: 2018/8/7
 * @description: 远程调用示例
 **/

@FeignClient("${artifactId}-server")
public interface UserClient {

    @PostMapping(value = "/${artifactId}-server/api/user/list")
    Object getList();
}
