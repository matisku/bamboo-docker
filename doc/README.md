# How to setup Bamboo Stack in Rancher?

Below you can find some info how to setup Bamboo Stack in couple of minutes using Rancher.

## Setup Rancher
Add [rancher-catalog](https://github.com/matisku/rancher-catalog.git) to the **Rancher**.
![alt text](https://github.com/matisku/bamboo-docker/blob/master/doc/images/setup-stack-1.png "setup stack 1")

Then use **Bamboo** to create a new stack.
![alt text](https://github.com/matisku/bamboo-docker/blob/master/doc/images/setup-stack-1.png "setup stack 1")

## Setup Bamboo Stack
First **Configure Rancher Stack**. If there is no need to edit any values, keep it default. 
![alt text](https://github.com/matisku/bamboo-docker/blob/master/doc/images/bamboo-rancher-1.png "bamboo rancher 1")

Once **Bamboo Stack** will be lanched it will create 5 containers:  
1. `postgres`  
2. `postgres` sidekick with volume data  
3. `bamboo-server`  
4. `bamboo-server` sidekick with volume data  
5. `bamboo-agent`  
![alt text](https://github.com/matisku/bamboo-docker/blob/master/doc/images/bamboo-rancher-2.png "bamboo rancher 2")

Now **Bamboo** need some time to auto setup. Status of this process can be monitored via **Rancher**.
![alt text](https://github.com/matisku/bamboo-docker/blob/master/doc/images/bamboo-rancher-3.png "bamboo rancher 31")
![alt text](https://github.com/matisku/bamboo-docker/blob/master/doc/images/bamboo-rancher-4.png "bamboo rancher 4")

In a meantime we can monitor the status of **Bamboo Agent**. It's still waiting for a **Bamboo Server**.
![alt text](https://github.com/matisku/bamboo-docker/blob/master/doc/images/bamboo-rancher-5.png "bamboo rancher 5")

## Setup Bamboo Server
Let's start with **Bamboo Confuguration**. To get license key create account on [Atlassian](http://atlassian.com) and generate a evaluation key. Next use `Custom installation` button
![alt text](https://github.com/matisku/bamboo-docker/blob/master/doc/images/bamboo-rancher-6.png "bamboo rancher 6")

When you get to the database configuration, select `PostgreSQL`.
![alt text](https://github.com/matisku/bamboo-docker/blob/master/doc/images/bamboo-rancher-7.png "bamboo rancher 7")

Fill in the nececery data based on **Rancher** configuration. The default values are shown below.
![alt text](https://github.com/matisku/bamboo-docker/blob/master/doc/images/bamboo-rancher-8.png "bamboo rancher 8")

Next create a new **Bamboo Home**. It will be stored on a sidekick container.
![alt text](https://github.com/matisku/bamboo-docker/blob/master/doc/images/bamboo-rancher-9.png "bamboo rancher 9")

It's time to setup administrator user.
![alt text](https://github.com/matisku/bamboo-docker/blob/master/doc/images/bamboo-rancher-10.png "bamboo rancher 10")

Once **Bamboo Serve**r is setup, **Bamboo Agent** will do an autoconfiguration, which can be seen in logs. 
![alt text](https://github.com/matisku/bamboo-docker/blob/master/doc/images/bamboo-rancher-11.png "bamboo rancher 11")

## Bamboo Agent Configuration
After a few minutes, in **Bamboo Agents** administration new Agent will appear. If you want to add it use `Approve access`. If you want to have future agents to be added automatically use `Disable remote agent authentication`.
![alt text](https://github.com/matisku/bamboo-docker/blob/master/doc/images/bamboo-rancher-12.png "bamboo rancher 12")

**Congratulations!** Now **Bamboo Agent** is fully operational!
![alt text](https://github.com/matisku/bamboo-docker/blob/master/doc/images/bamboo-rancher-13.png "bamboo rancher 13")
![alt text](https://github.com/matisku/bamboo-docker/blob/master/doc/images/bamboo-rancher-14.png "bamboo rancher 14")

But, what if we don't like such a silly hostname like on example above? No problem, let's upgrade **Bamboo Agent**.
![alt text](https://github.com/matisku/bamboo-docker/blob/master/doc/images/bamboo-rancher-15.png "bamboo rancher 15")

If you need to install more packages, you can do this now. Just enter `apt` packages names like listed below.
![alt text](https://github.com/matisku/bamboo-docker/blob/master/doc/images/bamboo-rancher-16.png "bamboo rancher 16")

To set "user friendly" hostname, go to `Networking` tab and setels `Use the container name`.
![alt text](https://github.com/matisku/bamboo-docker/blob/master/doc/images/bamboo-rancher-17.png "bamboo rancher 17")

After the upgrade we will see a a new agent and an old one. Since the old one is not working anymore, let's remove it.
![alt text](https://github.com/matisku/bamboo-docker/blob/master/doc/images/bamboo-rancher-18.png "bamboo rancher 18")

## Scale it!
**Scale Time!** Let's scale our **Bamboo Agents** with one click!
![alt text](https://github.com/matisku/bamboo-docker/blob/master/doc/images/bamboo-rancher-19.png "bamboo rancher 19")

Voila! Now we have 5 new **Bamboo Agents**.
![alt text](https://github.com/matisku/bamboo-docker/blob/master/doc/images/bamboo-rancher-20.png "bamboo rancher 20")
![alt text](https://github.com/matisku/bamboo-docker/blob/master/doc/images/bamboo-rancher-21.png "bamboo rancher 21")

## Upgrade
The same way we can upgrade our **Bamboo Server** if new version is available. We are storing **BAMBO_HOME** on different container, so after upgrade, everything will be fully operational. Also remember to upgrade a agent version!
![alt text](https://github.com/matisku/bamboo-docker/blob/master/doc/images/bamboo-rancher-22.png "bamboo rancher 22")
