return {
  "snacks.nvim",
  opts = {
    dashboard = {
      sections = vim.fn.executable("pokemon-colorscripts") == 1
          and {
            {
              section = "terminal",
              cmd = "pokemon-colorscripts --no-title -rn bulbasaur,charmander,dratini,eevee,growlithe,mew,mimikyu,pachirisu,pancham,pichu,pikachu,piplup,psyduck,shaymin,skitty,squirtle,togepi,torchic,yamper",
              height = 14,
              padding = 1,
            },
            { section = "keys", gap = 1, padding = 1 },
            { section = "startup" },
          }
        or {
          {
            text = [[
        ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
        ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z    
        ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z       
        ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z         
        ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║           
        ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝           
 ]],
            padding = 1,
          },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
        },
    },
  },
}
