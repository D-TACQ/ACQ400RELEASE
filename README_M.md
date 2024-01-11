# ACQ400RELEASE

# create the main release from here.

# users: https (readonly) access to github:

./scripts/make.release

# ACQ400RELEASE.M
With read/write access to github:
```
cd ACQ400_ESW_TOP
git clone git@github.com:D-TACQ/ACQ400RELEASE.git ACQ400RELEASE.M
cd ACQ400RELEASE.M
# claim ownership of .master_version_host and check it in. eg
```
pgm@hoy6:~/PROJECTS/ACQ400_ESW_TOP/ACQ400RELEASE.M$ cat .master_version_host 
staffa3
```
git clone <master-fpga-url> ACQ400_FPGA
```
# release makes permanent version number

# What's with read and write:

## 1 Every module has a rw development project, conventionally:
```
pgm@hoy6:~$ find PROJECTS/ACQ400/* -name .git -exec grep -H url {}/config \;
PROJECTS/ACQ400/ACQ1001/.git/config:	url = git@github.com:D-TACQ/ACQ1001.git
PROJECTS/ACQ400/ACQ1102/.git/config:	url = git@github.com:D-TACQ/ACQ1102.git
PROJECTS/ACQ400/ACQ2x06/.git/config:	url = git@github.com:D-TACQ/ACQ2x06.git
PROJECTS/ACQ400/acq400_buildroot/.git/config:	url = git@github.com:D-TACQ/acq400_buildroot.git
PROJECTS/ACQ400/ACQ400DRV/.git/config:	url = git@github.com:D-TACQ/ACQ400DRV.git
```

## 2 ACQ400_ESW_TOP master
Masters the ESW_TOP project content: top level is r/w, rest are ro
Check in ESW_TOP top on changes.
```
PROJECTS/ACQ400/ACQ400_ESW_TOP/.git/config:	url = git@github.com:D-TACQ/ACQ400_ESW_TOP.git
PROJECTS/ACQ400/ACQ400_ESW_TOP/.git/config:	url = https://github.com/D-TACQ/ACQ1001
PROJECTS/ACQ400/ACQ400_ESW_TOP/.git/config:	url = https://github.com/D-TACQ/ACQ1002.git
PROJECTS/ACQ400/ACQ400_ESW_TOP/.git/config:	url = https://github.com/D-TACQ/ACQ1014.git
PROJECTS/ACQ400/ACQ400_ESW_TOP/.git/config:	url = https://github.com/D-TACQ/ACQ2x06.git
```

## 3 RELEASE Master
conventionally, this is a completely standard "user" ESW_TOP + ACQ400RELEASE.M
```
PROJECTS/ACQ400_ESW_TOP/.git/config:	url = https://github.com/D-TACQ/ACQ400_ESW_TOP.git
PROJECTS/ACQ400_ESW_TOP/ACQ400RELEASE.M/.git/config:	url = git@github.com:D-TACQ/ACQ400RELEASE.git
```


