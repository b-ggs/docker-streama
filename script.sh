export STREAMA_VERSION=1.1

mkdir "/app"

wget "https://github.com/dularion/streama/releases/download/v${STREAMA_VERSION}/streama-${STREAMA_VERSION}.war" -O "/app/streama.war"
cat <<__END__ >/app/application.yml
environments:
    production:
        dataSource:
            driverClassName:  'org.h2.Driver'
            url: jdbc:h2:/data/streama;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE
            username: root
            password: root
        server:
            port: 8080
__END__
rm -f /tmp/script.sh 

