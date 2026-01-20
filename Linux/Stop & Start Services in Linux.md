Services are essential background processes that are usually run while booting up and shut down with the OS.

If you are a normal desktop user, you may come across the need to restart a service like [setting up Barrier for sharing mouse and keyboard between computers](https://itsfoss.com/keyboard-mouse-sharing-between-computers/) or when you are [using ufw to setup firewall](https://itsfoss.com/set-up-firewall-gufw/).

Today I will show you two different ways you can manage services. You’ll learn to start, stop and restart services in Ubuntu or any other Linux distribution.

- Method 1 uses systemd and you manage services with `systemctl` command
- Method 2 uses init and you manage services with `service` command
### Method 1: Managing services in Linux with systemd

I am starting with systemd because of the obvious reason of its widespread adoption.
### 1\. List all services

In order to manage the services, you first need to know what services are available on your system.

You can use the systemd command to list all the services on your Linux system:

```
systemctl list-unit-files --type service -all
```

[![systemctl list-unit-files](https://itsfoss.com/content/images/wordpress/2019/12/systemctl_list_services.png)](https://itsfoss.com/content/images/wordpress/2019/12/systemctl_list_services.png)
systemctl list-unit-files

This command will output the state of all services. The value of a service’s state can be enabled, disabled, masked (inactive until mask is unset), static and generated.

Combine it with the [grep command](https://linuxhandbook.com/grep-command-examples/?ref=itsfoss.com) and you can **display just the running services**:

```
sudo systemctl | grep running
```

[![Display running services systemctl](https://itsfoss.com/content/images/wordpress/2019/12/systemctl_grep_running.jpg)](https://itsfoss.com/content/images/wordpress/2019/12/systemctl_grep_running.jpg)
Display running services systemctl

Now that you know how to reference all different services, you can start actively managing them.

**Note:** **<service-****name>** **in the commands should be replaced by the name of the service you wish to manage (e.g. network-manager, ufw etc.).**
### **2\. Start a** service

To start a service in Linux, you just need to use its name like this:

```
systemctl start &lt;service-name&gt;
```
### 3. **Stop** a service

To stop a systemd service, you can use the stop option of systemctl command:

```
systemctl stop &lt;service-name&gt;
```
### 4\. Re**start** a service

To restart a service in Linux with systemd, you can use:

```
systemctl restart &lt;service-name&gt;
```
### 5\. Check the status of a service

You can confirm that you have successfully executed a certain action by printing the service status:

```
systemctl status &lt;service-name&gt;
```

This will output information in the following manner:

[![systemctl status](https://itsfoss.com/content/images/wordpress/2019/12/systemctl_status.jpg)](https://itsfoss.com/content/images/wordpress/2019/12/systemctl_status.jpg)systemctl status

hat was systemd. Let’s switch to init now.

systemd vs init Controversy \[A Layman’s Guide\]

Still confused about what is systemd and why it is often at the center of controversy in the Linux world? I try to answer in simpler words.
## Method 2: Managing services in Linux with init

The commands in init are also as simple as system.

You’ll notice that even though your Ubuntu system uses systemd, it is still able to use the service command (intended to be used with init system). This is because `service` command is actually redirected to systemctl. It’s sort of backward compatibility introduced by systemd because sysadmins were habitual of using the service command.

### 1\. List all services

To list all the Linux services, use

```
service --status-all
```

[![service --status-all](https://itsfoss.com/content/images/wordpress/2019/12/service_status_all.png)](https://itsfoss.com/content/images/wordpress/2019/12/service_status_all.png)
service –status-all

The services preceded by **\[ – \]** are **disabled** and those with **\[ + \]** are **enabled**.

### **2\. Start** a service

To start a service in Ubuntu and other distributions, use this command:

```
service &lt;service-name&gt; start
```
### **3\. Stop** a service

Stopping a service is equally easy.

```
service &lt;service-name&gt; stop
```
### 4\. Re**start** a service

If you want to restart a service, the command is:

```
service &lt;service-name&gt; restart
```
### 5\. Check the status of a service

Furthermore, to check if your intended result was achieved, you can output the service status\*\*:\*\*

```
service &lt;service-name&gt; status
```

This will output information in the following manner:

[![service status](https://itsfoss.com/content/images/wordpress/2019/12/service_status.jpg)](https://itsfoss.com/content/images/wordpress/2019/12/service_status.jpg)
service status

This will, most importantly, tell you if a certain service is active **(running)** or not.