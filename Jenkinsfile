node {
 def branch = '0.12.0_ADMIN'
 def dockerImagesTagVersion = 'NaV'  
 def registryUrl = env.REGISTRY_URL
 def registryName = env.REGISTRY_NAME
 def registryCredentials = env.REGISTRY_CREDENTIALS
 k8DevContext = 'MOSIP-ADMIN-QA'
 def moduleName = 'admin-ui'

 stage('------- Checkout --------') {
  dir('admin-ui') {
   git branch: branch, credentialsId: 'ajay', url: 'https://github.com/mosip/admin-ui.git'
  }
 }


stage ('---------- build ---------------') {
  dir('admin-ui'){
			sh "npm install && npm run-script build -- --prod --base-href . --output-path=dist "
  }
}


 stage('------ Docker Images : Push & Cleanup -------') {

   dockerImagesTagVersion = "${params.dockerImagesTagVersion}"
   echo dockerImagesTagVersion
    updatedDockerImages = "$registryName/$moduleName:$dockerImagesTagVersion.$BUILD_NUMBER"
     docker.withRegistry(registryUrl, registryCredentials) {
      def buildName = "$registryName/$moduleName:$dockerImagesTagVersion.$BUILD_NUMBER"
      newApp = docker.build(buildName,"./admin-ui/")
      newApp.push()
      newApp.push 'latest'
     }
     /*
     Removing local images
     */
     sh "docker rmi $registryName/$moduleName:$dockerImagesTagVersion.$BUILD_NUMBER"
    /*
     Removing all untagged images
     */
    sh "docker rmi \$(docker images | awk '/<none>/ {print \$3}') || true"

  }


    stage('Kubernetes Deploy : QA'){
      //this stage will rollout the changes on Kubernetes Cluster
      sh "kubectl config use-context $k8DevContext"
        echo "Updating [ Service:$moduleName]"
        sh "kubectl set image deployment/$moduleName $moduleName=$updatedDockerImages"
        
      echo "Getting list of all services" 
      sh "kubectl get pods"
    }
    
	}
