CREATE TABLE IF NOT EXISTS "xp" (
	player TEXT NOT NULL DEFAULT 'unknown' CHECK(length(trim(player)) > 0),
	farmer INTEGER NOT NULL DEFAULT 0 CHECK(farmer >= 0),
	miner INTEGER NOT NULL DEFAULT 0 CHECK(miner >= 0),
	hunter INTEGER NOT NULL DEFAULT 0 CHECK(hunter >= 0),
	alchemist INTEGER NOT NULL DEFAULT 0 CHECK(alchemist >= 0)
);