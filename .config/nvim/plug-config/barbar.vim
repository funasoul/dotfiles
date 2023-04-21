let g:barbar_auto_setup = v:false " disable auto-setup
lua << EOF
  require'barbar'.setup {
    insert_at_end = true,
  }
EOF

" NOTE: If barbar's option dict isn't created yet, create it
let bufferline = get(g:, 'bufferline', {})

let bufferline.insert_at_end = v:true
let bufferline.icon_separator_active = ''
let bufferline.icon_separator_inactive = ''
