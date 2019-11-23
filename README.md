
## Yet another zram manager

This is a service that makes swap space on a zram device and tunes virtual memory to improve UX with swap space on zram. Edit `zram-on` to configure.


To install the latest version:
```bash
$ git clone https://github.com/hakavlad/yazram.git
$ cd yazram
$ sudo make install
```

To enable and start on systems with systemd:
```bash
$ sudo make systemd
```

To uninstall:
```bash
$ sudo make uninstall
```

To view the latest entries in the log (for systemd users):
```
$ sudo journalctl -eu yazram
```
