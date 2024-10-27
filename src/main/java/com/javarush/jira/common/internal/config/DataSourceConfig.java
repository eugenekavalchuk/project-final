package com.javarush.jira.common.internal.config;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
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

    @Value("${spring.datasource.url}")
    private String testDataSourceUrl;

    @Value("${spring.datasource.driver-class-name}")
    private String testDriverClassName;

    @Bean
    @Profile("prod")
    public DataSource postgresDataSource() {
        return DataSourceBuilder.create()
                .driverClassName(dataSourceProperties.getDriverClassName())
                .url(dataSourceProperties.getUrl())
                .username(dataSourceProperties.getUsername())
                .password(dataSourceProperties.getPassword())
                .build();
    }

    @Bean
    @Profile("test")
    public DataSource testDataSource() {
        return DataSourceBuilder.create()
                .driverClassName(testDriverClassName)
                .url(testDataSourceUrl)
                .build();
    }
}
