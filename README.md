# Shoshin Code (Rails API Backend)
([Frontend Repo](https://github.com/jaf7/shoshin-code-frontend))

A coding practice and mentorship platform that integrates coding exercises with an editor and repl, offers real-time session sharing across a network and session saving for any editor/exercise combination. A SPA that features ES6 evaluation, code highlighting, secure user authentication, WebSocket session streaming and exercises from the CodeWars API.

## Motivation
This app is born from a deep appreciation of online coding environments like [Repl.it](https://repl.it). A way of thinking, creating and building that started with the Unix time sharing systems of old is coming into its own in an incredible way: collaborative work across the network is how we're building the future. I find this way of building fascinating and want to understand it better. This is the first iteration of my effort in this regard. It's intended to be a learning experience not only in its building but in its use.

# Demo
➡️  &nbsp; Use it [here](https://shoshin-code-frontend.herokuapp.com/)

➡️  &nbsp; Watch it [here](#)

[![Watch demo](https://i.imgur.com/UrAkFo9.png)](#)
<img src="https://i.imgur.com/0lC6aM3.png">
<img src="https://i.imgur.com/z3TFN0B.png">

## Installation
Nothing to install. Shoshin runs in your browser, including the sandboxed JavaScript interpreter.

## Built With
* [React](https://reactjs.org/)
* [Redux](https://github.com/reduxjs/redux/blob/master/README.md)
* [React Router](https://reacttraining.com/react-router/)
* [Rails](https://rubyonrails.org/) RESTful API with [PostgreSQL](https://www.postgresql.org/) ([Rails Backend Repo](https://github.com/jaf7/shoshin-code-backend))
* [ActionCable](http://guides.rubyonrails.org/action_cable_overview.html) WebSockets with [Redis Pub/Sub](https://redis.io/topics/pubsub)
* [JWT](https://jwt.io/) / [ruby-jwt](https://github.com/jwt/ruby-jwt/blob/master/README.md) / [Bcrypt](https://github.com/codahale/bcrypt-ruby/blob/master/README.md) hashing
* [Ace Editor](https://github.com/ajaxorg/ace/blob/master/Readme.md)
* [React-Ace](https://github.com/securingsincity/react-ace)
* [VM.js](https://github.com/tarruda/vm.js/) ES6 bytecode compiler and VM
* [React-MD](https://react-md.mlaursen.com/) Material Design Library
* Custom SASS additions using [node-sass-chokidar](https://www.npmjs.com/package/node-sass-chokidar) preprocessor

## To-do
 - [ ] Implement chat using Pusher Chatkit with WebSockets
 - [ ] Add read/write access toggling for 2nd party
 - [ ] Protect infinite loops

## License

The MIT License (MIT)

Copyright (c) 2018 by Anthony Fields

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.