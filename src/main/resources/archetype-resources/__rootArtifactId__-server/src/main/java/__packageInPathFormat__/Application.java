package ${groupId};

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

/**
 * @author lindj
 * @Description 启动类
 * @date 2018/4/11 0011
 */
@SpringBootApplication
@MapperScan("${groupId}.mapper")
@ComponentScan(value = {"com.zjdex", "${groupId}"})
@EnableFeignClients
@EnableEurekaClient
@EnableScheduling
public class Application {

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}