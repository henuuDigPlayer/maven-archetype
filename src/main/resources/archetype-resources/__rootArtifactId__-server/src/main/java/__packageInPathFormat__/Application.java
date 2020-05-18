package ${groupId};

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

/**
 * @author lindj
 * @Description: 启动类
 * @date 2018/4/11 0011
 */
@SpringBootApplication
@MapperScan({"${groupId}.mapper","com.boot.framework.core.mapper"})
@EnableScheduling
public class Application {

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}