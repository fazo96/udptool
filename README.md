# UdpTool

Simple tool to send and receive UDP text messages and files over the network built as a school homework.

## Usage

    Usage: udptool <command> <args...> [options...]

    Commands:

      listen <port>                         listen for datagrams on given Port
      send <msg> <address> <port>           send a string message to given IP and Port
      sendfile <filepath> <address> <port>  send a text file to given IP and Port

    Options:

      -h, --help        output usage information
      -V, --version     output the version number
      -s, --silent      avoid informational messages
      -r, --raw         output raw text in datagrams without writing metadata
      -ne, --no-errors  avoid error messages
      -o, --one         exit after receiving one message

## Development

1. `npm install` from the project directory to install dependencies
2. `npm run build` or `./build.sh` from the project directory to build the executable.

## License

The MIT License (MIT)

Copyright (c) 2014 Enrico Fasoli

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
