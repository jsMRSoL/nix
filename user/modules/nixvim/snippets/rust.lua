local luasnip = require('luasnip')
local s = luasnip.snippet
local sn = luasnip.snippet_node
local t = luasnip.text_node
local i = luasnip.insert_node
local c = luasnip.choice_node
local d = luasnip.dynamic_node
local f = luasnip.function_node
local rep = require('luasnip.extras').rep

return {
  s('pln', {
    -- equivalent to "println!(text{}text);"
    t('println!("'),
    i(1, 'text '),
    c(2, {
      sn(1, {
        t('{'),
        i(1, 'var'),
        t('}'),
        i(2, ' text'),
        t('");'),
        i(0, ''),
      }),
      sn(2, {
        t('{}'),
        i(1, ' text'),
        t('", '),
        i(2, 'var'),
        t(');'),
        i(0, ''),
      }),
      sn(3, {
        t('{'),
        i(1, 'name'),
        t('}'),
        i(2, ' text'),
        t('", '),
        rep(1),
        t('='),
        i(3, 'var'),
        t(');'),
        i(0, ''),
      }),
    }),
  })
}, {}
