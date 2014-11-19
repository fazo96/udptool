#!/usr/bin/env coffee

# UDPTOOL written by Enrico Fasoli

program = require 'commander'
program
  .version '0.0.2'
  .usage '<command> <args...> [options...]'
  .option '-s, --silent', 'useful when parsing the output from stdout'
  .option '-ne, --no-errors', "don't output errors to stdout"

program.command 'listen <port>'
  .description 'listen for datagrams on given Port'
  .action (port) ->
    socket = require('dgram').createSocket 'udp4'
    socket.on 'error', (err) -> console.log err
    socket.on 'listening', ->
      console.log 'Started listening' unless program.silent
    socket.on 'message', (msg,src) -> console.log '('+src.address+') '+msg
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

res = program.parse process.argv
program.outputHelp() if res.args.length is 0 and not program.silent
