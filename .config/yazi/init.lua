-- for 1 line scroll
require("code").seek = function(_, job)
	local h = cx.active.current.hovered
	if not h or h.url ~= job.file.url then
		return
	end

	local step = job.units > 0 and 1 or -1
	step = step == 0 and ya.clamp(-1, job.units, 1) or step
	ya.manager_emit("peek", {
		math.max(0, cx.active.preview.skip + step),
		only_if = job.file.url,
	})
end
