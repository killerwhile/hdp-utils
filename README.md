Utilities around HDP and Hadoop
===

## Get informed about HDP Version Updates

You always wonder when HDP version is updated? This script is right for you:

[hdp-updates-detection.sh](hdp-updates-detection.sh)

Run it daily or weekly as a cron and ensure the output is sent to you via email:

```
$ crontab -e
# Run every day at 6am
0 6 * * * /path/to/hdp-updates-detection.sh
# Run every Monday at 6am
0 6 * * 1 /path/to/hdp-updates-detection.sh

# Ensure the local account is forwarded to the right email address
$ echo "my@email" > ~/.forward
```

## Implementation Notes

HortonWorks is publishing all the latest releases here: 
[http://s3.amazonaws.com/dev.hortonworks.com/HDP/hdp_urlinfo.json](http://s3.amazonaws.com/dev.hortonworks.com/HDP/hdp_urlinfo.json)
This scripts is simply polling an diff'ing two consecutive versions.