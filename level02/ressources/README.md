# Level02

## Context
We found `level02.pcap` in our home, you can find it in the Ressources dir.

## Resolution
 * `.pcap` is the extension for wireshark capture of packets, so we install this program.
 * In Wireshark we can see that Packet n*43 got the word `Password:`, we assume it's a request for password sent by `59.233.235.223` to `59.233.235.218`.
 * We then look for the following `PSH` packet from `59.233.235.218`.
 * They are each 1 character long, and some of them contain the `DEL` character, which we assume cancel the previous character sent.
 * Reading this package until the carriage return `\r` gives us `ft_waNDReL0L`, which is the password for flag02.
 

