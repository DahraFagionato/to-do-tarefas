/*
  Warnings:

  - A unique constraint covering the columns `[email]` on the table `Usuario` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `email` to the `Usuario` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `usuario` ADD COLUMN `email` VARCHAR(191) NOT NULL,
    MODIFY `nome` VARCHAR(191) NOT NULL;

-- CreateTable
CREATE TABLE `Tarefa` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `descricao` VARCHAR(191) NOT NULL,
    `setor` VARCHAR(191) NOT NULL,
    `prioridade` ENUM('BAIXA', 'MEDIA', 'ALTA') NOT NULL,
    `dataCadastro` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `status` ENUM('A_FAZER', 'FAZENDO', 'PRONTO') NOT NULL DEFAULT 'A_FAZER',
    `usuarioId` INTEGER NOT NULL,

    INDEX `Tarefa_status_idx`(`status`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE UNIQUE INDEX `Usuario_email_key` ON `Usuario`(`email`);

-- AddForeignKey
ALTER TABLE `Tarefa` ADD CONSTRAINT `Tarefa_usuarioId_fkey` FOREIGN KEY (`usuarioId`) REFERENCES `Usuario`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
