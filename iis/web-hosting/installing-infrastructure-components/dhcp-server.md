---
title: "DHCP Server | Microsoft Docs"
author: rick-anderson
description: "You must have a working Dynamic Host Configuration Protocol (DHCP) server with an active scope on the network because Windows Deployment Services uses Pre-Bo..."
ms.author: aspnetcontent
manager: wpickett
ms.date: 01/22/2008
ms.topic: article
ms.assetid: 
ms.technology: dotnet-webforms
ms.prod: .net-framework
msc.legacyurl: /learn/web-hosting/installing-infrastructure-components/dhcp-server
msc.type: authoredcontent
---
DHCP Server
====================
by Walter Oliver

## Prerequisites

You must have a working Dynamic Host Configuration Protocol (DHCP) server with an active scope on the network because Windows Deployment Services uses Pre-Boot Execution Environment (PXE), which relies on DHCP for IP addressing.

## Installation

When you deploy Dynamic Host Configuration Protocol (DHCP) servers on your network, you can automatically provide client computers and other TCP/IP based network devices with valid IP addresses. You can also provide the additional configuration parameters these clients and devices need, called DHCP options, that allow them to connect to other network resources, such as DNS servers, WINS servers, and routers. For detailed information see the [DHCP Server in the Windows Server 2008 Technical Library](http://technet2.microsoft.com/windowsserver2008/en/servermanager/dhcpserver.mspx "DCHP Server"). For details on installing and configuring see [Installing the DHCP Server Role.](http://technet2.microsoft.com/windowsserver2008/en/library/f4b5d8bd-46b0-41da-a7a7-2bea1233c1461033.mspx "Installing the DHCP Server Role")

**To install DHCP server role:** 

1. Click Start, and then click Server Manager.
2. Under Roles Summary, click Add roles, and then click Next.
3. On the Select Server Roles page, select the DHCP Server check box, and then click Next.

**Important**:

- If Microsoft DHCP is installed on the same physical computer as Windows Deployment Services, the WDS configuration wizard does the following (if you configure Windows Deployment Services by using WDSUTIL, you have to manually make these changes):

    - Adds DHCP option tag 60, with the PXE client setting selected, to all DHCP scopes (as a DHCP global option). This is necessary so that a booting PXE client can be notified that there is a listening PXE server on the network.
    - Selects the Do Not Listen on port 67 option. This is necessary so that booting clients can find the DHCP server on the network.
- If you are running Windows Deployment Services and a non-Microsoft DHCP server on the same computer, in addition to configuring the server to not listen on port 67, you must use your DHCP tools to add Option 60 to their DHCP scopes.
- If DHCP is installed on a server that is located in a different sub-net, then you must do one of the following:

    - Recommended: configure your IP Helper tables. All DHCP broadcasts on UDP port 67 by client computers should be forwarded directly to both the DHCP server and the Windows Deployment Services PXE server. Also, all traffic to UDP port 4011 from the client computers to the Windows Deployment Services PXE server should be routed appropriately (these requests direct traffic to the server, not broadcasts).
    - Add DHCP options 66 and 67. For more information, see the PXE Boot chapter at https://go.microsoft.com/fwlink/?LinkId=88439.