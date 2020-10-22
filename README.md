# Desciption:

  This repo contains code to solutionize these questions....
  
    The infrasrtucture consists of...
    
      (1) a GITHUB repository
          
      (1) a dockerhub account
  
  
# Local Deployment

   1. Clone the repo to a local folder
   
      git clone (https://github.com/E-N-G-XOR/mct.git)
      
   2. Run the docker registry script to deploy a local repo.
   
      deploy_registry.sh

   3. Run the docker build command with the docker file in the app folder to built a hello App.
   
      docker build -t mct-web:v1 .  
      
   4. Afer the build, deploy it to the local repo using the push image script.
   
      push_image.sh
 
      Afer a moments, the image will be available for deployment in the repo.


# Taggin scheme...

   My taging scheme is based on the commit hash. The first 8 characters of the commit hash are used for the tag of the docker image. 
         ---
         $ git log
         commit dd7a1e84be8155c953a494502238341e73765a1f (HEAD -> main, origin/main, origin/HEAD)
         Author: X Eng <xeng688@gmail.com>
         Date:   Thu Oct 15 23:52:15 2020 +0100

            Update readme

         commit 4381c0463586f85250e168c477a010e92e866738
         Author: X Eng <xeng688@gmail.com>
         Date:   Thu Oct 15 23:48:11 2020 +0100

            Adding deployment files

         commit 669dc99d79bf426c56e9b5b32445d6012ef544f0
         Author: X Eng <xeng688@gmail.com>
         Date:   Thu Oct 15 23:42:20 2020 +0100

            Update Readme.txt

         commit 3784adbf9e2349571efe0bb52a03c481c13da6a9
         Author: X Eng <xeng688@gmail.com>
         Date:   Thu Oct 15 23:36:58 2020 +0100

            SECOND Change

         commit f35480b0da5cec2880ca6479350618fdc9b0da39
         Author: X Eng <xeng688@gmail.com>
         Date:   Thu Oct 15 23:36:12 2020 +0100

            SECOND Change
         ---

      The tags for the most recent image for the latest commit will be "dd7a1e84".
   
# Acceptance Critiria

   ## Question 1

   ###1. Run a docker registry on your machine (https://docs.docker.com/registry/deploying/): docker run -d -p 5000:5000 --restart=always --name registry registry:2

      The "deploy_registry.sh" will do this for us.

   ###2. Create a simple "Hello World" web app in a language of your choice. Create a docker file, and a script that builds an image and pushes it to the registry. Run the script.

      The docker file in the "App" folder contains the files required for building the app.

   ###3. Change your app to print a different message, build another image and push it to the registry.

      This was done and can be tracked by commits to this repo.
   
   ###4. Make sure tags are different and reflect code changes - there is an easy way to tie image tag with code revision.

      Normally a Short hash is used for the taging so we can link code commits to a partical image being built. The script "push_image - v2.sh" is an example of this.
   
   ###5. Make one more code change and push another tag.
   

   ###6. Write another script that queries the docker repo and returns latest image tag.

      The script "get_latest_tag.sh" is an example of this based on a numbered tag, we can sort for the highest value. When using hashing tags, it's a bit more complicated to do....
   
   ###7. Document in a README.md file your image tagging scheme.


   
   ###8. You can use any scripting language, tagging convention.
   
   ###9. Use an infrastructure as code tool of your choice (e.g. Terraform) to create a place to deploy your image to, on your infrastructure of choice (GCE or AWS preferred).

      The terraform folder contains terraform code to deploy a eks cluster in AWS...
   
   ###10. Then create the means of deployment of your image to said infrastructure. For example, if you were using kubernetes, helm could be used to install your image to the cluster.

      I would use a github actin to deploy the code, I have one which I use that is included in the "yml" folder. 
         There are two actions: 
           1. eks.yml - It uses terraform cloud to deploy terraform code to AWS.
           2. aws-deploy.yml, which will build our image and push to the cluster.

   ##Question 2

   ###Please submit a PowerPoint slides describing a system (from a dev-ops perspective) that you have worked on with a focus on
      1. Focus on overall system thinking
      2. Design decisions
      3. Interfaces
      4. Build process
      5. Testing
      6. Identify brittle parts of the system – performance

      Slides can be found in the docs folder.  "docs/Application monitoring.pptx"

   ##Question 3

   ###Can you explain a CI pipeline you have worked on and the challenges you faced and how you overcame them?

   A explanation on the pipeline I rebuilt can be found in the docs folder.  "docs/pipeline.txt"


 
