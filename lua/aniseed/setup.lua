local _2afile_2a = "fnl/aniseed/setup.fnl"
local _2amodule_name_2a = "aniseed.setup"
local _2amodule_2a
do
  package.loaded[_2amodule_name_2a] = {}
  _2amodule_2a = package.loaded[_2amodule_name_2a]
end
local _2amodule_locals_2a
do
  _2amodule_2a["aniseed/locals"] = {}
  _2amodule_locals_2a = (_2amodule_2a)["aniseed/locals"]
end
local autoload = (require("aniseed.autoload")).autoload
local a, env, eval, nvim = autoload("aniseed.core"), autoload("aniseed.env"), autoload("aniseed.eval"), autoload("aniseed.nvim")
do end (_2amodule_locals_2a)["a"] = a
_2amodule_locals_2a["env"] = env
_2amodule_locals_2a["eval"] = eval
_2amodule_locals_2a["nvim"] = nvim
local function init()
  local function _1_(cmd)
    local ok_3f, res = eval.str(cmd.args, {})
    if ok_3f then
      return nvim.echo(res)
    else
      return nvim.err_writeln(res)
    end
  end
  nvim.create_user_command("AniseedEval", _1_, {nargs = 1})
  local function _3_(cmd)
    local code = a.slurp(cmd.args)
    if code then
      local ok_3f, res = eval.str(code, {})
      if ok_3f then
        return nvim.echo(res)
      else
        return nvim.err_writeln(res)
      end
    else
      return nvim.err_writeln(("File '" .. (cmd.args or "nil") .. "' not found"))
    end
  end
  nvim.create_user_command("AniseedEvalFile", _3_, {nargs = "?", complete = "file"})
  if nvim.g["aniseed#env"] then
    return env.init(nvim.g["aniseed#env"])
  else
    return nil
  end
end
_2amodule_2a["init"] = init
return _2amodule_2a
