local M = {}

function M.rgba(r, g, b, a)
    return {a and a or 255, r, g, b}
end

function M.hex(hex, alpha)
    return {
        alpha and alpha or 255,
        tonumber(hex:sub(1, 2), 16),
        tonumber(hex:sub(3, 4), 16),
        tonumber(hex:sub(5, 6), 16),
    }
end

return M