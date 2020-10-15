# Desciption:

  This lab builds a simple docker app and pushes it to dockerhub. 
  
    The infrasrtucture consists of...
    
      (1) a GITHUB repository
          
      (1) a dockerhub account
  
  
  
  
# Local Deployment

   1. Clone the repo to a local folder
   
      git clone (https://github.com/E-N-G-XOR/mct.git)
      
   2. Run the docker build command
   
      docker build -t mct-web:v1 .
      
   3. Afer the build, deploy it locally
   
      docker run -d -p 80:5000 mct-web:v1

   4. Afer a moments, access the app at: http://localhost:5000
   
      Should be seeing a nice message with "SUCCESS ! " all over it! 
      
# Removal of local Deployment.
   1. Run the following commands...
   
      docker rm -f $(docker ps -a -q)
      docker rmi -f $(docker images -q)

# Automatic Image Updating

By using github actions we can build and push the images automatically every time there is an update to the repository. The image tag is 10 characters of the commit hash, so we can track images version with the code updates...

Images will be taged like so.... (https://hub.docker.com/repository/docker/englotus/mct-web)

TAG   f6fc7b29
      latest
      f35480b0
      190c3274
      3784adbf

The latest tag will always have the current one.... which is the short version of the git commit. So we can track the image to the code change...


 # Deployment to the cloud

 we can use app-deploy.yml to push this image to a k8s cluster. As it is a service and deployment, it doesn't warrent a helm chart.

 # Improvements

 1. Add terrafrom to deloy k8s cluster
 2. make a helm chat if the app gets bigger...
 
