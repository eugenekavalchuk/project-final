-- populate users

create sequence if not exists USERS_ID_SEQ start with 1;
alter sequence USERS_ID_SEQ restart with 1;

DELETE
FROM USERS;

insert into USERS (EMAIL, PASSWORD, FIRST_NAME, LAST_NAME, DISPLAY_NAME)
values ('user@gmail.com', '{noop}password', 'userFirstName', 'userLastName', 'userDisplayName'),
       ('admin@gmail.com', '{noop}admin', 'adminFirstName', 'adminLastName', 'adminDisplayName'),
       ('guest@gmail.com', '{noop}guest', 'guestFirstName', 'guestLastName', 'guestDisplayName'),
       ('manager@gmail.com', '{noop}manager', 'managerFirstName', 'managerLastName', 'managerDisplayName'),
       ('taras@gmail.com', '{noop}password', 'Тарас', 'Шевченко', '@taras'),
       ('petlura@gmail.com', '{noop}password', 'Симон', 'Петлюра', '@epetl'),
       ('moroz_a@gmail.com', '{noop}password', 'Александр', 'Мороз', '@Moroz93'),
       ('antonio.nest@gmail.com', '{noop}password', 'Антон', 'Нестеров', '@antonio_nest'),
       ('i.franko@gmail.com', '{noop}password', 'Иван', 'Франко', '@ifranko'),
       ('g.skovoroda@gmail.com', '{noop}password', 'Григорий', 'Сковорода', '@Gregory24'),
       ('arsh.and@gmail.com', '{noop}password', 'Андрей', 'Арш', '@arsh01'),
       ('squirrel2011@gmail.com', '{noop}password', 'Леся', 'Иванюк', '@SmallSquirrel'),
       ('nikk24@gmail.com', '{noop}password', 'Николай', 'Никулин', '@nikk'),
       ('artem711@gmail.com', '{noop}password', 'Артем', 'Запорожец', '@Artt'),
       ('max.pain@gmail.com', '{noop}password', 'Максим', 'Дудник', '@MaxPain'),
       ('admin@aws.co', '{noop}password', 'test', 'admin', '@testAdmin');

-- 0 DEV
-- 1 ADMIN
-- 2 MANAGER
DELETE
FROM USER_ROLE;
insert into USER_ROLE (USER_ID, ROLE)
values (1, 0),
       (2, 0),
       (2, 1),
       (4, 2),
       (5, 0),
       (6, 0),
       (7, 0),
       (8, 0),
       (9, 0),
       (10, 0),
       (11, 0),
       (12, 0),
       (13, 0),
       (14, 0);


insert into PROFILE (ID, LAST_FAILED_LOGIN, LAST_LOGIN, MAIL_NOTIFICATIONS)
values (1, null, null, 49),
       (2, null, null, 14);

insert into CONTACT (ID, CODE, VALUE_TEST)
values (1, 'skype', 'userSkype'),
       (1, 'mobile', '+01234567890'),
       (1, 'website', 'user.com'),
       (2, 'github', 'adminGitHub'),
       (2, 'tg', 'adminTg'),
       (2, 'vk', 'adminVk');


create sequence if not exists ATTACHMENT_ID_SEQ start with 1;
alter sequence ATTACHMENT_ID_SEQ restart with 1;

delete
from ATTACHMENT;
insert into ATTACHMENT (name, file_link, object_id, object_type, user_id, date_time)
values ('Снимок экрана 1.png', './attachments/project/1_Снимок экрана 1.png', 2, 0, 4, '2023-05-04 22:28:50.215429'),
       ('Снимок экрана 2.png', './attachments/project/2_Снимок экрана 2.png', 2, 0, 4, '2023-05-04 22:28:53.687600'),
       ('Ежедневный-чеклист.xlsx', './attachments/project/3_Ежедневный-чеклист.xlsx', 2, 0, 4,
        '2023-05-04 22:31:15.166547'),
       ('Снимок экрана 1.png', './attachments/task/1_Снимок экрана 1.png', 41, 2, 4, '2023-05-04 22:28:53.687600'),
       ('Снимок экрана 2.png', './attachments/task/2_Снимок экрана 2.png', 41, 2, 4, '2023-05-04 22:28:50.215429'),
       ('Ежедневный-чеклист.xlsx', './attachments/task/3_Ежедневный-чеклист.xlsx', 38, 2, 4,
        '2023-05-04 22:28:50.215429');

create sequence if not exists ATTACHMENT_ID_SEQ start with 1;
alter sequence ATTACHMENT_ID_SEQ restart with 1000;


-- populate tasks
delete
from TASK;

create sequence if not exists TASK_ID_SEQ start with 1;
alter sequence TASK_ID_SEQ restart with 1;

delete
from SPRINT;

create sequence if not exists SPRINT_ID_SEQ start with 1;
alter sequence SPRINT_ID_SEQ restart with 1;

delete
from PROJECT;

create sequence if not exists PROJECT_ID_SEQ start with 1;
alter sequence PROJECT_ID_SEQ restart with 1;

delete
from ACTIVITY;

create sequence if not exists ACTIVITY_ID_SEQ start with 1;
alter sequence ACTIVITY_ID_SEQ restart with 1;

insert into PROJECT (code, title, description, type_code, parent_id)
values ('PR1', 'JiraRush', '«Mini-JIRA» app : project management system tutorial app', 'task_tracker', null),
       ('Test_Project', 'Test Project', 'Just test project', 'task_tracker', null),
       ('Test_Project_2', 'Test Project 2', 'Just test project 2', 'task_tracker', null),
       ('JiraRush sub', 'JiraRush subproject', 'subproject', 'task_tracker', 1);

create sequence if not exists PROJECT_ID_SEQ start with 1000;
alter sequence PROJECT_ID_SEQ restart with 1000;

insert into SPRINT (status_code, startpoint, endpoint, code, project_id)
values ('finished', '2023-04-09 08:05:10', '2023-04-29 16:48:34', 'SP-1.001', 1),
       ('active', null, null, 'SP-1.002', 1),
       ('active', null, null, 'SP-1.003', 1),
       ('finished', '2023-04-09 08:05:10', '2023-04-29 16:48:34', 'Sprint-1', 2),
       ('active', null, null, 'SP-1.002', 2),
       ('finished', '2023-04-03 12:14:11', '2023-04-18 17:03:41', 'Sprint-2', 2),
       ('active', '2023-04-05 14:25:43', '2023-06-10 13:00:00', 'Sprint-3', 2),
       ('active', null, null, 'Sprint-1', 4);

alter sequence SPRINT_ID_SEQ restart with 1;

---- project 1 -------------
INSERT INTO TASK (TITLE, TYPE_CODE, STATUS_CODE, PROJECT_ID, SPRINT_ID, STARTPOINT)
values ('Data', 'epic', 'in_progress', 1, 1, null),
       ('Trees', 'epic', 'in_progress', 1, 1,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('UI', 'epic', 'in_progress', 1, 1, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Sprint', 'epic', 'in_progress', 1, 1,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Project', 'epic', 'in_progress', 1, 1,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Task', 'epic', 'in_progress', 1, 1,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Attachments', 'story', 'in_progress', 1, 1,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Dashboard', 'epic', 'in_progress', 1, 1,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Report of Sprint (UI)', 'story', 'in_progress', 1, 1,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Organizational-architectural', 'epic', 'in_progress', 1, 1,
        DATEADD('MINUTE', 5 * RAND(), NOW())), ---- project 2 -------------
       ('Title', 'task', 'todo', 2, 2, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'todo', 2, 2, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'in_progress', 2, 2,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'in_progress', 2, 2,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'in_progress', 2, 2,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'test', 2, 2, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'done', 2, 2, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'done', 2, 2, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'canceled', 2, 2, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'ready_for_test', 2, 2,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'in_progress', 2, 3,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'in_progress', 2, 3,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'in_progress', 2, 3,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'test', 2, 3, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'test', 2, 3, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'test', 2, 3, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'done', 2, 3, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'done', 2, 3, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'ready_for_test', 2, 3,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'ready_for_test', 2, 3,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'todo', 2, 4, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'story', 'todo', 2, 4, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'bug', 'todo', 2, 4, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'todo', 2, 4, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'todo', 2, 4, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'epic', 'in_progress', 2, 4,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'ready_for_review', 2, 4,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'ready_for_review', 2, 4,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'story', 'ready_for_test', 2, 4,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'review', 2, 4, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'bug', 'review', 2, 4, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'test', 2, 4, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'epic', 'test', 2, 4, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'done', 2, 4, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'done', 2, 4, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'story', 'done', 2, 4, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'bug', 'done', 2, 4, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'canceled', 2, 4, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'todo', 2, 2, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'todo', 2, 2, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'in_progress', 2, 2,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'in_progress', 2, 2,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'in_progress', 2, 2,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'test', 2, 2, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'done', 2, 2, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'done', 2, 2, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'canceled', 2, 2, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'ready_for_test', 2, 2,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'in_progress', 2, 3,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'in_progress', 2, 3,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'in_progress', 2, 3,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'test', 2, 3, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'test', 2, 3, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'test', 2, 3, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'done', 2, 3, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'done', 2, 3, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'ready_for_test', 2, 3,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'ready_for_test', 2, 3,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'todo', 2, 4, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'story', 'todo', 2, 4, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'bug', 'todo', 2, 4, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'todo', 2, 4, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'todo', 2, 4, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'epic', 'in_progress', 2, 4,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'ready_for_review', 2, 4,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'ready_for_review', 2, 4,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'story', 'ready_for_test', 2, 4,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'review', 2, 4, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'bug', 'review', 2, 4, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'test', 2, 4, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'epic', 'test', 2, 4, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'done', 2, 4, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'done', 2, 4, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'story', 'done', 2, 4, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'bug', 'done', 2, 4, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Title', 'task', 'canceled', 2, 4, DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('subproject sprint task', 'epic', 'in_progress', 4, 5,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('subproject backlog task', 'epic', 'in_progress', 4, null,
        DATEADD('MINUTE', 5 * RAND(), NOW()));

INSERT INTO TASK (TITLE, TYPE_CODE, STATUS_CODE, PROJECT_ID, SPRINT_ID, PARENT_ID, STARTPOINT)
values ('Add role manager and filters in security', 'task', 'done', 1, 1, 1,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Add users from task-timing', 'task', 'ready_for_review', 1, 1, 1,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Add tasks-2 in DB', 'task', 'in_progress', 1, 1, 1,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Remove reference with USER_TYPE IN (3,4,5)', 'task', 'in_progress', 1, 1, 1,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('REST API for trees', 'task', 'in_progress', 1, 1, 2,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Drawing in trees', 'task', 'in_progress', 1, 1, 2,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Context menu', 'task', 'in_progress', 1, 1, 2,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Reassignment sprint', 'task', 'in_progress', 1, 1, 2,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Add task, subtask, sprint, subsprint', 'task', 'in_progress', 1, 1, 2,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Make layout for view TitleTo', 'task', 'in_progress', 1, 1, 3,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Make layout for edit TitleTo', 'task', 'in_progress', 1, 1, 3,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Fix header-fragment', 'task', 'ready_for_review', 1, 1, 3,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('REST API', 'task', 'in_progress', 1, 1, 4,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Tests', 'task', 'in_progress', 1, 1, 4,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('UI view, mock button to dashboard', 'task', 'in_progress', 1, 1, 4,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('UI edit', 'task', 'in_progress', 1, 1, 4,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('REST API', 'task', 'in_progress', 1, 1, 5,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Tests', 'task', 'in_progress', 1, 1, 5,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('UI view, mock button to dashboard', 'task', 'in_progress', 1, 1, 5,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('UI edit', 'task', 'in_progress', 1, 1, 5,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('REST API', 'task', 'in_progress', 1, 1, 6,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Tests', 'task', 'in_progress', 1, 1, 6,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('UI view, mock button to dashboard', 'task', 'in_progress', 1, 1, 6,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('UI edit', 'task', 'in_progress', 1, 1, 6,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('UI view add to Task, mock button to dashboard', 'task', 'in_progress', 1, 1, 6,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('UI edit add to Task', 'task', 'in_progress', 1, 1, 6,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Edit changelog with changes of Task model', 'task', 'in_progress', 1, 1, 6,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('REST API: changeStatus', 'task', 'in_progress', 1, 1, 6,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Make columns with tasks', 'task', 'in_progress', 1, 1, 8,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('UI tab of tasks', 'task', 'in_progress', 1, 1, 8,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Context mune', 'task', 'in_progress', 1, 1, 8,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Duration, count of tasks, elapsed time', 'task', 'in_progress', 1, 1, 9,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Meeting, dividing tasks', 'task', 'in_progress', 1, 1, 10,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Refactoring packages', 'task', 'in_progress', 1, 1, 10,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Refactoring tasks', 'task', 'in_progress', 1, 1, 10,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Subproject sprint subtask', 'task', 'in_progress', 4, 5, 87,
        DATEADD('MINUTE', 5 * RAND(), NOW())),
       ('Subproject backlog subtask', 'task', 'in_progress', 4, null, 88,
        DATEADD('MINUTE', 5 * RAND(), NOW()));

create sequence if not exists TASK_ID_SEQ start with 1000;
alter sequence TASK_ID_SEQ restart with 1000;

---task 1------
INSERT INTO ACTIVITY(AUTHOR_ID, TASK_ID, UPDATED, COMMENT, TITLE, DESCRIPTION, ESTIMATE, TYPE_CODE, STATUS_CODE,
                     PRIORITY_CODE)
values (1, 1, '2023-05-15 09:05:10', null, 'Data', null, 3, 'epic', 'in_progress', 'low'),
       (2, 1, '2023-05-15 12:25:10', null, 'Data', null, null, null, null, 'normal'),
       (1, 1, '2023-05-15 14:05:10', null, 'Data', null, 4, null, null, null), ---task 118----
       (11, 118, '2023-05-16 10:05:10', null, 'UI tab of tasks', null, 4, 'task', 'in_progress', 'normal'),
       (5, 118, '2023-05-16 11:10:10', null, 'UI tab of tasks', null, null, null, null, 'high'),
       (11, 118, '2023-05-16 12:30:10', null, 'UI tab of tasks', null, 2, null, null, null);

