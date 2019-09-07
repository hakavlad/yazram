
## Yet another zram manager

This is service that makes swapspace on zram device with `disksize` = `2Memtotal` and `alg` = `zstd`.

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
