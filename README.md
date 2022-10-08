# Perl-Tk-Dual-Robot
This project uses Perl to control two or more robots using pigpio remote access.

## Getting Started

I have provided a cpanfile to install the required libraries. Once the libraries have been installed make sure to have Remote GPIO enabled on both or more Pis using `sudo pigpiod`, running `sudo raspi-config` and then enabling Remote GPIO under interfaces or using the Raspberry Pi Configuration Menu and making sure Remote GPIO is enabled. Then run the application with `perl dual-robot.pl` and you should see both GUIs appear on the screen. This has been tested on Linux but can also run on Windows and Mac. With Windows there will have to be some minor changes to the display settings on the second window.

![app](https://github.com/sentairanger/Perl-Tk-Dual-Robot/blob/main/dual-robot.png)
