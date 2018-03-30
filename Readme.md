### Server side
```
cabal install happstack-server
sudo mkdir /test
sudo chmod 777 /test
strace -f runhaskell happstack.hs 2>&1 |  grep tmp
```

### Client side

```
cat request.txt | telnet localhost 8000
```
Results in creating of the file:
```
[pid 19658] open("/tmp/../test/test1804289383846930886.txt", O_RDWR|O_CREAT|O_EXCL|O_NOCTTY|O_NONBLOCK, 0600 <unfinished ...>
```

```
curl 'http://localhost:8000/hello'  -H 'Content-Type: multipart/form-data; boundary=----12345' -H "Keep-Alive: 60" -H 'Connection: keep-alive' --data-binary $'------12345\r\nContent-Disposition: form-data; name="file_upload"; filename="../test/testfile.txt"\r\nContent-Type: text/plain\r\n\r\nTESTTEST\r\n------12345--\r\n'
```
Results in:
```
[pid 19658] open("/tmp/../test/testfile1957747793424238335.txt", O_RDWR|O_CREAT|O_EXCL|O_NOCTTY|O_NONBLOCK, 0600 <unfinished ...>
[pid 19658] unlink("/tmp/../test/testfile1957747793424238335.txt") = 0
```



