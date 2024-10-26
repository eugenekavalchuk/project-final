package com.javarush.jira.common.internal.config;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;

import javax.sql.DataSource;

@Slf4j
@RequiredArgsConstructor
@Configuration
public class DataSourceConfig {
    private final DataSourceProperties dataSourceProperties;

    @Bean
    @Profile("prod")
    public DataSource postgresDataSource() {
        log.info("driver:", dataSourceProperties.getDriverClassName());
        log.info("url:" ,dataSourceProperties.getUrl());
        log.info("user:" ,dataSourceProperties.getUsername());
        log.info("password:" ,dataSourceProperties.getPassword());
        return DataSourceBuilder.create()
                .driverClassName(dataSourceProperties.getDriverClassName())
                .url(dataSourceProperties.getUrl())
                .username(dataSourceProperties.getUsername())
                .password(dataSourceProperties.getPassword())
                .build();
    }
}
