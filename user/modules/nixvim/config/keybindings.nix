{
  globals.mapleader = " ";

  userCommands = {
    Q.command = "q";
    Q.bang = true;
    Wq.command = "q";
    Wq.bang = true;
    WQ.command = "q";
    WQ.bang = true;
    W.command = "w";
    W.bang = true;
  };

  plugins.which-key = {
    enable = true;
    settings.spec = [
      {
        __unkeyed = "<leader>b";
        group = "+buffer";
      }
      {
        __unkeyed = "<leader>c";
        group = "+quickfix";
      }
      {
        __unkeyed = "<leader>d";
        group = "+dap";
      }
      {
        __unkeyed-1 = "<leader>du";
        group = "+dapui";
      }
      {
        __unkeyed = "<leader>f";
        group = "+files";
      }
      {
        __unkeyed = "<leader>g";
        group = "+git";
      }
      {
        __unkeyed = "<leader>l";
        group = "+lsp";
      }
      {
        __unkeyed-1 = "<leader>lw";
        group = "+workspace";
      }
      {
        __unkeyed-1 = "<leader>lx";
        group = "+diagnostics";
      }
      {
        __unkeyed = "<leader>p";
        group = "+packages";
      }
      {
        __unkeyed = "<leader>q";
        group = "+quit/session";
      }
      {
        __unkeyed = "<leader>s";
        group = "+search";
      }
      {
        __unkeyed = "<leader>t";
        group = "+tabs/term/TS";
      }
      {
        __unkeyed = "<leader>u";
        group = "+ui";
      }
      {
        __unkeyed = "<leader>w";
        group = "+windows";
        proxy = "<C-w>";
      }
      {
        __unkeyed = "<leader>x";
        group = "+text";
      }
      {
        __unkeyed-1 = "<leader>xg";
        group = "+greek";
      }
      {
        __unkeyed-1 = "<leader>xl";
        group = "+latin";
      }
      {
        __unkeyed = "<leader>y";
        group = "+yank";
      }
    ];
  };

  keymaps = [
    {
      mode = "n";
      key = "j";
      action = "gj";
    }
    {
      mode = "n";
      key = "k";
      action = "gk";
    }
    {
      mode = "n";
      key = "n";
      action = "nzzzv";
    }
    {
      mode = "n";
      key = "N";
      action = "Nzzzv";
    }
    {
      mode = "v";
      key = "<";
      action = "<gv";
    }
    {
      mode = "v";
      key = ">";
      action = ">gv";
    }
    {
      mode = "v";
      key = "J";
      action = "<cmd>m '>+1<CR>gv=gv";
    }
    {
      mode = "v";
      key = "K";
      action = "<cmd>m '<-2<CR>gv=gv";
    }
    {
      mode = ["n" "x" "o"];
      key = "s";
      action = ''<cmd>lua require("flash").jump()<CR>'';
      options = {
        desc = "Flash";
      };
    }
    {
      mode = ["n" "x" "o"];
      key = "S";
      action = ''<cmd>lua require("flash").treesitter()<CR>'';
      options = {
        desc = "Flash Treesitter";
      };
    }
    {
      mode = "n";
      key = "<leader>r";
      action = "<cmd>FloatermNew --opener=edit --title=yazi --name=yazi yazi<CR>";
      options = {
        desc = "Ranger";
      };
    }
    {
      mode = "n";
      key = "<leader>h";
      action = "<cmd>vert h ";
      options = {
        desc = "help";
      };
    }
    {
      mode = "n";
      key = "<leader>:";
      action = "<cmd>Telescope command_history<CR>";
      options = {
        desc = "Command history";
      };
    }
    {
      mode = "n";
      key = "<leader>/";
      action = "<cmd>Telescope live_grep<CR>";
      options = {
        desc = "Global search";
      };
    }
    {
      mode = "n";
      key = "<leader>\\";
      action = "<cmd>%s/<C-r>=expand(\"<cword>\")<CR>//g<left><left>";
      options = {
        desc = "Replace cword";
      };
    }
    {
      mode = "n";
      key = "<leader><tab>";
      action = "<cmd>b#<CR>";
      options = {
        desc = "Other buffer";
      };
    }
    {
      mode = "n";
      key = "<leader><CR>";
      action = "@@";
      options = {
        desc = "Repeat macro";
      };
    }
      # Undotree
    {
      mode = "n";
      key = "<leader>ut";
      action = "<cmd>UndotreeToggle<CR>";
      options = {
        desc = "Undotree";
      };
    }
      # quickfix
    {
      mode = "n";
      key = "<leader>cn";
      action = "<cmd>cnext<CR>";
      options = {
        desc = "next";
      };
    }
    {
      mode = "n";
      key = "<leader>cp";
      action = "<cmd>cprevious<CR>";
      options = {
        desc = "previous";
      };
    }
    {
      mode = "n";
      key = "<leader>co";
      action = "<cmd>copen<CR>";
      options = {
        desc = "open";
      };
    }
    {
      mode = "n";
      key = "<leader>cc";
      action = "<cmd>cclose<CR>";
      options = {
        desc = "close";
      };
    }
    {
      mode = "n";
      key = "<leader>cC";
      action = "<cmd>cexpr []<CR>";
      options = {
        desc = "clear";
      };
    }
    {
      mode = "n";
      key = "<leader>cr";
      action = "<cmd>colder<CR>";
      options = {
        desc = "restore";
      };
    }
      # files
    {
      mode = "n";
      key = "<leader>fb";
      action = "<cmd>Telescope buffers<cr>";
      options = { 
        desc = "Buffers";
      };
    }
    {
      mode = "n";
      key = "<leader>ff";
      action = "<cmd>Telescope find_files<cr>";
      options = {
        desc = "Find Files (root dir)";
      };
    }
    {
      mode = "n";
      key = "<leader>fn";
      action = "<cmd>enew<cr>";
      options = {
        desc = "New";
      };
    }
    {
      mode = "n";
      key = "<leader>fr";
      action = "<cmd>Telescope oldfiles<cr>";
      options = {
        desc = "Recent";
      };
    }
    {
      mode = "n";
      key = "<leader>fs";
      action = "<cmd>write<cr>";
      options = {
        desc = "Save";
      };
    }
    {
      mode = "n";
      key = "<leader>fd";
      action = "<cmd>cd %:p:h<cr>";
      options = {
        desc = "Set cwd";
      };
    }
    {
      mode = "n";
      key = "<leader>fc";
      action = "<cmd>FindVimConfigs<cr>";
      options = {
        desc = "Vim configs";
      };
    }
    {
      mode = "n";
      key = "<leader>fC";
      action = "<cmd>FindConfigs<cr>";
      options = {
        desc = "All configs";
      };
    }
    {
      mode = "n";
      key = "<leader>fo";
      action = "<cmd>source %<cr>";
      options = {
        desc = "Source this";
      };
    }
    {
      mode = "n";
      key = "<leader>fl";
      action = "<cmd>FindDotLocal<cr>";
      options = {
        desc = "xdg_data";
      };
    }
    {
      mode = "n";
      key = "<leader>fp";
      action = "<cmd>FindProjects<cr>";
      options = {
        desc = "Find projects";
      };
    }
    {
      mode = "n";
      key = "<leader>ft";
      action = "<cmd>Neotree focus toggle reveal_force_cwd<cr>";
      options = {
        desc = "Filetree";
      };
    }
    {
      mode = "n";
      key = "<leader>fu";
      action = "<cmd>UndotreeToggle<cr>";
      options = {
        desc = "Undotree";
      };
    }

    # git
    {
      mode = "n";
      key = "<leader>gc";
      action = "<cmd>Telescope git_commits<CR>";
      options = {
        desc = "commits";
      };
    }
    {
      mode = "n";
      key = "<leader>gs";
      action = "<cmd>Telescope git_status<CR>";
      options = {
        desc = "status";
      };
    }
    {
      mode = "n";
      key = "<leader>gg";
      action = "<cmd>FloatermNew --height=0.99 --width=0.99 lazygit<CR>";
      options = {
        desc = "Lazygit";
      };
    }

      # gitsigns
    {
      mode = "n";
      key = "<leader>gR";
      action = "<Cmd>lua require('gitsigns').reset_buffer()<CR>";
      options = {
        desc = "reset all";
      };
    }
    {
      mode = "n";
      key = "<leader>gb";
      action = "<Cmd>lua require('gitsigns').blame_line({ full = true })<CR>";
      options = {
        desc = "blame line";
      };
    }
    {
      mode = "n";
      key = "<leader>gp";
      action = "<Cmd>lua require('gitsigns').preview_hunk()<CR>";
      options = {
        desc = "preview";
      };
    }
    {
      mode = "n";
      key = "<leader>gr";
      action = "<Cmd>lua require('gitsigns').reset_hunk()<CR>";
      options = {
        desc = "reset hunk";
      };
    }
    {
      mode = "n";
      key = "<leader>gS";
      action = "<Cmd>lua require('gitsigns').stage_hunk()<CR>";
      options = {
        desc = "stage hunk";
      };
    }
    {
      mode = "n";
      key = "<leader>gA";
      action = "<Cmd>lua require('gitsigns').stage_buffer()<CR>";
      options = {
        desc = "stage all";
      };
    }
    {
      mode = "n";
      key = "<leader>gU";
      action = "<Cmd>lua require('gitsigns').undo_stage_hunk()<CR>";
      options = {
        desc = "undo stage hunk";
      };
    }
    {
      mode = "n";
      key = "<leader>gd";
      action = "<Cmd>lua require('gitsigns').diffthis(nil, { split = 'belowright' })<CR>";
      options = {
        desc = "diffthis index";
      };
    }
    {
      mode = "n";
      key = "<leader>gD";
      action = ''
      function()
        require('gitsigns').diffthis('~', { split = 'belowright' })
      end'';
      options = {
        desc = "diffthis ~";
      };
    }
    {
      mode = "n";
      key = "<leader>gO";
      action = "<Cmd>windo diffthis<CR>";
      options = {
        desc = "diffboth (files)";
      };
    }
    {
      mode = "n";
      key = "<leader>go";
      action = "<Cmd>windo diffoff<CR>";
      options = {
        desc = "diffoff";
      };
    }
    {
      mode = "n";
      key = "<leader>gu";
      action = "<Cmd>diffupdate<CR>";
      options = {
        desc = "diffupdate";
      };
    }
    {
      mode = "v";
      key = "<leader>gs";
      action = ''
      function()
        require('gitsigns').stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
      end'';
      options = {
        desc = "stage hunk";
      };
    }
    {
      mode = "v";
      key = "<leader>gr";
      action = ''
      function()
        require('gitsigns').reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
      end'';
      options = {
        desc = "reset hunk";
      };
    }

      # buffers
    {
      mode = "n";
      key = "<leader>bb";
      action = "<cmd>Telescope buffers<cr>";
      options = {
        desc = "switch";
      };
    }
    {
      mode = "n";
      key = "<leader>bn";
      action = "<cmd>bnext<cr>";
      options = {
        desc = "next";
      };
    }
    {
      mode = "n";
      key = "<leader>bp";
      action = "<cmd>bprev<cr>";
      options = {
        desc = "delete";
      };
    }
    {
      mode = "n";
      key = "<leader>bd";
      action = "<cmd>bdelete<cr>";
      options = {
        desc = "delete";
      };
    }
    {
      mode = "n";
      key = "<leader>bh";
      action = "<cmd>Dashboard<CR>";
      options = {
        desc = "Home (Dashboard)";
      };
    }
    {
      mode = "n";
      key = "<leader>bR";
      action = "<cmd>e!<cr>";
      options = {
        desc = "revert";
      };
    }

      # diagnostics (Trouble)
    {
      mode = "n";
      key = "<leader>lxx";
      action = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>";
      options = {
        desc = "Buffer diagnostics";
      };
    }
    {
      mode = "n";
      key = "<leader>lxw";
      action = "<cmd>Trouble diagnostics toggle<cr>";
      options = {
        desc = "Workspace diagnostics";
      };
    }
    {
      mode = "n";
      key = "<leader>lxs";
      action = "<cmd>Trouble symbols toggle focus=false<cr>";
      options = {
        desc = "Symbols (Trouble)";
      };
    }
    {
      mode = "n";
      key = "<leader>lxL";
      action = "<cmd>Trouble loclist toggle<cr>";
      options = {
        desc = "Location list (Trouble)";
      };
    }
    {
      mode = "n";
      key = "<leader>lxq";
      action = "<cmd>Trouble qflist toggle<cr>";
      options = {
        desc = "Quickfix list (Trouble)";
      };
    }
    {
      mode = "n";
      key = "<leader>lxr";
      action = "<cmd>Trouble lsp toggle focus=false win.position=right<cr>";
      options = {
        desc = "LSP defs/refs/... (Trouble)";
      };
    }
      # Trouble -- jump to the next item, skipping the groups
    {
      mode = "n";
      key = "<leader>lxn";
      action = "<cmd>TroubleSkipNext<cr>";
      options = {
        desc = "jump next";
      };
    }
      # Trouble -- jump to the previous item, skipping the groups
    {
      mode = "n";
      key = "<leader>lxp";
      action = "<cmd>TroubleSkipPrev<cr>";
      options = {
        desc = "jump prev";
      };
    }
      # Trouble -- jump to the first item, skipping the groups
    {
      mode = "n";
      key = "<leader>lxf";
      action = "<cmd>TroubleSkipFirst<cr>";
      options = {
        desc = "jump first";
      };
    }
      # Trouble -- jump to the last item, skipping the groups
    {
      mode = "n";
      key = "<leader>lxl";
      action = "<cmd>TroubleSkipLast<cr>";
      options = {
        desc = "jump last";
      };
    }

      # search
    {
      mode = "n";
      key = "<leader>sa";
      action = "<cmd>Telescope autocommands<cr>";
      options = {
        desc = "Auto Commands";
      };
    }
    {
      mode = "n";
      key = "<leader>sb";
      action = "<cmd>Telescope current_buffer_fuzzy_find<cr>";
      options = {
        desc = "Buffer";
      };
    }
    {
      mode = "n";
      key = "<leader>sc";
      action = "<cmd>Telescope command_history<cr>";
      options = {
        desc = "Command History";
      };
    }
    {
      mode = "n";
      key = "<leader>sC";
      action = "<cmd>Telescope commands<cr>";
      options = {
        desc = "Commands";
      };
    }
    {
      mode = "n";
      key = "<leader>sd";
      action = "<cmd>Telescope diagnostics bufnr=0<cr>";
      options = {
        desc = "Document diagnostics";
      };
    }
    {
      mode = "n";
      key = "<leader>sD";
      action = "<cmd>Telescope diagnostics<cr>";
      options = {
        desc = "Workspace diagnostics";
      };
    }
    {
      mode = "n";
      key = "<leader>sg";
      action = "<cmd>Telescope live_grep<cr>";
      options = {
        desc = "Grep (root dir)";
      };
    }
    {
      mode = "n";
      key = "<leader>sh";
      action = "<cmd>Telescope help_tags<cr>";
      options = {
        desc = "Help Pages";
      };
    }
    {
      mode = "n";
      key = "<leader>sH";
      action = "<cmd>Telescope highlights<cr>";
      options = {
        desc = "Search Highlight Groups";
      };
    }
    {
      mode = "n";
      key = "<leader>sj";
      action = "<cmd>Telescope jumplist<cr>";
      options = {
        desc = "Jump list";
      };
    }
    {
      mode = "n";
      key = "<leader>sk";
      action = "<cmd>Telescope keymaps<cr>";
      options = {
        desc = "Key Maps";
      };
    }
    {
      mode = "n";
      key = "<leader>sl";
      action = "<cmd>Telescope loclist<cr>";
      options = {
        desc = "Location list";
      };
    }
    {
      mode = "n";
      key = "<leader>sL";
      action = "<cmd>Telescope reloader<cr>";
      options = {
        desc = "Lua module (reloader)";
      };
    }
    {
      mode = "n";
      key = "<leader>sM";
      action = "<cmd>Telescope man_pages<cr>";
      options = {
        desc = "Man Pages";
      };
    }
    {
      mode = "n";
      key = "<leader>sm";
      action = "<cmd>Telescope marks<cr>";
      options = {
        desc = "Jump to Mark";
      };
    }
    {
      mode = "n";
      key = "<leader>sN";
      action = "<cmd>Telescope notify<cr>";
      options = {
        desc = "Notifications";
      };
    }
    {
      mode = "n";
      key = "<leader>so";
      action = "<cmd>Telescope vim_options<cr>";
      options = {
        desc = "Options";
      };
    }
    {
      mode = "n";
      key = "<leader>sq";
      action = "<cmd>Telescope quickfix<cr>";
      options = {
        desc = "Quickfix list";
      };
    }
    {
      mode = "n";
      key = "<leader>sQ";
      action = "<cmd>Telescope quickfixhistory<cr>";
      options = {
        desc = "Quickfix history";
      };
    }
    {
      mode = "n";
      key = "<leader>sr";
      action = "<cmd>Telescope registers<cr>";
      options = {
        desc = "Registers";
      };
    }
    {
      mode = "n";
      key = "<leader>sR";
      action = "<cmd>Telescope resume<cr>";
      options = {
        desc = "Resume";
      };
    }
    {
      mode = "n";
      key = "<leader>sw";
      action = "<cmd>Telescope grep_string<cr>";
      options = {
        desc = "Word (root dir)";
      };
    }
    {
      mode = "n";
      key = "<leader>s/";
      action = "<cmd>Telescope search_history<cr>";
      options = {
        desc = "Search History";
      };
    }
    {
      mode = "n";
      key = "<leader>ss";
      action = "<cmd>Telescope lsp_document_symbols<cr>";
      options = {
        desc = "Goto Symbol";
      };
    }
    {
      mode = "n";
      key = "<leader>sS";
      action = "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>";
      options = {
        desc = "Goto Symbol (Workspace)";
      };
     }
    {
      mode = "n";
      key = "<leader>sn";
      action = "<cmd>nohls<cr>";
      options = {
        desc = "Clear search";
      };
    }

    {
      mode = "n";
      key = "<leader>tn";
      action = "<cmd>tabnew<CR>";
      options = {
        desc = "New tab";
      };
    }
    {
      mode = "n";
      key = "<leader>tt";
      action = "<cmd>FloatermNew<CR>";
      options = {
        desc = "Terminal";
      };
    }
    {
      mode = "n";
      key = "<leader>tN";
      action = "<cmd>FloatermNext<CR>";
      options = {
        desc = "Next term";
      };
    }
    {
      mode = "n";
      key = "<leader>tP";
      action = "<cmd>FloatermPrev<CR>";
      options = {
        desc = "Previous term";
      };
    }
    {
      mode = "n";
      key = "<C-t>";
      action = "<cmd>FloatermToggle<CR>";
      options = {
        desc = "Previous term";
      };
    }
    {
      mode = "i";
      key = "<C-t>";
      action = "<cmd>FloatermToggle<CR>";
      options = {
        desc = "Previous term";
      };
    }
    {
      mode = "t";
      key = "<C-t>";
      action = "<cmd>FloatermToggle<CR>";
      options = {
        desc = "Previous term";
      };
    }
    {
      mode = "t";
      key = "<C-n>";
      action = "<cmd>FloatermNext<CR>";
      options = {
        desc = "Next term";
      };
    }
    {
      mode = "t";
      key = "<C-p>";
      action = "<cmd>FloatermPrev<CR>";
      options = {
        desc = "Previous term";
      };
    }
    {
      mode = "n";
      key = "<leader>ts";
      action = "<cmd>TSPlayground<cr>";
      options = {
        desc = "TSPlayground";
      };
    }
      # sane quitting
    {
      mode = "n";
      key = "<leader>qq";
      action = "<cmd>quit<cr>";
      options = {
        desc = "Quit one";
      };
    }
    {
      mode = "n";
      key = "<leader>qa";
      action = "<cmd>quitall<cr>";
      options = {
        desc = "Quit all";
      };
    }
      # ui
    {
      mode = "n";
      key = "<leader>uT";
      action = "<cmd>hi Normal guibg=NONE<cr>";
      options = {
        desc = "Transparency";
      };
    }
    {
      mode = "n";
      key = "<leader>uw";
      action = "<cmd>set wrap!<cr>";
      options = {
        desc = "Toggle wrap";
      };
    }
    {
      mode = "n";
      key = "<leader>ur";
      action = "<cmd>set relativenumber!<cr>";
      options = {
        desc = "Toggle relnr";
      };
    }
    {
      mode = "n";
      key = "<leader>un";
      action = "<cmd>set number!<cr>";
      options = {
        desc = "Toggle relnr";
      };
    }
    {
      mode = "n";
      key = "<leader>uC";
      action = "<cmd>Telescope colorscheme enable_preview=true<cr>";
      options = {
        desc = "Colorscheme with preview";
      };
    }
      # text
    {
      mode = "n";
      key = "<leader>xf";
      action = "<cmd>FlushLinesRegexp<cr>";
      options = {
        desc = "flush lines (regexp)";
      };
    }
    {
      mode = "n";
      key = "<leader>xk";
      action = "<cmd>KeepLines<CR>";
      options = {
        desc = "keep lines (regexp)";
      };
    }
    {
      mode = "n";
      key = "<leader>xe";
      action = "<cmd>FlushEmptyLines<CR>";
      options = {
        desc = "flush empty lines";
      };
    }
    {
      mode = "n";
      key = "<leader>xp";
      action = "<cmd>PopupDiacritics<CR>";
      options = {
        desc = "pick diacritics";
      };
    }
    {
      mode = "n";
      key = "<leader>xS";
      action = "<cmd>SplitPara<CR>";
      options = {
        desc = "split para to lines";
      };
    }
    {
      mode = "v";
      key = "<leader>xn";
      action = ":NumberLines<CR>";
      options = {
        desc = "number lines";
      };
    }
    {
      mode = "v";
      key = "<leader>xa";
      action = ":AlignOnChar<CR>";
      options = {
        desc = "align on char";
      };
    }
      # latin
    {
      mode = "n";
      key = "<leader>xll";
      action = "<cmd>CreateLayoutLatin<CR>";
      options = {
        desc = "dictionary mode";
      };
    }
    {
      mode = "n";
      key = "<leader>xlg";
      action = "<cmd>GetLineLatinGCSE<CR>";
      options = {
        desc = "line gcse";
      };
    }
    {
      mode = "n";
      key = "<leader>xla";
      action = "<cmd>GetLineLatinALevel<CR>";
      options = {
        desc = "line alevel";
      };
    }
      # greek
    {
      mode = "n";
      key = "<leader>xgl";
      action = "<cmd>CreateLayoutGreek<CR>";
      options = {
        desc = "dictionary mode";
      };
    }
    {
      mode = "n";
      key = "<leader>xgg";
      action = "<cmd>GetLineGreekGCSE<CR>";
      options = {
        desc = "line gcse";
      };
    }
    {
      mode = "n";
      key = "<leader>xga";
      action = "<cmd>GetLineGreekALevel<CR>";
      options = {
        desc = "line alevel";
      };
    }
      # yank
    {
      mode = "n";
      key = "<leader>yb";
      action = ''gg"+yG'';
      options = {
        desc = "yank buffer";
      };
    }
    {
      mode = "v";
      key = "<leader>yc";
      action = ''"_c'';
      options = {
        desc = "change (bh)";
      };
    }
    {
      mode = "v";
      key = "<leader>yd";
      action = ''"_d'';
      options = {
        desc = "delete (bh)";
      };
    }
    {
      mode = "v";
      key = "<leader>yx";
      action = ''"_x'';
      options = {
        desc = "delete (bh)";
      };
    }
    {
      mode = "n";
      key = "<leader>yp";
      action = ''"*gP'';
      options = {
        desc = "paste clipboard";
      };
    }
    {
      mode = "n";
      key = "<leader>yr";
      action = "<cmd>reg<CR>";
      options = {
        desc = "registers";
      };
    }

  ];
}
