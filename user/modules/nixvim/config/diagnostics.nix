{
  plugins.trouble.enable = true;

  extraConfigLua = ''
    -- define diagnostic signs
    local function sign_define(args)
      vim.fn.sign_define(args.name, {
        texthl = args.name,
        text = args.text,
        numhl = "",
      })
    end

    sign_define({ name = 'DiagnosticSignError', text = '✘' })
    sign_define({ name = 'DiagnosticSignWarn', text = '▲' })
    sign_define({ name = 'DiagnosticSignHint', text = '⚑' })
    sign_define({ name = 'DiagnosticSignInfo', text = '»' })
  '';
}
