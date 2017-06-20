# Docker containers statistics notifications in Rocket

Monitor Docker containers resource utilization statistics and post alarm messages to a Rocket channel:

Environment variables needed:
<ul>
 	<li>ROCKET_WEBHOOK_URL: the webhook url for your Rocket team</li>
 	<li>ROCKET_USERNAME: the username for the incoming messages</li>
 	<li>ROCKET_ICON_EMOJI: the emoji for the incoming messages</li>
 	<li>PERCENTAGE_MEMORY: maximum percentage of RAM memory used for each container. When the percentage of used memory will exceed this threshold, an alarm will be posted to the Rocket channel</li>
 	<li>PERCENTAGE_CPU: maximum percentage CPU usage for each container. When the CPU percentage usage will exceed this threshold, an alarm will be posted to the Rocket channel</li>
 	<li>SLEEP_TIME (seconds) : interval between each message posted to Rocket. Number of seconds between messages, unique for container.</li>
</ul>

To run the script:

```shell
$ ROCKET_WEBHOOK_URL=https://rocket.alterway.fr/yourRocketWebHookId
   ROCKET_USERNAME="rocketbot" ROCKET_ICON_EMOJI=":whale:"
   PERCENTAGE_MEMORY=20 PERCENTAGE_CPU=40 SLEEP_TIME=60 
   python3 docker_stat.py

or with docker image

$ docker run  --rm -ti \
-e ROCKET_WEBHOOK_URL="https://rocket.alterway.fr/hooks/yourRocketWebHookId" \
-e ROCKET_USERNAME="rocket.cat" \
-e ROCKET_ICON_EMOJI=":rocket:" \
-e PERCENTAGE_MEMORY="80" \
-e PERCENTAGE_CPU="85" \
-e SLEEP_TIME="60" \
-v /var/run/docker.sock:/var/run/docker.sock \
docker-stat

```


Code reference:
 * Deeply inspired by : [docker-stats-slack](https://github.com/mz1991/docker-stats-slack) : Docker containers stats notifications in Slack
 * [docker-py](https://github.com/docker/docker-py) to connect to the Docker deamon