_G.ulinaaron = {}

-- TODO: supported_configs
ulinaaron.supported_configs = { ulinaaron.install.home }
if ulinaaron.install.home ~= ulinaaron.install.config then
  vim.opt.rtp:append(ulinaaron.install.config)
  --- supported ulinaaron user conifg folders
  table.insert(ulinaaron.supported_configs, ulinaaron.install.config)
end
