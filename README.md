# 🧪 virus-gen.sh by ne0mesys

***This script has been created by ne0mesys and serves as an automation tool to help speed up the malware testing process. I hope you guys like it ;)***

## Welcome
This software allows pentesters to create a backdoor for Android and Windows devices in order to test and exploit vulnerabilities found. It is not a **C&C (Command & Control)** tool, it is just a simple tool that creates backdoors, for the pentester to use in a penetration test. This software uses the tool **msfvenom** from Kali Linux, it is just an automation tool.

This tool is developed strictly for educational and ethical purposes. I DO NOT take any responsibility for the misuse of this tool.

By ne0mesys

## Requirements

### For Windows

In order to use any Bash script in Windows you will first need to install the **WSL (Windows Subsystem for Linux)** extension in the powershell. 

Open the command prompt and enter the following commands:

```
wsl --install
```

Once inside the **WSL** you will need to install the **msfvenom** tool from the **Metasploit Framework**. If you don't have it installed, please, click on the next link.

👉 [Tutorial Metasploit installation](https://www.kali.org/tools/metasploit-framework/)

In case you have it installed, you can continue to the next step.

### For Linux & Arch Linux

In order to use this script you will need to have the **Metasploit Framework** installed. If you don't have it installed, please, click on the next link.

👉 [Tutorial Metasploit installation](https://www.kali.org/tools/metasploit-framework/)

In case you have it installed, you can continue to the next step.


## Installation

### For Windows 

You just need to download the ***virus-gen.sh*** file. 

### For Linux

Here's a short documentation about how to install the script for Linux users:

```
sudo apt install git
sudo git clone https://github.com/ne0mesys/virus-gen
cd virus-gen
```

### For Arch Linux

Here's a short documentation about how to install the script for Arch Linux users:

```
sudo pacman -S git
sudo git clone https://github.com/ne0mesys/virus-gen
cd virus-gen
```

## Execution

### For Windows, Linux & Arch Linux

Once we are in the same folder of the software, we can proceed to enable its execution. We can do this with the following command:

```
sudo chmod +x virus-gen.sh
```

The software includes the Shebang line, #!/bin/bash which allows the user to execute it directly. we can do this using the command ```./virus-gen.sh```

Howeveer, it would be necessary to have the script always in the same directory we are in. Therefore, I highly suggest you to move a copy with execution permits to the $PATH, so we can use it as the command:
```virus-gen```

In order to do this perform the next commands in the terminal:

```
sudo chmod +x virus-gen.sh
sudo cp virus-gen.sh /usr/local/bin/virus-gen
```

**Now you are able to use the script as a command in the terminal!**

**Try it with the command** ```virus-gen```

## About 

This software has been created in order to enhance and speed up the process of the creation of malware / backdoor for penetration testing purposes. It is a sipmle software that does not support the option of **C&C (Command & Control)**. It is encoded in **shell** for **Linux** and **Windows** users.

This script rather than just create a really weak virus, enhances the idea to every user of creating their own backdoor, which means that it serves in a way as an inspiration tool for penetration testers. 

## Author 

* Ne0mesys

Feel free to open an Issue...

```
E-Mail me at: ne0mesys.acc@gmail.com
```
