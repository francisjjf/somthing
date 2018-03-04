From centos:7.2.1511

MAINTAINER jiangjianfei "jiangjianfei@zte.com.cn"

RUN yum -y install gcc automake autoconf libtool make gcc-c++ git wget

RUN wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u141-b15/336fa29ff2bb4ef291e347e091f7f4a7/jdk-8u141-linux-x64.tar.gz"
RUN tar xvzf jdk-8u141-linux-x64.tar.gz -C /opt/

ENV JAVA_HOME /opt/jdk1.8.0_141
ENV PATH $JAVA_HOME/bin:$PATH

RUN echo -e "JAVA_HOME=/opt/jdk1.8.0_141\nPATH=\$JAVA_HOME/bin:\$PATH\nexport JAVA_HOME PATH" > /etc/profile.d/java.sh
RUN chmod -R 755 /opt/jdk1.8.0_141

RUN wget http://apache.fayea.com/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
RUN tar xvzf apache-maven-3.3.9-bin.tar.gz -C /opt/

ENV MAVEN_HOME /opt/apache-maven-3.3.9
ENV PATH $MAVEN_HOME/bin:$PATH

#change the maven source if needed.
RUN echo -e "MAVEN_HOME=/opt/apache-maven-3.3.9\nPATH=\$MAVEN_HOME/bin:\$PATH\nexport MAVEN_HOME PATH" > /etc/profile.d/maven.sh
RUN sed -i "/<mirrors>/a\    <mirror>\n      <id>mymirror</id>\n      <name>my maven</name>\n      <url>http://maven.aliyun.com/nexus/content/groups/public/</url>\n      <mirrorOf>central</mirrorOf>\n    </mirror>" /opt/apache-maven-3.3.9/conf/settings.xml > /opt/apache-maven-3.3.9/conf/settings.xml
RUN chmod -R 755 /opt/apache-maven-3.3.9


RUN git clone https://github.com/rbenv/rbenv.git /usr/local/rbenv
RUN git clone https://github.com/rbenv/ruby-build.git /usr/local/rbenv/plugins/ruby-build
RUN git clone https://github.com/AndorChen/rbenv-china-mirror.git /usr/local/rbenv/plugins/rbenv-china-mirror

ENV RBENV_ROOT /usr/local/rbenv
ENV PATH $RBENV_ROOT/bin:$PATH
RUN eval "$(rbenv init -)"

RUN echo -e 'export RBENV_ROOT=/usr/local/rbenv\nexport PATH="$RBENV_ROOT/bin:$PATH"\neval "$(rbenv init -)"' > /etc/profile.d/rbenv.sh
RUN source /etc/profile
RUN rbenv install jruby-1.7.25
RUN rbenv global jruby-1.7.25
ENV PATH /usr/local/rbenv/shims:$PATH
RUN gem sources -r https://rubygems.org/ -a https://gems.ruby-china.org/
RUN gem install logstash-core -v 5.4.0
RUN chmod -R 777 /usr/local/rbenv

