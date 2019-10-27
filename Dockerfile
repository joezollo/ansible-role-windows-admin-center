FROM mcr.microsoft.com/windows/servercore:1903

# Metadata indicating an image maintainer.
LABEL maintainer="joe@zollo.net"

# Add Docker User
RUN NET USER ansible "Password1!" /ADD
RUN NET LOCALGROUP "Administrators" "ansible" /ADD

# Install OpenSSH
RUN powershell -Command \
    Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0 ; \
    Start-Service sshd ;

# Sets a command or process that will run each time a container is run from the new image.
CMD [ "cmd" ]