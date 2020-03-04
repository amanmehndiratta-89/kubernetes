pipeline {
    agent any 	
	environment {
		
		PROJECT_ID = 'kubernetes-253920'
                CLUSTER_NAME = 'kuberenetes-final'
                LOCATION = 'us-central1-c'
                CREDENTIALS_ID = 'aman1985kumar'		
	}
	
    stages {	
	   stage('Scm Checkout') {            
		steps {
                  checkout scm
		}	
           }
           
	   stage('Build') { 
                steps {
                  echo "Cleaning and packaging..."
                  sh 'mvn clean package'		
                }
           }
	   stage('Test') { 
		steps {
	          echo "Testing..."
		  sh 'mvn test'
		}
	   }
	   stage('Build Docker Image') { 
		steps {
                   script {
                      myimage = docker.build("gcr.io/kubernetes-253920/amancloud1985/apache-ubuntu:v1")
                   }
                }
	   }
	   stage("Push Docker Image") {
                steps {
                   script {
                      docker.withRegistry('https://gcr.io', 'gcrprojectname') {
                            myimage.push("v1")
                     }
                   }
                }
            }
	   
           stage('Deploy to K8s') { 
                steps{
                   echo "Deployment started ..."
                   step([$class: 'KubernetesEngineBuilder', projectId: env.PROJECT_ID, clusterName: env.CLUSTER_NAME, location: env.LOCATION, manifestPattern: 'deployment.yaml', credentialsId: env.CREDENTIALS_ID, verifyDeployments: true])
		   echo "Deployment Finished ..."
            }
          }
    }
}

