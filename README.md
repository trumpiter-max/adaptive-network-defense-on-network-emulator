# Adaptive network defense on network emulator

We have established an **ADS Lab** (aka Adaptive Defense System Lab) to provide a conducive environment for learning network labs or specializing in machine/deep learning.

## Table of contents

- [Adaptive network defense on network emulator](#adaptive-network-defense-on-network-emulator)
  - [Table of contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Get started](#get-started)
    - [Evironment](#evironment)
    - [Setup GNS3](#setup-gns3)
    - [Template](#template)
    - [Command](#command)

## Introduction

This project is used to create environment as project description. The network emulator is created using GNS3 for a working environment and configured using Ansible.

## Get started

### Evironment

In this lab, the project is developed in **Ubuntu 20.04 LTS**, and use GN3 **version 2.2.50** to create network emulator.

### Setup GNS3

Start GNS3 with command `sudo gns3` before running this project because sometimes we test with normal start command `gns3`, ansible playbook won't work to interact gns3.

### Template

To create a template for the GNS3 project, please refer to the [provided link](/gns3-template/README.md) for further information.

### Command

To build & create lab, use command at scenario directory:

```sh
  ansible-playbook lab.yml -e execute=create
```

To stop & delete lab, use command at scenario directory:

```sh
  ansible-playbook lab.yml -e execute=delete
```
