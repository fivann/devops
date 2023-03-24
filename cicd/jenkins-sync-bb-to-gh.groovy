pipeline {
    agent any

    environment {
        BITBUCKET_REPO_URL = 'https://username@bitbucket.org/username/bitbucket_repo.git'
        GITHUB_REPO_URL = 'https://github.com/username/github_repo.git'
    }

    stages {
        stage('Clone Bitbucket Repository') {
            steps {
                git branch: '*/**', url: env.BITBUCKET_REPO_URL, credentialsId: 'bitbucket-credentials'
            }
        }

        stage('Fetch All Branches') {
            steps {
                sh 'git fetch --all'
            }
        }

        stage('Push to GitHub Repository') {
            steps {
                withCredentials([string(credentialsId: 'github-token', variable: 'GITHUB_TOKEN')]) {
                    sh """
                        git remote add github ${env.GITHUB_REPO_URL}
                        git config --global user.name 'Your GitHub Username'
                        git config --global user.email your@email.com
                        git config --global credential.helper '!echo password=\$GITHUB_TOKEN; echo'
                        git fetch --all --prune
                        git push --force --all github
                        git push --force --tags github
                    """
                }
            }
        }
    }
}

// В этом обновленном скрипте:

// В разделе 'Push to GitHub Repository', мы заменили блок withCredentials с использованием типа usernamePassword на тип string.
// Мы удалили переменную GITHUB_USERNAME и вместо этого установили имя пользователя и адрес электронной почты напрямую в git config.
// Мы изменили git config --global credential.helper для использования переменной GITHUB_TOKEN в качестве пароля.
// Чтобы настроить токен авторизации GitHub в Jenkins:

// Создайте персональный токен доступа (PAT) на GitHub, перейдя в 'Settings' > 'Developer settings' > 'Personal access tokens' > 
// > 'Generate new token'. Убедитесь, что вы предоставили необходимые разрешения для токена.
// В Jenkins, добавьте учетные данные для токена GitHub, перейдя в 'Credentials' > 'System' > 'Global credentials' > 'Add Credentials'.
// Выберите 'Secret text' в качестве типа учетных данных.
// Введите свой персональный токен доступа в поле 'Secret'.
// Установите 'ID' на github-token.


