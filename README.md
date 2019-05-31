# b64sha

```b64sha``` is a Perl script to calculate and verify the SHA (256 or 512) hash values of files and prints them encoded in Base64 instead of hexadecimal. The output of this script should be the same as one of these commands:

``` openssl dgst -binary -sha256 some_filename | openssl base64 ```

 or:
 
``` openssl dgst -binary -sha512 some_filename | openssl base64 ```

This script was developed and tested under Ubuntu 18.04, but should work on other \*nixes and also Windows as log as the following Perl packages are present: 
```
Getopt::Long
Digest::SHA
```


## Parameters
  
```
file1 file2 ...        --> Calculates and prints the SHA values, encoded in Base64, of the files
--check|-c filename    --> Compares the SHA values stored in filename with the calculated ones 
                           and prints [ OK ] or [FAIL]. It is able to automatically detect if it's
                           a 256 or 512 bits version of SHA
--bits|-b 256|512      --> Choose SHA bit lenght, default value is 256
--help|-h              --> Print help message
```

## Installation
Installation is not requeired, but on Linux you can download the script and do:
```
$> chmod +x ./b64sha
$> sudo mv ./b64sha /usr/local/bin
```

## Examples
The following examples assume that **b64sha** is located on a directory included on the **$PATH**. If that's not the case, just replace ```b64sha``` by ```./b64sha```:

```
$> b64sha somefile.txt
2iQX4HpSg7jV0mkFKC4Puihxtt+8hlZRYvaj/V29PNg=  somefile.txt

$> b64sha -b 512 *.doc
pcw2NuOOATAyMMhAb+urDI0iWbbRGgVA+PNgqXG30qaGAAyZmmF2ujw9Gb1RaGxpA+kcgumKEkc+ZSbpI0Ue6w==  1.doc
3bMv9M3cdG9HliNjJmKBDOyltmRXiUTOi3z1jyqThQ//G47QOQLM36qt2crnEzPm3HzHpnIHAnxU5tmttIQp9Q==  2.doc

$> b64sha *.txt > SHA256
$> echo "" >> 4.txt
$> b64sha -c SHA256
[ OK ]  1.txt
[ OK ]  2.txt
[ OK ]  3.txt
[FAIL]  4.txt
```
