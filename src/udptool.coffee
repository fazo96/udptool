#!/usr/bin/env coffee

# UDPTOOL written by Enrico Fasoli

fs = require 'fs'
program = require 'commander'
program
  .version '0.0.5'
  .usage '<command> <args...> [options...]'
  .option '-s, --silent', 'avoid informational messages'
  .option '-r, --raw', 'output raw text in datagrams without writing metadata'
  .option '-ne, --no-errors', 'avoid error messages'
  .option '-o, --one', 'exit after receiving one message'

program.command 'listen <port>'
  .description 'listen for datagrams on given Port'
  .action (port) ->
    socket = require('dgram').createSocket 'udp4'
    socket.on 'error', (err) -> console.log err unless program.no-errors
    socket.on 'listening', ->
      unless program.silent
        console.log 'Started listening for datagrams on port ' + port
    socket.on 'message', (msg,src) ->
      if program.raw then console.log ''+msg
      else console.log '(From '+src.address+', '+src.size+' bytes): '+msg
      if program.one then socket.close(); process.exit 0
    socket.bind port

program.command 'send <msg> <address> <port>'
  .description 'send a string message to given IP and Port'
  .action (msg,addr,port) ->
    socket = require('dgram').createSocket 'udp4'
    buf = new Buffer msg
    socket.send buf, 0, buf.length, port, addr, (err, bytes) ->
      if err then console.log err unless program.no-errors
      else console.log 'Message Sent to '+addr+':'+port unless program.silent
      socket.close()

program.command 'sendfile <filepath> <address> <port>'
  .description 'send a text file to given IP and Port'
  .action (fp,addr,port) ->
    socket = require('dgram').createSocket 'udp4'
    fs.readFile fp, (error,content) ->
      if error then return console.log error unless program.no-error
      buf = new Buffer content
      socket.send content, 0, buf.length, port, addr, (err, bytes) ->
        if err then console.log err unless program.no-errors
        else console.log 'File Sent to '+addr+':'+port unless program.silent
        socket.close()

res = program.parse process.argv
program.outputHelp() if res.args.length is 0 and not program.silent
