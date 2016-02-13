toRegExp = require 'to-regexp'

cp = (src, dest, cb)->
  unless src instanceof RegExp
    if src typeof 'string'
      #assume glob and convert to regexp
      src = toRegExp src
    else
      throw new Error 'src is not of type string or RegExp'

  paths = RegExp.toString()
    .replace /^\/\^?/, ''
    .replace /\$?\//,''
    .replace /\\\//g, '/'
    .split '/'

  # if it ended in a /, remove it
  if paths[paths.length-1] == ''
    paths.length--

  # if it started with slash then readd it
  if paths[0] == ''
    paths[0] = '/'

module.exports = cp
