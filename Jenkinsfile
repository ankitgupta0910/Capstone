pipeline {
     agent any
     stages {
         stage('Create EKS Cluster.') {
             steps {
                 sh './create.sh CapstoneCluster CapstoneCluster.yml CapstoneCluster.json'
             }
         }
         stage('Create conf file cluster') {
			steps {
				withAWS(region:'us-west-2', credentials:'Capstone') {
					sh '''
						aws eks --region us-west-2 update-kubeconfig --name CapstoneCluster
					'''
				}
			}
		}  
     }
}