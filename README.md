# Processing–Syphon 2-machine slideshow

This is a pair of simple applications to play a slideshow simultaneously in two computers. The Server sends an OSC message to another computer (or program) running the Client application. Previous/next slide commands are send from keyboard on the Server and plays them in that application and triggers previous/next slide also on the Client.

Both applications send Syphon frames to be used by some other program (Resolume, VPT, Modul8, etc.).

## Setup

Adjust config.json to reflect your environment. Ports don't need to be changed, but remoteIp most likely. This should be the local address of the Client (remote) machine.

Create `content-server.txt` and `content-client.txt` in the root folder with your text content. Each line is a slide. Empty lines are blank slides.

## Playback

- `spacebar` or `right arrow` move slideshow forward
- `left arrow` move slideshow backward
