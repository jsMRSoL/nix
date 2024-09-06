{
  autoCmd = [
    {
      event = "LspAttach";
      desc = "LspAttach";
      callback = {
        __raw = ''
        function (event)
          local bufnr = event.buf
          local nmap = function (keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
          end

          nmap('<leader>lr', vim.lsp.buf.rename, 'Rename')
          nmap('<leader>la', vim.lsp.buf.code_action, 'Code action')
          -- Jump to the definition of the word under your cursor.
          --  This is where a variable was first declared, or where a function is defined, etc.
          --  To jump back, press <C-t>.
          nmap('gd', vim.lsp.buf.definition, 'Go to definition')
          -- Find references for the word under your cursor.
          nmap('gr', require('telescope.builtin').lsp_references,
            'Go to references')
          -- Jump to the implementation of the word under your cursor.
          --  Useful when your language has ways of declaring types without an actual implementation.
          nmap('gI', require('telescope.builtin').lsp_implementations,
            'Go to implementation')
          -- Jump to the type of the word under your cursor.
          --  Useful when you're not sure what type a variable is and you want to see
          --  the definition of its *type*, not where it was *defined*.
          nmap('<leader>ld', vim.lsp.buf.type_definition, 'Type definition')
          -- Fuzzy find all the symbols in your current document.
          --  Symbols are things like variables, functions, types, etc.
          nmap('<leader>ls', require('telescope.builtin').lsp_document_symbols,
            'Document symbols')
          -- Fuzzy find all the symbols in your current workspace.
          --  Similar to document symbols, except searches over your entire project.
          nmap('<leader>lws',
            require('telescope.builtin').lsp_dynamic_workspace_symbols,
            'Workspace symbols')

          -- diagnostics
          nmap('[d', vim.diagnostic.goto_next, 'Next diagnostic')
          nmap(']d', vim.diagnostic.goto_prev, 'Previous diagnostic')

          -- See `:help K` for why this keymap
          nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
          nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

          -- Lesser used LSP functionality
          nmap('gD', vim.lsp.buf.declaration, 'Goto Declaration')
          nmap('<leader>lwa', vim.lsp.buf.add_workspace_folder,
            'Workspace Add Folder')
          nmap('<leader>lwr', vim.lsp.buf.remove_workspace_folder,
            'Workspace Remove Folder')
          nmap('<leader>lwl', function ()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, 'Workspace List Folders')
          --
          -- -- Set some keybinds conditional on server capabilities
          nmap('<space>lf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>',
            'Format buffer')

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              callback = vim.lsp.buf.clear_references,
            })
          end
        end
        '';
      };
    }
  ];
}
