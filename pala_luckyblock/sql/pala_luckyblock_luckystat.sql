CREATE TABLE IF NOT EXISTS luckystat(
	player TEXT PRIMARY KEY NOT NULL CHECK (length(trim(player)) > 0),
	stat BLOB NOT NULL CHECK (amount >= 0 AND amount <= 100),
);