Ansible Role: Windows Admin Center
=========

Installs or removes Windows Admin Center on Windows Server or Windows 10. Windows Admin Center is a locally deployed, browser-based app for managing servers, clusters, hyper-converged infrastructure, and Windows 10 PCs. It comes at no additional cost beyond Windows and is ready to use in production.

Requirements
------------
* Windows Server 2012
* Windows Server 2012 R2
* Windows Server 2016 
* Windows Server 2019

Role Variables
--------------

Available variables are listed below, along with default values (see `defaults/main.yml`):

    wac_state: present

The state of Windows Admin Center, present (default) will install the latest version, absent will remove it.

    wac_download_url: https://aka.ms/WACDownload

Download to the MSI Installation file, defaults to Microsoft's CDN which has the latest available versionl.

    wac_download_path: C:\\Windows\\Temp\\wac.msi

The folder and file path where the Windows Admin Center installation artifact is downloaded to.

    wac_sme_port: 8443

The port that Windows Admin Center's HTTP web server will listen on. WAC does not use IIS so watch out for port conflicts.

    wac_ssl_certificate_option: generate

Defines how SSL certificates are handled, installer can generate a self signed certificate (use the value 'generate', which is the default) or use one that's already installed (change value to 'installed').

    wac_sme_thumbprint: 

The thubmprint of the certificate you wish to use for Windows Admin Center's web server. If the certificate option is set to installed, wac_sme_thumbprint is required. Note: There is no default value here.

    wac_product_id: '{65E83844-8B8A-42ED-B78D-BA021BE4AE83}'

Windows Admin Center's MSI Installer ID, only change this if you know what you're doing.

Dependencies
------------

None

Example Playbook
----------------

    - hosts: win_servers
      vars:
        wac_state: present
      roles:
         - joezollo.windows_admin_center

License
-------

WIP

Author Information
------------------

This role was created by Joseph Zollo (joe@zollo.net)
