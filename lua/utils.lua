function FitLineToWidth()
  local width = vim.api.nvim_get_option("columns") - 1 -- Subtract 1 for margin
  local start_pos = vim.fn.getpos("v") -- Start position of visual selection
  local end_pos = vim.fn.getpos(".") -- End position

  local line_start, line_end = math.min(start_pos[2], end_pos[2]), math.max(start_pos[2], end_pos[2])
  local line_num = start_pos[1]
  local line_text = vim.fn.getline(line_num)

  -- Wrap the line to fit within the width
  local wrapped_lines = vim.fn.split(vim.fn.strpart(line_text, 0, #line_text), "\\s\\|\\zs\\zs")
  local new_text = ""

  local current_line = ""
  for _, word in ipairs(wrapped_lines) do
    if #current_line + #word + 1 <= width then
      current_line = current_line .. (current_line == "" and "" or " ") .. word
    else
      new_text = new_text .. current_line .. "\n"
      current_line = word
    end
  end
  new_text = new_text .. current_line

  -- Set the reformatted line back
  vim.fn.setline(line_num, new_text)
end

