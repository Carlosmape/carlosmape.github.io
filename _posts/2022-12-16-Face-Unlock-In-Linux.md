---
layout: post
title: Linux and Face Recognition Authorization
description: Configuring face recognition in Linux using open-source software to simplify authentication
categories: ['Personal']
tags: ['Curiosity']
os: ['Linux']
technologies: ['Security']
ides: ['Neo-Vim']
---

# Superuser Access with Face Recognition on Linux

In this post, I’ll guide you through configuring face recognition authentication in Linux, allowing you to bypass password entry in a secure and convenient way using open-source tools.

## Introducing Howdy

[Howdy](https://github.com/boltgolt/howdy) is a free and open-source tool that integrates facial recognition as a form of authentication on Linux systems. It uses infrared (IR) emitters and cameras to verify your identity, offering an alternative to password-based logins.

Installing **Howdy** is straightforward, with clear instructions available on its [GitHub page](https://github.com/boltgolt/howdy). For optimal performance, I recommend using an **IR camera**—especially if your laptop has one built-in, like my [Slimbook Pro X](https://slimbook.es/en/pro-x-en). IR cameras are particularly suited for biometric recognition since they capture depth and distance in 3D, providing better accuracy than standard cameras.

You can even enable real-time debugging notifications to track when facial recognition is being attempted or succeeded by configuring the `detection_notice` and `no_confirmation` options in Howdy’s configuration:

```ini
[core]
# Show a message when face detection is attempted
detection_notice = true

# Disable confirmation messages when a face verification is successful
no_confirmation = true

```

## SlimbookFace: A GUI for Howdy

[SlimbookFace](https://github.com/Slimbook-Team/slimbookface) is a graphical user interface built on top of **Howdy**, developed by the Slimbook community. It simplifies Howdy’s configuration process, offering an accessible way to manage the tool without needing to dive into command-line setup. 

## Security Tips

While Howdy is a powerful tool, it's important to use it responsibly. The developers strongly advise against relying solely on facial recognition for authentication. To reduce the risk of security breaches, Howdy should remain in the `/lib/security` directory, with the folder set to **read-only**.

Another potential security risk comes from the optional feature that stores snapshots of failed (or even successful) login attempts. These images, if stored, could be accessed by an attacker and used maliciously. Therefore, it’s best to disable this option unless you need it for debugging purposes. To do so, modify the `snapshots` section in the configuration file:

```ini
[snapshots]
# Capture snapshots of failed login attempts
capture_failed = true

# Disable snapshot capture for successful logins
capture_successful = false

```

These snapshots are stored in `/lib/security/howdy/snapshots/`, but as an additional safeguard, you can also set this folder to read-only to prevent tampering.

## Pluggable Authentication Modules (PAM)

To make Howdy work seamlessly with Linux authentication, it integrates with **Pluggable Authentication Modules (PAM)**. PAM separates authentication tasks from applications like login managers, SSH, or even sudo. This modular approach allows new authentication methods, like face recognition, to be easily added without rewriting each application’s authentication logic.

For those interested in learning more about PAM, [RedHat's guide](https://www.redhat.com/sysadmin/pluggable-authentication-modules-pam) offers an excellent introduction.

### Enabling Howdy for `sudo`

To use Howdy for authenticating `sudo` commands, you need to edit the PAM configuration for sudo. Open the `/etc/pam.d/sudo` file as a superuser and add the following line at the beginning:

```
# PAM-1.0
auth    sufficient pam_python.so /lib/security/howdy/pam.py

```

This line tells PAM to use Howdy's **pam_python** library for facial recognition. If Howdy fails (e.g., face not recognized), it will fall back to the standard password authentication method defined in subsequent lines.

### Configuring Howdy for Polkit

In addition to `sudo`, you can configure Howdy to work with **Polkit**, which handles graphical authorization prompts. To enable face recognition for graphical tools using Polkit (such as a GUI package manager), edit the `/etc/pam.d/polkit-1` file and add the same line as above.

### Session Manager Integration

You can also integrate Howdy with your session manager for face-based login. For instance, if you’re using **LightDM**, simply edit `/etc/pam.d/lightdm` and add the configuration line to enable face recognition at the login screen.

## Conclusion

By configuring Howdy and integrating it with PAM, you can streamline the login and authorization processes on your Linux system, while ensuring a balance between convenience and security. This project showcases how open-source tools like Howdy can enhance user experience without sacrificing control over system security.

