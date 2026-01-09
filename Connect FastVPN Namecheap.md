### How to set up OpenVPN on Debian  

The following are required for OpenVPN to work on Debian 12:  

****

-   A working installation of Debian 12 running the GNOME Desktop Environment;
-   **Access to you FastVPN [account panel](https://www.namecheap.com/support/knowledgebase/article.aspx/10387/2274/how-to-access-fastvpn-account-panel/) in order to get your network credentials;**
-   A secure FastVPN connection (Don’t have one? [Sign up here!](https://www.namecheap.com/vpn/)).

Follow the steps below to configure OpenVPN in Debian 12:  
  
1\. Upload a config file that defines the settings or preferences for the OpenVPN connection.  
  
You can download all of the config files for all of our servers from the FastVPN [Account Panel](https://account.fastvpn.com) or directly at [https://vpn.ncapi.io/groupedServerList.zip](https://www.namecheap.com/support/knowledgebase/article.aspx/10415/2271/how-to-set-up-openvpn-on-debian//”https://vpn.ncapi.io/groupedServerList.zip")  


**  

![](https://Namecheap.simplekb.com/SiteContents/2-7C22D5236A4543EB827F3BD8936E153E/media/FastVPN_NewLink_Debian.png)

  

2\. Click the **Extract** button in the Archive Manager window that appears.

  

3\. Select **Documents** on the left and click **Extract** to extract the OpenVPN config files into your Documents folder.

  
4\. Choose **Activities** at the top of the screen and type **Terminal** in the search box. Click the Terminal icon to launch a Terminal window:  

  

![](https://Namecheap.simplekb.com/SiteContents/2-7C22D5236A4543EB827F3BD8936E153E/media/FastVPN_Debian_upd_1.png)

  

5\. Enter the following command to switch to the root user to allow installing the needed OpenVPN packages:

  

*su root*

  

Next, you will be prompted to enter the password for root:  
  

![](https://Namecheap.simplekb.com/SiteContents/2-7C22D5236A4543EB827F3BD8936E153E/media/FastVPN_Debian_upd_2.png)

  

6\. Use the following command to install the needed OpenVPN packages:

  

*apt-get install -y openvpn network-manager-openvpn network-manager-openvpn-gnome*

  

![](https://Namecheap.simplekb.com/SiteContents/2-7C22D5236A4543EB827F3BD8936E153E/media/FastVPN_Debian_upd_3.png)

  

After the packages are installed, you should see the output similar to what is shown below.  

  

Please report any errors to our [Support Team](https://www.namecheap.com/help-center/live-chat) so we can help you troubleshoot any issues.  

  

![](https://Namecheap.simplekb.com/SiteContents/2-7C22D5236A4543EB827F3BD8936E153E/media/FastVPN_Debian_upd_4.png)  

  

7\. Close the Terminal window and click on the power button icon at the top of the screen in the upper right. Click the Power button in the menu that appears and choose **Restart**:  

  

![](https://Namecheap.simplekb.com/SiteContents/2-7C22D5236A4543EB827F3BD8936E153E/media/FastVPN_Debian_upd_5.png)  
  
![](https://Namecheap.simplekb.com/SiteContents/2-7C22D5236A4543EB827F3BD8936E153E/media/FastVPN_Debian_upd_6.png)  
  
![](https://Namecheap.simplekb.com/SiteContents/2-7C22D5236A4543EB827F3BD8936E153E/media/FastVPN_Debian_upd_7.png)

  

8\. Click on the network connections icon at the top of your screen and click the Settings gear button in the menu that appears:  

  

![](https://Namecheap.simplekb.com/SiteContents/2-7C22D5236A4543EB827F3BD8936E153E/media/FastVPN_Debian_upd_8.png)  

  

9\. Select **Network** from the left menu and then click the **\+** button in the Network window to add a new connection:

  

![](https://Namecheap.simplekb.com/SiteContents/2-7C22D5236A4543EB827F3BD8936E153E/media/FastVPN_Debian_upd_9.png)  

  

10\. Choose **Import from file...** in the Add VPN window that appears.

  

![](https://Namecheap.simplekb.com/SiteContents/2-7C22D5236A4543EB827F3BD8936E153E/media/FastVPN_Debian_upd_10.png)  

  
11\. Select the config file (saved earlier in our Documents folder) that matches your desired VPN server location and click the **Open** button (the naming for our config files is *NCVPN-COUNTRY-City.ovpn*). In our example, we are using the *NCVPN-CA-Toronto.ovpn config file.*

  

![](https://Namecheap.simplekb.com/SiteContents/2-7C22D5236A4543EB827F3BD8936E153E/media/FastVPN_Debian_upd_11.png)  

  
12\. In the Add VPN window that appears, enter the details as given below:  

  

-   **Name**: enter your desired description of theVPN connection
-   **Type**: should be set to Password
-   **User name:**  your FastVPN account name from the he FastVPN [Account Panel](https://account.fastvpn.com)
-   **Password:** your FastVPN account password from the he FastVPN [Account Panel  
      
    ](https://account.fastvpn.com)

Once done, click the **Add** button:  

  

![](https://Namecheap.simplekb.com/SiteContents/2-7C22D5236A4543EB827F3BD8936E153E/media/FastVPN_Debian_upd_12.png)  

  

13\. Move the toggle switch to the right of your newly created VPN connection:  
  

![](https://Namecheap.simplekb.com/SiteContents/2-7C22D5236A4543EB827F3BD8936E153E/media/FastVPN_Debian_upd_13.png)  

  

14\. Once the FastVPN connection is established, you will see the padlock icon in the top right of your screen and the toggle switch for your VPN connection will turn blue to indicate that it is active and connected:

  

![](https://Namecheap.simplekb.com/SiteContents/2-7C22D5236A4543EB827F3BD8936E153E/media/FastVPN_Debian_upd_14.png)  

  

To confirm that your IP address has changed to an anonymous private FastVPN, open your favorite web browser and go to [https://www.namecheap.com/vpn/what-is-my-ip/](https://www.namecheap.com/vpn/what-is-my-ip/)

  

15\. To disconnect from FastVPN, click the padlock or the network connection icon in the top right of your screen and then click on the name of your VPN connection in the menu that appears. To proceed, choose **Turn Off**. After the VPN is disconnected the padlock icon will disappear letting you know you have successfully disconnected:

  

![](https://Namecheap.simplekb.com/SiteContents/2-7C22D5236A4543EB827F3BD8936E153E/media/FastVPN_Debian_upd_15.png)
