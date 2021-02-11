# Pyxian OS

Pyxian OS is a custom build of Raspberry Pi OS (formerly Raspbian). It is specifically designed to run web-applications in kiosk mode and build web-based GUI applications for embedded systems. It includes a pre-installed custom browser run-time extended with low-level JavaScript APIs to access hardware interfaces and system functions.

The OS works on Raspberry Pi 3+ or Raspberry Pi 4 with any display attached.

## Typical applications

Pyxis can be used for digital signage, web kiosk, or an equipment control panel. It can also help to build a good-looking user interface for an Arduino or MCU hardware project.

## Features

### User-friendly settings app
Allows setting screen orientation, Wi-Fi, installing applications from the flash stick, and checking for software updates directly on your Raspberry Pi.

### JavaScript APIs for interfaces like UART, GPIO
Allow easy integration of UI with hardware. You can control sensors, mechanical components, and other peripheral devices right in the JavaScript layer of your user interface.

### Remote debugging from browser
Makes development faster and easier. Get all the benefits of JavaScript debugging like step-by-step code execution, exceptions and errors information, interactive running of commands, console log.

### Demos and examples
Learn from examples and demo applications that can also be used in projects and prototypes.

## FAQ

### How is it different from Raspberry Pi OS?
The user interface is different. It does not have the standard desktop environment of Raspberry Pi OS, but instead, it boots right into a kiosk-mode web browser. It can be set to load a predefined web address or a locally stored web application.

### Can I use Pyxian commercially?
Yes, you are free to use Pyxian for any purpose.

### How can I customize the image to add or remove pre-installed software?
The image build is done with the pi-gen tool, which is used to create official Raspberry Pi OS images. 
You can read more about image customization here: https://github.com/renetec-io/Pyxian/blob/master/docs/BUILDING.md

### Where to find the documentation?
See the Getting Started section on our website: https://www.renetec.io/pages/getting-started-with-pyxian-on-raspberry-pi
Then, check out the examples and demos in this GitHub repository: https://github.com/renetec-io/pyxis-apps