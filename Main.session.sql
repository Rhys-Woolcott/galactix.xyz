CREATE TABLE `users`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(255) NOT NULL,
    `full_name` VARCHAR(255) NOT NULL,
    `username` VARCHAR(255) NOT NULL,
    `bio` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `admin` TINYINT(1) NOT NULL,
    `banned` TINYINT(1) NOT NULL,
    `created_at` TIMESTAMP NOT NULL,
	PRIMARY KEY (id)
);
ALTER TABLE
    `users` ADD PRIMARY KEY `users_id_primary`(`id`);
ALTER TABLE
    `users` ADD UNIQUE `users_email_unique`(`email`);
ALTER TABLE
    `users` ADD UNIQUE `users_username_unique`(`username`);
CREATE TABLE `posts`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id` BIGINT NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `tldr` VARCHAR(255) NOT NULL,
    `content` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NOT NULL,
    `updated_at` TIMESTAMP NOT NULL,
    `released_at` TIMESTAMP NOT NULL,
    `hidden` TIMESTAMP NOT NULL,
    `reads` BIGINT NOT NULL,
	PRIMARY KEY (id)
);
ALTER TABLE
    `posts` ADD PRIMARY KEY `posts_id_primary`(`id`);
ALTER TABLE
    `posts` ADD UNIQUE `posts_title_unique`(`title`);
ALTER TABLE
    `posts` ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY(`user_id`) REFERENCES `users`(`id`);