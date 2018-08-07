package ${groupId}.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * @author: lindj
 * @date: 2018/5/9 14:07
 * @description: 拦截器配置
 */
@Configuration
public class InterceptorConfig extends WebMvcConfigurerAdapter  {


    @Override
    public void addInterceptors(InterceptorRegistry registry) {
    }
}
