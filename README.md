## [REST API](http://localhost:8080/doc)

## Концепция:

- Spring Modulith
    - [Spring Modulith: достигли ли мы зрелости модульности](https://habr.com/ru/post/701984/)
    - [Introducing Spring Modulith](https://spring.io/blog/2022/10/21/introducing-spring-modulith)
    - [Spring Modulith - Reference documentation](https://docs.spring.io/spring-modulith/docs/current-SNAPSHOT/reference/html/)

```
  url: jdbc:postgresql://localhost:5432/jira
  username: jira
  password: JiraRush
```

- Есть 2 общие таблицы, на которых не fk
    - _Reference_ - справочник. Связь делаем по _code_ (по id нельзя, тк id привязано к окружению-конкретной базе)
    - _UserBelong_ - привязка юзеров с типом (owner, lead, ...) к объекту (таска, проект, спринт, ...). FK вручную будем
      проверять

## Аналоги

- https://java-source.net/open-source/issue-trackers

## Тестирование

- https://habr.com/ru/articles/259055/

Список выполненных задач:
ветка *dev* минимум для зачета. Есть ПРы, где отдельно можно глянуть что подливалось по каждой задаче.
Docker в другой ветке будет разрабыватываться.
- 2 +
- 3 +
- 4 +
- 5 +
- 6 +
- 11 +

**.env** файлик (положить в корне для удобства, чтобы в систему не записывать)
```
SPRING_DATASOURCE_USERNAME=jira
SPRING_DATASOURCE_PASSWORD=JiraRush
SPRING_DATASOURCE_DRIVER_CLASS_NAME=org.postgresql.Driver
SPRING_DATASOURCE_URL=jdbc:postgresql://localhost:5432/jira

MAIL_HOST=smtp.gmail.com
MAIL_USERNAME=jira4jr@gmail.com
MAIL_PASSWORD=zdfzsrqvgimldzyj
MAIL_PORT=587

GITHUB_CLIENT_ID=3d0d8738e65881fff266
GITHUB_CLIENT_SECRET=0f97031ce6178b7dfb67a6af587f37e222a16120

GOOGLE_CLIENT_ID=329113642700-f8if6pu68j2repq3ef6umd5jgiliup60.apps.googleusercontent.com
GOOGLE_CLIENT_SECRET=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

GITLAB_CLIENT_ID=b8520a3266089063c0d8261cce36971defa513f5ffd9f9b7a3d16728fc83a494
GITLAB_CLIENT_SECRET=e72c65320cf9d6495984a37b0f9cc03ec46be0bb6f071feaebbfe75168117004
GITLAB_CLIENT_NAME=GitLab
GITLAB_REDIRECT_URI="{baseUrl}/login/oauth2/code/{registrationId}"
GITLAB_AUTHORIZATION_GRANT_TYPE=authorization_code

GITLAB_AUTHORIZATION_URI=https://gitlab.com/oauth/authorize
GITLAB_TOKEN_URI=https://gitlab.com/oauth/token
GITLAB_USER_INFO_URI=https://gitlab.com/api/v4/user
```