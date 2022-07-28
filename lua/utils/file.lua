-- Attempts to read the entire contents of file
-- at `path` to string, returning `nil` if it fails
local function try_read_all(path)
    local file = io.open(path, "rb")
    if not file then return nil end
    local content = file:read "*all"
    file:close()
    return content
end

return {
  try_read_all = try_read_all,
}
