lua << EOF
  require("nvim-tree").setup()

  require'nvim-web-devicons'.setup {
    default = true;
  }
EOF

nnoremap <space>e <Cmd>NvimTreeToggle<CR>
