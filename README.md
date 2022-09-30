# my macOS setup

## iCloud

1. Login iCloud
2. Login App Store
3. Enable Free Download (iCloud > Media & Purchases)

## Xcode

- Open Terminal from Spotlight (Command + Space)

#+BEGIN_SRC
xcode-select —install
#+END_SRC

## Terminal

- Full Disk Access for Terminal (System Preferences > Security & Privacy > Privacy > Full Disk Access: add Terminal)

## Hostname, Policy, Homebrew

- Setup my config

#+BEGIN_SRC 
sh setup_my_config.sh
#+END_SRC

- Setup hostname, disable Policy, install Homebrew

#+BEGIN_SRC 
sh setup_config.sh
#+END_SRC

## Python, Ansible

- Install python, setup ansible

#+BEGIN_SRC
sh setup_python.sh
#+END_SRC

## App Store

- Install app from App Store

#+BEGIN_SRC 
sh appstore.sh
#+END_SRC

## App Brew

- Install app from App Brew

#+BEGIN_SRC 
sh appbrew.sh
#+END_SRC
