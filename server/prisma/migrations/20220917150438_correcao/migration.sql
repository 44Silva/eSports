/*
  Warnings:

  - You are about to drop the column `hourStrar` on the `ad` table. All the data in the column will be lost.
  - Added the required column `hourStart` to the `ad` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_ad" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "gameId" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "yearsPlaying" INTEGER NOT NULL,
    "discord" TEXT NOT NULL,
    "weekDays" TEXT NOT NULL,
    "hourStart" INTEGER NOT NULL,
    "hourEnd" INTEGER NOT NULL,
    "useVoiceChannel" BOOLEAN NOT NULL,
    "CreatedAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "ad_gameId_fkey" FOREIGN KEY ("gameId") REFERENCES "Game" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_ad" ("CreatedAt", "discord", "gameId", "hourEnd", "id", "name", "useVoiceChannel", "weekDays", "yearsPlaying") SELECT "CreatedAt", "discord", "gameId", "hourEnd", "id", "name", "useVoiceChannel", "weekDays", "yearsPlaying" FROM "ad";
DROP TABLE "ad";
ALTER TABLE "new_ad" RENAME TO "ad";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
