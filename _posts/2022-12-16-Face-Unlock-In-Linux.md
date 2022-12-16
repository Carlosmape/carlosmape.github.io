---
layout: post
title: Linux and face recognition authorization
description: How to configure Face recognition in linux using FOSS to avoid usage of passwords
tags: ["Security", "Linux"]
---

# Be a superuser with Face recognition in Linux
In this post I cover an overview of face recognition system in Linux to stop user being writing their password every time it is needed.

## Howdy
[Howdy](https://github.com/boltgolt/howdy) provides authentication based on IR emitters and camera facial recognition to prove who you are.

Installation instructions can be found in the github repository as well as some configurations and how to setup your own face in the system.

In order to debug the process, Howdy could be configured to enable notifications while face-recognition succeeds (for more information take a look at the [Howdy's github repository](https://github.com/boltgolt/howdy)):
```
[core]
# Print that face detection is being attempted
detection_notice = true

# Do not print anything when a face verification succeeds
no_confirmation = true
```

### SlimbookFace a GUI for Howdy
[SlimbookFace](https://github.com/Slimbook-Team/slimbookface) is a project from Slimbook community is based on [Howdy](#Howdy) is a simple GUI interface to configure it. 

### Security tips
Howdy developers suggest to do not use just Howdy as authentification method. Also, to minimize the chance of this program being compromised, it's recommended to leave Howdy in `/lib/security` and to keep it read-only.


In addition, notice that Howdy could be configured to store either failed and sucessful attempts of recognition. These snapshots are stored in your system in `/lib/security/howdy/snapshots/` (it could be in read-only, yes, but someone could print them in high resolution and could broke your system's security!)

To disable this option just edit Howdy configuration file as follows:
```
[snapshots]
# Capture snapshots of failed login attempts and save them to disk with metadata
# Snapshots are saved to the "snapshots" folder
capture_failed = true

# Do the same as the option above but for successful attempts
capture_successful = false
```

## Pluggable Authentication Modules - PAM
I am not to deeply explain this concept, but it is worth to mention it, because it is needed to make Howdy works:

PAM separates the standard and specialized tasks of authentication from applications. Programs such as login, gdm, sshd, ftpd, and many more all want to know that a user is who they say they are, yet there are many ways to do that. A user can provide a user name and password credential which can be stored locally or remotely with LDAP or Kerberos. A user can also provide a fingerprint, face recognition or a certificate as a credential. It would be painful to ask each application developer to rewrite the authentication checks for each new method. A call to PAM libraries leaves the checks to authentication experts. PAM is pluggable in that we can have different applications run different tests and modular in that we can add new methods with new libraries.

There is a complete [guide made by RedHat to know more about PAM](https://www.redhat.com/sysadmin/pluggable-authentication-modules-pam).

### sudo
PAM could be configured using `/etc/pam.d` configuration files. To allow i.e. `sudo` command to allow authentication using Howdy, it is needed to edit file `/etc/pam.d/sudo` (remember to edit it as a super user) and simply add a line at the begining of the file like this:
```
# PAM-1.0
auth    sufficient pam_python.so /lib/security/howdy/pam.py
[...]
```
This line indicates PAM system to allow usage of `pam_python` library that Howdy uses to implement their face recognition. In case this method fails, PAM will use following defined lines (because of it, it is important to place this line in the first place), trying the default defined authentication methods (ask user for the password in the terminal)

### Polkit
Another configuration files could be include above indicated line to able face-recognition method, such as `/etc/pam.d/polkit-1` that is used by `pkexec` (a command to ask for user authorization at GUI level used for example by graphic tools such as GUI package managers)

### Session managers
Session managers could be configured as well. In my case, I use `lightdm` session manager, so in my `pam.d` folder I have the `lightdm` file. To allow face-racognition, simply add de the same line indicated in the previous sections.



