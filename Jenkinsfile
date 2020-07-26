pipeline {
     agent any
     stages {
         stage('Lint HTML') {
              steps {
                 sh 'tidy -q -e *.html'
            }
         }
         stage('Build Docker Image') {
			steps {
					sh '''
						docker build -t udacitycapstoneproject:v3 .
					'''
			}
		}
        stage('Push Image To Dockerhub') {
			steps {
					sh '''
                        docker logout
                    '''    
                    withCredentials([usernamePassword(credentialsId: 'DockerHub', passwordVariable: 'passwordd', usernameVariable: 'username')]) {
					sh 'docker login -u $username -p $passwordd'
				    }
                    sh '''
                        dockerpath=ankit0910/capstone
                        docker tag udacitycapstoneproject $dockerpath:v3
                        echo "Docker ID and Image: $dockerpath"
                        docker push $dockerpath
					'''
			}
		}
        stage('Deploying in EKS')
		{
			steps{
				withAWS(credentials: 'Capstone', region: 'us-west-2')
				{
				sh '''
					aws eks --region=us-west-2 update-kubeconfig --name CapstoneCluster
					kubectl get deployments
					kubectl get pods
					kubectl get services
					kubectl apply -f EKSDeploy.yml
					kubectl rollout status deployments/udacitycapstone-deploy
					kubectl get deployments
					kubectl get pods
					kubectl get services
				'''
				}
			}
		}
     }
}