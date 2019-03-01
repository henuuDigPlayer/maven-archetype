package ${groupId}.config;
import com.google.common.util.concurrent.ThreadFactoryBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.concurrent.LinkedBlockingDeque;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * @author: lindj
 * @date: 2018/12/10
 * @description:
 */
@Configuration
public class ExecutorConfig {

    private static final Logger logger = LoggerFactory.getLogger(ExecutorConfig.class);

    @Bean("executorService")
    public ExecutorService getExecutorService() {
        ThreadFactory threadFactory =
                new ThreadFactoryBuilder().setNameFormat("thread-pool-%d").build();
        return new ThreadPoolExecutor(5,
                10,
                0L,
                TimeUnit.SECONDS,
                new LinkedBlockingDeque<>(),
                threadFactory,
                new ThreadPoolExecutor.AbortPolicy());
    }
}
