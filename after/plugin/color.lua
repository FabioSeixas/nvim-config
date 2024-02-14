require('onedark').setup {
  style = 'warm',
  highlights = {
    ["@tag.builtin"] = { fg = '$yellow', fmt = 'bold' },
    ["@tag.tsx"] = { fg = '$yellow', fmt = 'bold' },
  }
}
require('onedark').load()
