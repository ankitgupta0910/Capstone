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
						docker build -t udacitycapstoneproject:v2 .
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
                        docker login --username ankit0910 --password California@15
                        docker tag udacitycapstoneproject $dockerpath:v2
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