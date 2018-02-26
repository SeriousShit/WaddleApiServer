pipeline {
  agent any
  stages {
    stage('Git') {
      steps {
        git(url: 'https://github.com/SeriousShit/WaddleApiServer.git', branch: 'master', changelog: true)
      }
    }
    stage('Build') {
      steps {
        echo 'test'
      }
    }
  }
}