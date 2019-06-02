# b64sha

```b64sha``` is a Perl script to calculate, and compare, the SHA hash values (256 or 512 bits) and print them encoded in base64 instead of hexadecimal. The goal is to have 31% shorter SHA strings:

``` 
# hexadecimal value of SHA256 (SHA512), 64 (128) chars long
66a045b452102c59d840ec097d59d9467e13a3f34f6494e539ffd32c1bb35f18
c2bad2223811194582af4d1508ac02cd69eeeeedeeb98d54fcae4dcefb13cc882e7640328206603d3fb9cd5f949a9be0db054dd34fbfa190c498a5fe09750cef

# base64 value of SHA256 (SHA512), 44 (88) chars long
ZqBFtFIQLFnYQOwJfVnZRn4To/NPZJTlOf/TLBuzXxg=
wrrSIjgRGUWCr00VCKwCzWnu7u3uuY1U/K5NzvsTzIgudkAyggZgPT+5zV+Umpvg2wVN00+/oZDEmKX+CXUM7w==
``` 

You may compare the output of this script with these commands (replace **-sha256** with **-sha512** for the 512 bits version):

``` 
openssl dgst -binary -sha256 some_filename | openssl base64
``` 


## Parameters
```b64sha``` can receive the following parameters:
```
file1 file2 ...        --> Calculates and prints the SHA values of file1 file2 ..., encoded in Base64
--check|-c filename    --> Compares the SHA values stored in filename with the calculated ones 
                           and prints [ OK ] or [FAIL]. It is able to automatically detect if it's
                           a 256 or 512 bits version of SHA
--bits|-b 256|512      --> Choose SHA bit lenght, default value is 256
--stdin|-s             --> Read data from STDIN
--help|-h              --> Print help message
```

## Installation
Installation is not requeired, but on Linux you can download the script and do:
```
$ sudo ./install.sh
```
The default install dir is ```/usr/local/bin```. If you want a different location edit the script and change the value of ``` INSTALL_DIR```


### Requirements
This script was developed and tested under Ubuntu 18.04, but should work on other \*nixes and also Windows as long as the following Perl packages are present: 
```
Getopt::Long
Digest::SHA
```

## Examples
The following examples assume that **b64sha** is located on a directory included on the **$PATH**. If that's not the case, just replace ```b64sha``` by ```./b64sha```:

```
$ b64sha somefile.txt
2iQX4HpSg7jV0mkFKC4Puihxtt+8hlZRYvaj/V29PNg=  somefile.txt

$ b64sha -b 512 *.doc
pcw2NuOOATAyMMhAb+urDI0iWbbRGgVA+PNgqXG30qaGAAyZmmF2ujw9Gb1RaGxpA+kcgumKEkc+ZSbpI0Ue6w==  1.doc
3bMv9M3cdG9HliNjJmKBDOyltmRXiUTOi3z1jyqThQ//G47QOQLM36qt2crnEzPm3HzHpnIHAnxU5tmttIQp9Q==  2.doc

$ echo -n "Hello" | b64sha -s
GF+NsyJx/iX1Yab8k4suJkMG7DBO2lGAB9F2SCY4GWk=  -

$ b64sha *.txt > SHA256
$ echo " " >> 4.txt
$ rm 5.txt
$ b64sha -c SHA256
[  OK  ]  1.txt
[  OK  ]  2.txt
[  OK  ]  3.txt
[ FAIL ]  4.txt
[NOFILE]  5.txt


$ b64sha non_existing_file.txt 1.txt
--------------- No such file ---------------  non_existing_file.txt
2iQX4HpSg7jV0mkFKC4Puihxtt+8hlZRYvaj/V29PNg=  1.txt
```
