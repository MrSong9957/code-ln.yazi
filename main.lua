local M = {}
local cache = {}

function M:peek(job)
	local skip = job.skip or 0
	local area = job.area
	if not area or not area.w then return end

	local url = tostring(job.file.url)
	local h = area.h

	if cache.url ~= url then
		cache = { url = url, lines = {} }
		local path = tostring(job.file.path)
		local output, err = Command("bat"):arg({
			"--style=numbers",
			"--color=always",
			"--paging=never",
			"--wrap=never",
			"--",
			path,
		}):output()

		if output and output.stdout ~= "" then
			for line in output.stdout:gmatch("[^\r\n]+") do
				cache.lines[#cache.lines + 1] = line
			end
		end
	end

	if #cache.lines > 0 then
		local end_i = math.min(skip + h, #cache.lines)
		if skip < #cache.lines then
			local visible_raw = table.concat(cache.lines, "\n", skip + 1, end_i)
			ya.preview_widget(job, ui.Text.parse(visible_raw):area(area))
			return
		end
	end

	-- Fallback: plain text with manual line numbers
	local path = tostring(job.file.path)
	local f = io.open(path, "r")
	if not f then return end
	local visible = {}
	local i = 0
	for line in f:lines() do
		i = i + 1
		if i > skip then
			visible[#visible + 1] = ui.Line {
				ui.Span(string.format("%4d ", i)):fg("darkgray"),
				ui.Span(line),
			}
			if #visible >= h then break end
		end
	end
	f:close()
	ya.preview_widget(job, ui.Text(visible):area(area))
end

function M:seek(job)
	local h = cx.active.current.hovered
	if not h or h.url ~= job.file.url then return end

	local step = math.floor(job.units * job.area.h / 10)
	step = step == 0 and ya.clamp(-1, job.units, 1) or step

	ya.emit("peek", {
		math.max(0, cx.active.preview.skip + step),
		only_if = job.file.url,
	})
end

return M
