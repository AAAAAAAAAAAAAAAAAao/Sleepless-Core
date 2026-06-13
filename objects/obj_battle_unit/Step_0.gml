if (hp > 0) {
	if (!global.battle_won) {
		alpha = lerp(alpha, 100, 0.05);
	}
	else {
		alpha = lerp(alpha, 0, 0.05);
	}
	image_alpha = alpha / 100.0;
}