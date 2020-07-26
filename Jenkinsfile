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
                        dockerpath=ankit0910/capstone
						docker logout
                    '''    
                    withCredentials([usernamePassword(credentialsId: 'DockerHub', passwordVariable: 'passwordd', usernameVariable: 'username')]) {
					sh 'docker login -u $username -p $passwordd'
				    }
                    sh '''
                        docker tag udacitycapstoneproject $dockerpath:v3
                        echo "Docker ID and Image: $dockerpath"
                        docker push $dockerpath
					'''
			}
		}
        stage('Deploying in EKS')
		{
			steps{
				withAWS(credentials: 'CapStone', region: 'us-west-2')
				{
					sh 'aws eks --region=us-west-2 update-kubeconfig --name CapstoneCluster'
					sh 'kubectl apply -f EKSDeploy.yml'
				}
			}
		}
     }
}