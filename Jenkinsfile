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
						docker build -t udacitycapstoneproject:v1 .
					'''
			}
		}
        stage('Push Image To Dockerhub') {
			steps {
					sh '''
                        dockerpath=ankit0910/capstone
						docker logout
                        docker login --username ankit0910 --password California@15
                        docker tag udacitycapstoneproject $dockerpath:v1
                        echo "Docker ID and Image: $dockerpath"
                        docker push $dockerpath
					'''
			}
		}  
     }
}