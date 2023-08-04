# Issuing a Certificate Using Certbot

Following are the steps to issue a certificate for your domain using Certbot. Please replace `yourdomain.com` with your actual domain name.

- **Step 1: Run Certbot**

    Initiate the Certbot client with the `--apache` or `--nginx` option, depending on your server setup. For instance:

    ```
    sudo certbot --apache -d yourdomain.com
    ```

    Certbot will communicate with the Let's Encrypt server and create a Certificate Signing Request (CSR) for your domain.

- **Step 2: Complete the Interactive Prompts**

    Certbot will prompt you to provide an email address for urgent notices and lost key recovery. After entering the email address, you'll need to agree to the Terms of Service.

- **Step 3: Verify the Domain Ownership**

    Let's Encrypt verifies that you control the domain by providing a challenge. Certbot automatically creates a temporary file with the required content in your web server's document root. Let's Encrypt then accesses this file over HTTP. If the file is found and has the correct content, it means the domain is validated.

- **Step 4: Choose Between Enabling Both HTTP and HTTPS or HTTPS Only**

    If your setup is correct and the challenge is successful, Certbot will ask whether you want to configure your website to support both HTTP and HTTPS, or HTTPS only. Choose as per your requirement. 

- **Step 5: Test Automatic Renewal**

    Let's Encrypt certificates are valid for 90 days. However, Certbot includes a script to automatically renew the certificates before they expire. You can test the renewal script with a dry run like so:

    ```
    sudo certbot renew --dry-run
    ```

    If the test successfully completes without any errors, your certificates will automatically renew in the background before they expire.


  
