package com.javarush.jira;

import com.javarush.jira.common.internal.config.AppProperties;
import com.javarush.jira.common.internal.config.DataSourceProperties;
import io.github.cdimascio.dotenv.Dotenv;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.cache.annotation.EnableCaching;

@SpringBootApplication
@EnableConfigurationProperties({AppProperties.class, DataSourceProperties.class})
@EnableCaching
public class JiraRushApplication {

    public static void main(String[] args) {
        Dotenv dotenv = Dotenv.configure().ignoreIfMissing().load();
        dotenv.entries().forEach(entry -> System.setProperty(entry.getKey(), entry.getValue()));

        SpringApplication.run(JiraRushApplication.class, args);
    }
}
