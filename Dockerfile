FROM mcr.microsoft.com/windows/servercore:ltsc2019

# Metadata indicating an image maintainer.
LABEL maintainer="joe@zollo.net"

# Add Docker User
RUN NET USER ansible "Password1!" /ADD
RUN NET LOCALGROUP "Administrators" "ansible" /ADD

# Install OpenSSH
RUN powershell -Command \
    Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')); \
    choco install openssh -y -params '"/SSHServerFeature"' ;

# Sets a command or process that will run each time a container is run from the new image.
CMD [ "cmd" ]