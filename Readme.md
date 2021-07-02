# Install Git:

Goto https://git-scm.com/download/ and download Git for windows or Mac or Linux/Unix.

Install Git with the recommended settings.

# Install Visual studio Code:

Goto https://code.visualstudio.com/download and download Git for windows or Mac or Linux/Unix.

Install VS code with the recommended settings.

# Install Node JS:

Goto https://nodejs.org/en/download/ for the respective OS.

Install Node JS with the default settings.

# GITHUB setup:

1. Goto https://github.com/ and create a new account using sign-up.
   
## Setup SSH key:

1. Open Git Bash window.
2. Enter  ssh-keygen -t ed25519 -C your_email@example.com
3. Enter file in which to save the key -> prefer to the default location as it does not give access error in further steps.
4. Enter passphrase and the ssh public and private keys are generated on the specified location.
5. Next add the SSH key to Git Hub.
      Reference: https://docs.github.com/en/enterprise-server@3.0/github/authenticating-to-github/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account
      
      - Login to https://github.com/ with your credentials.
      - Copy the SSH public key to your clipboard.
      - In the upper-right corner of any page, click your profile photo, then click Settings.
      - In the user settings sidebar, click SSH and GPG keys.
      - Click New SSH key or Add SSH key.
      - In the "Title" field, add a descriptive label for the new key.
      - Paste your key into the "Key" field.
      - Click Add SSH key.
      - If prompted, confirm your GitHub Enterprise Server password.

## Get the clone URL:

1. Then goto https://github.com/virtualansoftware on a new browser tab.
3. GO down the page and click on the project 'tutorials'.
4. If you have logged in Github you will see a button 'Fork' in the top right corner of the page.
5. Then click on the green button 'Code' and copy the ssh Url.
   git@github.com:<GitHub username>/tutorials.git
   
# Install docsify:

1. Create a folder on any location you prefer. This will be used to edit the tutorials page.
2. Right click and select 'Git Bash Here'.
3. Git bash window will open.
4. Run the below commands one after another.
    - git clone git@github.com:<username>/tutorials.git
    - npm i docsify-cli -g
    - cd tutorials/
    - docsify serve docs
5. Open a browser and goto http://localhost:3000/#/ and you can open Virtualan page. 
    
# To Edit tutorials page:

1. Open Visual studio code window.
2. click File menu -> Open Folder
3. Goto Folder you created to install docsify\Git\tutorials and click Select Folder.
   4. Once you slelect the Tutorials folder, all the paged will be displayed on the Explorer window. 

As you start to EDIT on the Visual studio code window refresh the browser to see the changes (http://localhost:3000/#/).

# How to COMMIT the changes:
1. Exit out of the Git Bash running command Listening at http://localhost:3000
2. Run the below commands for the first time when you commit the changes.
         git config --global user.email "you@example.com"
         git config --global user.name "Your Name"
3. Run 
         git commit -am "updated"
   Add appropriate comments inside the "".
4. Then Run 
         git push

# Create PULL request:
1. Go to "https://github.com/<username>/tutorials/pulls" to create a New Pull request.
2. Click on the Green "New Pull Request" button to create a new request between your master branch to Virtualan Master branch.
