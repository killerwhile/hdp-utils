Utilities around HDP and Hadoop
===

## Get informed about HDP Version Updates

You always wonder when HDP version is updated? This script is right for you:

[hdp-updates-detection.sh](hdp-updates-detection.sh)

Run it daily as a cron and ensure the output is sent to you via email:

```
$ crontab -e
# Run at 6am every day
0 6 * * * /path/to/hdp-updates-detection.sh

# Ensure the local account is forwarded to the right email address
$ echo "my@email" > ~/.forward
```
