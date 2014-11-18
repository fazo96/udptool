#!/usr/bin/env coffee

# UDPTOOL written by Enrico Fasoli

program = require 'commander'
program
  .version '0.0.1'
  .usage 'send or receive text messages using UDP'

program.command 'listen <port>'
  .description 'listen for datagrams on given Port'
  .action (port) ->
    socket = require('dgram').createSocket 'udp4'
    socket.on 'error', (err) -> console.log err
    socket.on 'listening', -> console.log 'Started listening'
    socket.on 'message', (msg,src) -> console.log '('+src.address+') '+msg
    socket.bind port

program.command 'send <msg> <ip> <port>'
  .description 'send a string message to given IP and Port'
  .action (msg,ip,port) ->
    socket = require('dgram').createSocket 'udp4'
    buf = new Buffer msg
    socket.send buf, 0, buf.length, port.parent.rawArgs[5], ip, (err, bytes) ->
      if err then console.log err
      else console.log 'Message Sent'
      socket.close()

program.outputHelp()
program.parse(process.argv)
