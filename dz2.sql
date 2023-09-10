USE vk;

/*2. Написать скрипт, добавляющий в созданную БД vk 2-3 новые таблицы (с перечнем полей, указанием индексов и внешних ключей) (CREATE TABLE)*/

DROP TABLE IF EXISTS comment;
CREATE TABLE comment (
    id SERIAL,
    user_id BIGINT UNSIGNED NOT NULL,
    body TEXT,
    created_at DATETIME DEFAULT NOW(), -- можно будет даже не упоминать это поле при вставке

    FOREIGN KEY (user_id) REFERENCES users(id)
) COMMENT 'комментарий к фото ';

DROP TABLE IF EXISTS comment_to_media;
CREATE TABLE comment_to_media (
    id SERIAL,
    media_id BIGINT UNSIGNED NOT NULL,
    comment_id BIGINT UNSIGNED NOT NULL,

    FOREIGN KEY (media_id) REFERENCES media(id),
    FOREIGN KEY (comment_id) REFERENCES comment(id)
) COMMENT 'связь photo и comment';

/*3. Заполнить 2 таблицы БД vk данными (по 10 записей в каждой таблице) (INSERT)*/

INSERT INTO `users` 
VALUES ('1','Иванов','Иван','ivan.ivan@yandex.ru','1','89222222222'),
    ('2','Петров','Петр','petrov.petr@yandex.ru','2','89111111111'),
    ('3','Вилкова','Вера','vilkova.vera@yandex.ru','3','89000000000'),
    ('4','Сидорова','Ксения','sidorova.ksenya@yandex.ru','4','89333333333'),
    ('5','Сталин','Иосив','stalin.iosiv@yandex.ru','5','89444444444'),
    ('6','Ленин','Владимир','lenin.vladimir@yandex.ru','6','89555555555'),
    ('7','Пунин','Владимир','putin.vladimir@yandex.ru','7','89666666666'),
    ('8','Великая','Елизавета','velikay.elizaveta@yandex.ru','8','89777777777'),
    ('9','Королева','Наташа','koroleva.natasha@yandex.ru','9','89888888888'),
    ('10','Княжна','Александра','knazna.alexandra@yandex.ru','10','89999999999');

INSERT INTO `profiles` 
VALUES ('1','М','2000-01-11',NULL,NOW(),'Брест'),
    ('2','М','2002-02-12',NULL,NOW(),'Минск'),
    ('3','Ж','2001-03-13',NULL,NOW(),'Калинковичи'),
    ('4','Ж','2021-04-14',NULL,NOW(),'Кобрин'),
    ('5','М','2014-05-15',NULL,NOW(),'Могилев'),
    ('6','М','2007-06-16',NULL,NOW(),'Гомель'),
    ('7','М','2005-07-27',NULL,NOW(),'Гродно'),
    ('8','Ж','2010-08-01',NULL,NOW(),'Речица'),
    ('9','Ж','2015-09-05',NULL,NOW(),'Витебск'),
    ('10','Ж','2020-10-07',NULL,NOW(),'Орша');

/*4. Написать скрипт, отмечающий несовершеннолетних пользователей как неактивных (поле is_active = true). 
При необходимости предварительно добавить такое поле в таблицу profiles со значением по умолчанию = false (или 0) (ALTER TABLE + UPDATE)*/

ALTER TABLE profiles 
ADD COLUMN is_active 
BOOLEAN NOT NULL DEFAULT false;

UPDATE profiles
SET is_active = true
WHERE TIMESTAMPDIFF(YEAR, birthday, CURDATE()) >= 18

/*5. Написать скрипт, удаляющий сообщения «из будущего» (дата позже сегодняшней) (DELETE)*/
INSERT INTO `messages`
VALUES ('1', '1','2', 'Письмо', '2023-09-01'),
    ('2', '3','4', 'Письмо из прошлого', '2022-05-04'),
    ('3', '3','4', 'Письмо из будущего!', '2026-02-06');

DELETE FROM messages 
WHERE created_at > NOW();