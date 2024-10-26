package com.javarush.jira.common.internal.config;

import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties("spring.datasource")
@Getter
@Setter
public class DataSourceProperties {
    @NotNull
    private String url;
    @NotNull
    private String username;
    @NotNull
    private String password;
    @NotNull
    private String driverClassName;
//    @NotNull
//    private String mailHost;
//    @NotNull
//    private String mailUserName;
//    @NotNull
//    private String mailPassword;
//    @NotNull
//    private String mailPort;
}
