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
                        docker login --username ankit0910 --password California@15
                        docker tag udacitycapstoneproject $dockerpath:v2
                        echo "Docker ID and Image: $dockerpath"
                        docker push $dockerpath
					'''
			}
		}
        stage('Set current kubectl context') {
			steps {
				withAWS(region:'us-west-2', credentials:'Capstone') {
					sh '''
						kubectl config use-context arn:aws:eks:us-west-2:994362272645:cluster/CapstoneCluster
					'''
				}
			}  
     }
}