# EFT Log Location

Shell script to log location of the server connected to in game.

With the server list set to automatic, I was interested in seeing to what server location the game connects to.

This script reads the application log of Escape from Tarkov. Every time the game connects to a raid, it prints the IP and location of the server that it connects to.

## Exmaple Output

```
$ ~/code/eft-locations/eft-locations.sh
using latest log file: /c/Battlestate Games/escapefromtarkov/Logs/log_2021.03.09_17-48-09_0.12.9.10988/2021.03.09_17-48-09_0.12.9.10988 application.log
151.106.28.234 France
151.106.28.234 France
92.204.161.26 France
151.106.3.186 France
```

## Runtime

Get a bash for windows, or cygwin or similar. The script is built upon bash commands like `ls`, `grep`, `sed`, `curl`.

I am using [Git Bash](https://gitforwindows.org/).

## Setup

- Download the script and make it executable,
- set variables in `~/.eft-locations`,
- start the game,
- run eft-locations.sh

### Config

Config is expected to be at `~/.eft-locations`:
```
LOGS='/c/Battlestate Games/escapefromtarkov/Logs'
API_KEY='000000000000000000000'
```
- You might need to update the path to the Logs directory
- Get an Api Key from [ipstack](https://ipstack.com/signup/free) and put it in the `API_KEY` property.

