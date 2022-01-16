pipeline {
    agent any
    tools {
        maven "maven-3"
    }
    environment {
        DOCKERHUB_CREDENTIALS = credentials('ngthanhdat-dockerhub')
    }
    stages {
    	stage('SCM checkout'){
    		steps{
    			git branch: 'main', url: 'https://github.com/ngthanhdatt/War-in-DockerJboss.git'
    		}
    	}
        stage('Build'){
            steps{
           		sh 'mvn compile package'
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker build -t loginappjboss:latest .'
                sh 'docker tag loginappjboss ngthanhdat/loginappjboss:latest'
                sh 'docker login -u $DOCKERHUB_CREDENTIALS_USR -p $DOCKERHUB_CREDENTIALS_PSW'
                sh 'docker push ngthanhdat/loginappjboss:latest'
            }
        }
        stage('Release') {
        	steps {
        	    sh '''ids=$(docker ps -a -q)
                    for id in $ids
                    do
                        echo "$id"
                        docker stop $id 
                    done'''
        		sh 'docker run -dp 8080:8080 -dp 9990:9990 -i ngthanhdat/loginappjboss:latest'
        	}
        }
     }
}
