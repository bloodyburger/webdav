# Webdav
This is a simple Webdav server based on Nginx. You can use it to upload files via supported clients.
Note: Directory listing is not enabled.

# Why
I have multiple storage servers and wanted an easy way to upload files to the server without doing any FTP or other setup. Although I have used docker plenty of times for self hosting, I also wanted to 
try and create an image that I can reuse across servers. This is just a beginning, I am thinking of adding more options/features when I get time and based on use cases.

# Usage

## docker-compose
```
docker run --name webdav -d -p 3456:80 -v /path:/var/dav/webdav_root 0tkali/webdav

```

Default username: admin
Default password: admin


## TODO
- Configurable user/password
- Build using Alpine
- SSL
- Any other best practises

## Feedback
Please raise an issue for any queries/feedback.
