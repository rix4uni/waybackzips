# waybackzips

## Requirements
```
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
```

## Installation
```
git clone https://github.com/rix4uni/waybackzips.git
cd waybackzips
chmod +x ./waybackzips.sh
```

## Usage
```
OPTIONS:
    -s     Scan all Target (subs.txt)
    -u     Scan all (urls.txt)
    -t     number of threads to use (default 100)
    -f     fullscan - (if you have already subs.txt file)
    -q     quickscan - (if you have already urls.txt file)
    
USAGE EXAMPLES:
    ./waybackzips.sh -s subs.txt -t 100 -f
    ./waybackzips.sh -u sensitive-urls.txt -t 100 -q
    or
    ./waybackzips.sh -u urls.txt -t 100 -q
```
