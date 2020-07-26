pipeline {
     agent any
     stages {
         stage('Create EKS Cluster.') {
             steps {
                 withAWS(region:'us-west-2', credentials:'Capstone') {
                     sh './create.sh CapstoneCluster CapstoneCluster.yml CapstoneCluster.json'
                }
            }
        }
     }
}