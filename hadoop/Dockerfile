FROM archlinux-aur

RUN pacman -Syu --noconfirm
RUN yaourt -S hadoop openssh --noconfirm

RUN echo "export JAVA_HOME=/usr/lib/jvm/default" >> /etc/profile.d/java.sh \
	&& echo "export HADOOP_PREFIX=/usr/lib/hadoop" >> /etc/profile.d/hadoop.sh

RUN /usr/bin/ssh-keygen -A \
	&& sed 's@session\s*include\s*system-remote-login@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd 

# Pseudo-Distributed Operation
RUN echo "<configuration><property><name>fs.defaultFS</name><value>hdfs://localhost:9000</value></property></configuration>" > /etc/hadoop/core-site.xml \
	&& echo "<configuration><property><name>dfs.replication</name><value>1</value></property></configuration>" > /etc/hadoop/hdfs-site.xml \
	&& echo "<configuration><property><name>mapreduce.framework.name</name><value>yarn</value></property></configuration>" > /etc/hadoop/mapred-site.xml \
	&& echo "<configuration><property><name>yarn.nodemanager.aux-services</name><value>mapreduce_shuffle</value></property></configuration>" > /etc/hadoop/yarn-site.xml

RUN echo "\$HADOOP_PREFIX/bin/hdfs namenode -format" >> /start.sh \
	&& echo "\$HADOOP_PREFIX/sbin/hadoop-daemon.sh start namenode" >> /start.sh \
	&& echo "\$HADOOP_PREFIX/sbin/hadoop-daemon.sh start datanode" >> /start.sh \
	&& echo "\$HADOOP_PREFIX/sbin/hadoop-daemon.sh start secondarynamenode" >> /start.sh \
	&& echo "\$HADOOP_PREFIX/sbin/hadoop-daemon.sh start journalnode" >> /start.sh \
	&& echo "\$HADOOP_PREFIX/sbin/yarn-daemon.sh start resourcemanager" >> /start.sh \
	&& echo "\$HADOOP_PREFIX/sbin/yarn-daemon.sh start nodemanager" >> /start.sh \
	&& echo "\$HADOOP_PREFIX/sbin/yarn-daemon.sh start proxyserver" >> /start.sh \
	&& chmod +x /start.sh

RUN chown -R hadoop /usr/lib/hadoop-2.5.2
