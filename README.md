## MySQL Docker Python project - by Gili Faibish

This program creates an ubuntu MySQL container with 2 databasese and two users (in addition to root), <br />
waits for that container to run (using a bash script that checks the MySQL container logs), <br />
and then connects 3 python apps (that run in parallel) to the databases from the 3 different users. <br />
#### to start : 
```bash
$ sh start.sh
```
