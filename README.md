# Processing–Syphon 2-machine slideshow

This is a simple application (server) that sends a slideshow via Syphon to another program and an OSC message to another computer (or program) running the client application.

Adjust config.json to reflect your environment. Ports don't need to be changed, but remoteIp most likely. This should be the local address of the Client (remote) machine.

- `spacebar` or `right arrow` move slideshow forward
- `left arrow` move slideshow backward

The text in the slideshow comes from a .txt file inside the `data` folder in both applications (Server and Client). Each line is a slide.
