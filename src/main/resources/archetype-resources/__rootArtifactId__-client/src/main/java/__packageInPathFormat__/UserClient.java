package ${groupId};

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.http.MediaType;

/**
 * @author lindj
 * @date 2018/8/7
 * @description 远程调用示例
 **/

@FeignClient("${artifactId}-server")
public interface UserClient {

    @PostMapping(value = "/api/user/list",consumes = MediaType.APPLICATION_JSON_VALUE)
    Object getList();
}
