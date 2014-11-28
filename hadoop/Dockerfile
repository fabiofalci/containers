FROM archlinux-aur

RUN pacman -Syu --noconfirm
RUN yaourt -S hadoop --noconfirm \
	&& chown -R hadoop /usr/lib/hadoop

RUN echo "export JAVA_HOME=/usr/lib/jvm/default" >> /etc/profile.d/java.sh \
	&& echo "export HADOOP_PREFIX=/usr/lib/hadoop" >> /etc/profile.d/hadoop.sh

RUN pacman -S openssh --noconfirm \
	&& /usr/bin/ssh-keygen -A \
	&& sed 's@session\s*include\s*system-remote-login@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd 

# Pseudo-Distributed Operation
RUN echo "<configuration><property><name>fs.defaultFS</name><value>hdfs://localhost:9000</value></property></configuration>" > /etc/hadoop/core-site.xml \
	&& echo "<configuration><property><name>dfs.replication</name><value>1</value></property></configuration>" > /etc/hadoop/hdfs-site.xml

RUN echo "\$HADOOP_PREFIX/bin/hdfs namenode -format" >> /start.sh \
	&& echo "\$HADOOP_PREFIX/sbin/hadoop-daemon.sh --script "$bin/hdfs" start namenode" >> /start.sh \
	&& echo "\$HADOOP_PREFIX/sbin/hadoop-daemon.sh --script "$bin/hdfs" start datanode" >> /start.sh \
	&& echo "\$HADOOP_PREFIX/sbin/hadoop-daemon.sh --script "$bin/hdfs" start secondarynamenode" >> /start.sh \
	&& echo "\$HADOOP_PREFIX/sbin/hadoop-daemon.sh --script "$bin/hdfs" start journalnode" >> /start.sh \
	&& chmod +x /start.sh
