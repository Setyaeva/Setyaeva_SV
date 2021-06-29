#Практическое задание по теме “Введение в проектирование БД”
Написать крипт, добавляющий в БД vk, которую создали на занятии,
 3 новые таблицы (с перечнем полей, указанием индексов и внешних ключей)

#Запрос на добавление в группу
DROP TABLE IF EXISTS communities_requests;
CREATE TABLE communities_requests(
    initiator_user_id BIGINT UNSIGNED NOT NULL,
    admin_user_id BIGINT UNSIGNED NOT NULL,
    status ENUM('requested', 'approved', 'declined', 'delete'),
    name VARCHAR(255),
    created_at DATETIME DEFAULT NOW(),
    updateed_at DATETIME DEFAULT NOW(),
    
    PRIMARY KEY (initiator_user_id, admin_user_id),
    FOREIGN KEY (initiator_user_id)REFERENCES users(id),
    FOREIGN KEY (admin_user_id)REFERENCES users(id)
);


# База потеряных собак
DROP TABLE IF EXISTS lost_dogs;
CREATE TABLE lost_dogs(
    dog_id BIGINT UNSIGNED NOT NULL PRIMARY KEY,
    dog_photo VARCHAR(255),#фотография собаки
    dog_colour VARCHAR(255), #цвет собаки
    dog_breed VARCHAR(255), #порода собаки
    dog_description TEXT, #описание собаки
    user_posted_id BIGINT UNSIGNED NOT NULL, #Пользователь, ищущий собаку
    created_at DATETIME DEFAULT NOW()
);

ALTER TABLE lost_dogs ADD CONSTRAINT fk_lost_dogs_user_posted_id
FOREIGN KEY (user_posted_id) REFERENCES users(id)
;

# Статус пользователя
DROP TABLE IF EXISTS activity_status;
CREATE TABLE activity_status(
    activity_user_id BIGINT UNSIGNED NOT NULL,
    activity_status ENUM('online', 'busy', 'offline'),
    created_at DATETIME DEFAULT NOW(),
    updateed_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    INDEX (activity_user_id),
    FOREIGN KEY (activity_user_id) REFERENCES users(id)
);