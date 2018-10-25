package ${groupId};

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;
//import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
//import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * @author lindj
 * @Description: 启动类
 * @date 2018/4/11 0011
 */
@SpringBootApplication
@MapperScan("${groupId}.mapper")
//@EnableDiscoveryClient
//@EnableFeignClients
@EnableScheduling
public class Application {

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}