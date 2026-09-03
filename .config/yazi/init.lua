if ya.target_os() == "macos" then
	require("mactag"):setup({
		-- Keys used to add or remove tags
		keys = {
			r = "レッド",
			o = "オレンジ",
			y = "イエロー",
			g = "グリーン",
			b = "ブルー",
			p = "パープル",
		},
		-- Colors used to display tags
		colors = {
			["レッド"] = "#ee7b70",
			["オレンジ"] = "#f5bd5c",
			["イエロー"] = "#fbe764",
			["グリーン"] = "#91fc87",
			["ブルー"] = "#5fa3f8",
			["パープル"] = "#cb88f8",
		},
		-- Order of the color circle showing in the line mode
		order = 500,
	})
end
