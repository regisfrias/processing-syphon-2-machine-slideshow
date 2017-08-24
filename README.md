# Processing–Syphon 2-machine slideshow

This is a simple application (server) that sends a slideshow via Syphon to another program and an OSC message to another computer (or program) running the client application.

## Setup

Adjust config.json to reflect your environment. Ports don't need to be changed, but remoteIp most likely. This should be the local address of the Client (remote) machine.

Create `content-server.txt` and `content-client.txt` in the root folder with your text content. Each line is a slide. Empty lines are blank slides.

## Playback

- `spacebar` or `right arrow` move slideshow forward
- `left arrow` move slideshow backward
